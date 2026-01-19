Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D358D3A7CE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:05:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5219110E418;
	Mon, 19 Jan 2026 12:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KbPtskDD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D616310E405;
 Mon, 19 Jan 2026 12:05:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 434134450A;
 Mon, 19 Jan 2026 12:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0661C2BC87;
 Mon, 19 Jan 2026 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768824317;
 bh=2ZahzXGejqZKqYaU9jPgyBkxHVUCgbuE2WJJNrLru4o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KbPtskDDj53yIsH9dzAgzFzL0GpcaNljKAEvErrxQZ+WUk0VZvLy6jxV+qwN8Oz7T
 0swqNtmiC8stm0NH6CiDYEXOKyfjGzJCJWKoZ+WBsw2M03WptXv63x9WgBhKG/RZDc
 Avm6pFJCsvrlpUf3Zm4SzDqq0xPNK94sngFLciDH/JGvakL71AseeE7TUXIes6dSvb
 n092W4ncZ11tzxakktY93DlPVIZ38nTbEuNT4ntqMN24IfMVSkj6/5WyzjR4v4zyAg
 l8HpcjawBY0z0hFw7rhfEfmYHURzOVaH4o8XXEox919Xnz7CaeE7Feh56Psjeyx2PM
 BR5EeGK1X8IUw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1vho0Q-00000001ZjV-3nDC; Mon, 19 Jan 2026 13:05:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Alex Shi <alexs@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>,
 Carlos Bilbao <carlos.bilbao@kernel.org>,
 Chenguang Zhao <zhaochenguang@kylinos.cn>,
 David Airlie <airlied@gmail.com>, David Disseldorp <ddiss@suse.de>,
 Dongliang Mu <dzm91@hust.edu.cn>, Federico Vaga <federico.vaga@vaga.pv.it>,
 Gang Yan <yangang@kylinos.cn>, Hu Haowen <2023002089@link.tyut.edu.cn>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Rostedt <rostedt@goodmis.org>, Tamir Duberstein <tamird@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Vincent Mailhol <mailhol@kernel.org>, WangYuli <wanyl5933@chinaunicom.cn>,
 Yanteng Si <si.yanteng@linux.dev>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 6/9] docs: kdoc: move kernel-doc to tools/docs
Date: Mon, 19 Jan 2026 13:05:01 +0100
Message-ID: <311d17e403524349940a8b12de6b5e91e554b1f4.1768823489.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768823489.git.mchehab+huawei@kernel.org>
References: <cover.1768823489.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jonathan Corbet <corbet@lwn.net>

kernel-doc is the last documentation-related tool still living outside of
the tools/docs directory; the time has come to move it over.

[mchehab: fixed kdoc lib location]
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/conf.py                                  |  2 +-
 Documentation/doc-guide/kernel-doc.rst                 |  8 ++++----
 Documentation/kbuild/kbuild.rst                        |  2 +-
 Documentation/process/coding-style.rst                 |  2 +-
 .../translations/it_IT/doc-guide/kernel-doc.rst        |  8 ++++----
 .../translations/sp_SP/process/coding-style.rst        |  2 +-
 .../translations/zh_CN/doc-guide/kernel-doc.rst        | 10 +++++-----
 Documentation/translations/zh_CN/kbuild/kbuild.rst     |  2 +-
 .../translations/zh_CN/process/coding-style.rst        |  2 +-
 .../translations/zh_TW/process/coding-style.rst        |  2 +-
 MAINTAINERS                                            |  2 --
 Makefile                                               |  2 +-
 drivers/gpu/drm/i915/Makefile                          |  2 +-
 scripts/kernel-doc                                     |  1 -
 tools/docs/find-unused-docs.sh                         |  2 +-
 scripts/kernel-doc.py => tools/docs/kernel-doc         |  2 +-
 tools/docs/sphinx-build-wrapper                        |  2 +-
 17 files changed, 25 insertions(+), 28 deletions(-)
 delete mode 120000 scripts/kernel-doc
 rename scripts/kernel-doc.py => tools/docs/kernel-doc (99%)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 1ea2ae5c6276..383d5e5b9d0a 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -582,7 +582,7 @@ pdf_documents = [
 # kernel-doc extension configuration for running Sphinx directly (e.g. by Read
 # the Docs). In a normal build, these are supplied from the Makefile via command
 # line arguments.
-kerneldoc_bin = "../scripts/kernel-doc.py"
+kerneldoc_bin = "../tools/docs/kernel-doc"  # Not used now
 kerneldoc_srctree = ".."
 
 def setup(app):
diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
index b56128d7f5c3..8d2c09fb36e4 100644
--- a/Documentation/doc-guide/kernel-doc.rst
+++ b/Documentation/doc-guide/kernel-doc.rst
@@ -54,7 +54,7 @@ Running the ``kernel-doc`` tool with increased verbosity and without actual
 output generation may be used to verify proper formatting of the
 documentation comments. For example::
 
-	scripts/kernel-doc -v -none drivers/foo/bar.c
+	tools/docs/kernel-doc -v -none drivers/foo/bar.c
 
 The documentation format of ``.c`` files is also verified by the kernel build
 when it is requested to perform extra gcc checks::
@@ -365,7 +365,7 @@ differentiated by whether the macro name is immediately followed by a
 left parenthesis ('(') for function-like macros or not followed by one
 for object-like macros.
 
-Function-like macros are handled like functions by ``scripts/kernel-doc``.
+Function-like macros are handled like functions by ``tools/docs/kernel-doc``.
 They may have a parameter list. Object-like macros have do not have a
 parameter list.
 
@@ -596,8 +596,8 @@ from the source file.
 
 The kernel-doc extension is included in the kernel source tree, at
 ``Documentation/sphinx/kerneldoc.py``. Internally, it uses the
-``scripts/kernel-doc`` script to extract the documentation comments from the
-source.
+``tools/docs/kernel-doc`` script to extract the documentation comments from
+the source.
 
 .. _kernel_doc:
 
diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 82826b0332df..5a9013bacfb7 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -180,7 +180,7 @@ architecture.
 KDOCFLAGS
 ---------
 Specify extra (warning/error) flags for kernel-doc checks during the build,
-see scripts/kernel-doc for which flags are supported. Note that this doesn't
+see tools/docs/kernel-doc for which flags are supported. Note that this doesn't
 (currently) apply to documentation builds.
 
 ARCH
diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index 258158637f65..35b381230f6e 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -614,7 +614,7 @@ it.
 
 When commenting the kernel API functions, please use the kernel-doc format.
 See the files at :ref:`Documentation/doc-guide/ <doc_guide>` and
-``scripts/kernel-doc`` for details. Note that the danger of over-commenting
+``tools/docs/kernel-doc`` for details. Note that the danger of over-commenting
 applies to kernel-doc comments all the same. Do not add boilerplate
 kernel-doc which simply reiterates what's obvious from the signature
 of the function.
diff --git a/Documentation/translations/it_IT/doc-guide/kernel-doc.rst b/Documentation/translations/it_IT/doc-guide/kernel-doc.rst
index aa0e31d353d6..bac959b8b7b9 100644
--- a/Documentation/translations/it_IT/doc-guide/kernel-doc.rst
+++ b/Documentation/translations/it_IT/doc-guide/kernel-doc.rst
@@ -80,7 +80,7 @@ Al fine di verificare che i commenti siano formattati correttamente, potete
 eseguire il programma ``kernel-doc`` con un livello di verbosità alto e senza
 che questo produca alcuna documentazione. Per esempio::
 
-	scripts/kernel-doc -v -none drivers/foo/bar.c
+	tools/docs/kernel-doc -v -none drivers/foo/bar.c
 
 Il formato della documentazione è verificato della procedura di generazione
 del kernel quando viene richiesto di effettuare dei controlli extra con GCC::
@@ -378,7 +378,7 @@ distinguono in base al fatto che il nome della macro simile a funzione sia
 immediatamente seguito da una parentesi sinistra ('(') mentre in quelle simili a
 oggetti no.
 
-Le macro simili a funzioni sono gestite come funzioni da ``scripts/kernel-doc``.
+Le macro simili a funzioni sono gestite come funzioni da ``tools/docs/kernel-doc``.
 Possono avere un elenco di parametri. Le macro simili a oggetti non hanno un
 elenco di parametri.
 
@@ -595,7 +595,7 @@ documentazione presenti nel file sorgente (*source*).
 
 L'estensione kernel-doc fa parte dei sorgenti del kernel, la si può trovare
 in ``Documentation/sphinx/kerneldoc.py``. Internamente, viene utilizzato
-lo script ``scripts/kernel-doc`` per estrarre i commenti di documentazione
+lo script ``tools/docs/kernel-doc`` per estrarre i commenti di documentazione
 dai file sorgenti.
 
 Come utilizzare kernel-doc per generare pagine man
@@ -604,4 +604,4 @@ Come utilizzare kernel-doc per generare pagine man
 Se volete utilizzare kernel-doc solo per generare delle pagine man, potete
 farlo direttamente dai sorgenti del kernel::
 
-  $ scripts/kernel-doc -man $(git grep -l '/\*\*' -- :^Documentation :^tools) | scripts/split-man.pl /tmp/man
+  $ tools/docs/kernel-doc -man $(git grep -l '/\*\*' -- :^Documentation :^tools) | scripts/split-man.pl /tmp/man
diff --git a/Documentation/translations/sp_SP/process/coding-style.rst b/Documentation/translations/sp_SP/process/coding-style.rst
index 025223be9706..7d63aa8426e6 100644
--- a/Documentation/translations/sp_SP/process/coding-style.rst
+++ b/Documentation/translations/sp_SP/process/coding-style.rst
@@ -633,7 +633,7 @@ posiblemente POR QUÉ hace esto.
 
 Al comentar las funciones de la API del kernel, utilice el formato
 kernel-doc. Consulte los archivos en :ref:`Documentation/doc-guide/ <doc_guide>`
-y ``scripts/kernel-doc`` para más detalles.
+y ``tools/docs/kernel-doc`` para más detalles.
 
 El estilo preferido para comentarios largos (de varias líneas) es:
 
diff --git a/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst b/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
index ccfb9b8329c2..fb2bbaaa85c1 100644
--- a/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
+++ b/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
@@ -43,7 +43,7 @@ kernel-doc注释用 ``/**`` 作为开始标记。 ``kernel-doc`` 工具将提取
 用详细模式和不生成实际输出来运行 ``kernel-doc`` 工具，可以验证文档注释的格式
 是否正确。例如::
 
-	scripts/kernel-doc -v -none drivers/foo/bar.c
+	tools/docs/kernel-doc -v -none drivers/foo/bar.c
 
 当请求执行额外的gcc检查时，内核构建将验证文档格式::
 
@@ -473,7 +473,7 @@ doc: *title*
 如果没有选项，kernel-doc指令将包含源文件中的所有文档注释。
 
 kernel-doc扩展包含在内核源代码树中，位于 ``Documentation/sphinx/kerneldoc.py`` 。
-在内部，它使用 ``scripts/kernel-doc`` 脚本从源代码中提取文档注释。
+在内部，它使用 ``tools/docs/kernel-doc`` 脚本从源代码中提取文档注释。
 
 .. _kernel_doc_zh:
 
@@ -482,18 +482,18 @@ kernel-doc扩展包含在内核源代码树中，位于 ``Documentation/sphinx/k
 
 如果您只想使用kernel-doc生成手册页，可以从内核git树这样做::
 
-  $ scripts/kernel-doc -man \
+  $ tools/docs/kernel-doc -man \
     $(git grep -l '/\*\*' -- :^Documentation :^tools) \
     | scripts/split-man.pl /tmp/man
 
 一些旧版本的git不支持路径排除语法的某些变体。
 以下命令之一可能适用于这些版本::
 
-  $ scripts/kernel-doc -man \
+  $ tools/docs/kernel-doc -man \
     $(git grep -l '/\*\*' -- . ':!Documentation' ':!tools') \
     | scripts/split-man.pl /tmp/man
 
-  $ scripts/kernel-doc -man \
+  $ tools/docs/kernel-doc -man \
     $(git grep -l '/\*\*' -- . ":(exclude)Documentation" ":(exclude)tools") \
     | scripts/split-man.pl /tmp/man
 
diff --git a/Documentation/translations/zh_CN/kbuild/kbuild.rst b/Documentation/translations/zh_CN/kbuild/kbuild.rst
index 57f5cf5b2cdd..a477b4b08958 100644
--- a/Documentation/translations/zh_CN/kbuild/kbuild.rst
+++ b/Documentation/translations/zh_CN/kbuild/kbuild.rst
@@ -174,7 +174,7 @@ UTS_MACHINE 变量（在某些架构中还包括内核配置）来猜测正确
 KDOCFLAGS
 ---------
 指定在构建过程中用于 kernel-doc 检查的额外（警告/错误）标志，查看
-scripts/kernel-doc 了解支持的标志。请注意，这目前不适用于文档构建。
+tools/docs/kernel-doc 了解支持的标志。请注意，这目前不适用于文档构建。
 
 ARCH
 ----
diff --git a/Documentation/translations/zh_CN/process/coding-style.rst b/Documentation/translations/zh_CN/process/coding-style.rst
index 0484d0c65c25..5a342a024c01 100644
--- a/Documentation/translations/zh_CN/process/coding-style.rst
+++ b/Documentation/translations/zh_CN/process/coding-style.rst
@@ -545,7 +545,7 @@ Linux 里这是提倡的做法，因为这样可以很简单的给读者提供
 也可以加上它做这些事情的原因。
 
 当注释内核 API 函数时，请使用 kernel-doc 格式。详见
-Documentation/translations/zh_CN/doc-guide/index.rst 和 scripts/kernel-doc 。
+Documentation/translations/zh_CN/doc-guide/index.rst 和 tools/docs/kernel-doc 。
 
 长 (多行) 注释的首选风格是：
 
diff --git a/Documentation/translations/zh_TW/process/coding-style.rst b/Documentation/translations/zh_TW/process/coding-style.rst
index 311c6f6bad0b..e2ba97b3d8bb 100644
--- a/Documentation/translations/zh_TW/process/coding-style.rst
+++ b/Documentation/translations/zh_TW/process/coding-style.rst
@@ -548,7 +548,7 @@ Linux 裏這是提倡的做法，因爲這樣可以很簡單的給讀者提供
 也可以加上它做這些事情的原因。
 
 當註釋內核 API 函數時，請使用 kernel-doc 格式。詳見
-Documentation/translations/zh_CN/doc-guide/index.rst 和 scripts/kernel-doc 。
+Documentation/translations/zh_CN/doc-guide/index.rst 和 tools/docs/kernel-doc 。
 
 長 (多行) 註釋的首選風格是：
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 02ec226dd571..d009e2da2215 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7523,7 +7523,6 @@ S:	Maintained
 P:	Documentation/doc-guide/maintainer-profile.rst
 T:	git git://git.lwn.net/linux.git docs-next
 F:	Documentation/
-F:	scripts/kernel-doc*
 F:	tools/lib/python/*
 F:	tools/docs/
 F:	tools/net/ynl/pyynl/lib/doc_generator.py
@@ -7561,7 +7560,6 @@ M:	Mauro Carvalho Chehab <mchehab@kernel.org>
 L:	linux-doc@vger.kernel.org
 S:	Maintained
 F:	Documentation/sphinx/
-F:	scripts/kernel-doc*
 F:	tools/lib/python/*
 F:	tools/docs/
 
diff --git a/Makefile b/Makefile
index 3cd00b62cde9..81a4ab11256c 100644
--- a/Makefile
+++ b/Makefile
@@ -460,7 +460,7 @@ HOSTPKG_CONFIG	= pkg-config
 
 # the KERNELDOC macro needs to be exported, as scripts/Makefile.build
 # has a logic to call it
-KERNELDOC       = $(srctree)/scripts/kernel-doc.py
+KERNELDOC       = $(srctree)/tools/docs/kernel-doc
 export KERNELDOC
 
 KBUILD_USERHOSTCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 4db24050edb0..c979c579de66 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -443,7 +443,7 @@ always-$(CONFIG_DRM_I915_WERROR) += \
 
 quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
       cmd_hdrtest = $(CC) $(filter-out $(CFLAGS_GCOV), $(c_flags)) -S -o /dev/null -x c /dev/null -include $<; \
-		$(srctree)/scripts/kernel-doc -none -Werror $<; touch $@
+		$(KERNELDOC) -none -Werror $<; touch $@
 
 $(obj)/%.hdrtest: $(src)/%.h FORCE
 	$(call if_changed_dep,hdrtest)
diff --git a/scripts/kernel-doc b/scripts/kernel-doc
deleted file mode 120000
index 3b6ef807791a..000000000000
--- a/scripts/kernel-doc
+++ /dev/null
@@ -1 +0,0 @@
-kernel-doc.py
\ No newline at end of file
diff --git a/tools/docs/find-unused-docs.sh b/tools/docs/find-unused-docs.sh
index ca4e607ec3f7..53514c759dc1 100755
--- a/tools/docs/find-unused-docs.sh
+++ b/tools/docs/find-unused-docs.sh
@@ -54,7 +54,7 @@ for file in `find $1 -name '*.c'`; do
 	if [[ ${FILES_INCLUDED[$file]+_} ]]; then
 	continue;
 	fi
-	str=$(PYTHONDONTWRITEBYTECODE=1 scripts/kernel-doc -export "$file" 2>/dev/null)
+	str=$(PYTHONDONTWRITEBYTECODE=1 tools/docs/kernel-doc -export "$file" 2>/dev/null)
 	if [[ -n "$str" ]]; then
 	echo "$file"
 	fi
diff --git a/scripts/kernel-doc.py b/tools/docs/kernel-doc
similarity index 99%
rename from scripts/kernel-doc.py
rename to tools/docs/kernel-doc
index 4e3b9cfe3fd7..a19a92566780 100755
--- a/scripts/kernel-doc.py
+++ b/tools/docs/kernel-doc
@@ -108,7 +108,7 @@ import sys
 
 # Import Python modules
 
-LIB_DIR = "../tools/lib/python"
+LIB_DIR = "../lib/python"
 SRC_DIR = os.path.dirname(os.path.realpath(__file__))
 
 sys.path.insert(0, os.path.join(SRC_DIR, LIB_DIR))
diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index 7a5fcef25429..cb2a5005e633 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -246,7 +246,7 @@ class SphinxBuilder:
         #
         self.sphinxbuild = os.environ.get("SPHINXBUILD", "sphinx-build")
         self.kerneldoc = self.get_path(os.environ.get("KERNELDOC",
-                                                      "scripts/kernel-doc.py"))
+                                                      "tools/docs/kernel-doc"))
         self.builddir = self.get_path(builddir, use_cwd=True, abs_path=True)
 
         #
-- 
2.52.0

