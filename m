Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5184C2333
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 06:06:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D424710EB59;
	Thu, 24 Feb 2022 05:06:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BA410EB22;
 Thu, 24 Feb 2022 05:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645679169; x=1677215169;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=U7f8LlXFoOldvk1lVMQCofNeheZhhHppftkOlnZeRd4=;
 b=fMiusDqYsubgM7pAojrXR2kNl+FJMPdWMTNmh7r+CMuiBLho6P+IO98+
 i+2d3ROs5Hsc+pml9cHm9YApDW/4ZTjutY6eN41Ntl7wqKHjo0b57620H
 bH49+KXIYWh2BqQya+3E+EXw8f68PeY78yBQ7/tM8S4upYBK6v1dnw+e8
 jA9qCfWR7WoA+tXAssNlOaFY32VoBwajB6E2KtwRTLOP15hHDF82h9cOn
 1vC4Quygc4IaM9Nzgv3m013mBztvxgRfLK43RyuMc/Lw2ODfct4EvqiWV
 twiE2oTYtl+F9QrcfCTC5wjbALI582HuikljiOsx2Gzn9mkMql7C5+8P7 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="276775938"
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; d="scan'208";a="276775938"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 21:06:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; d="scan'208";a="684156805"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 23 Feb 2022 21:06:03 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nN6KJ-0002Hs-0U; Thu, 24 Feb 2022 05:06:03 +0000
Date: Thu, 24 Feb 2022 13:05:17 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm: Avoid dirtyfb stalls on video mode displays
Message-ID: <202202241211.iXHxUcF2-lkp@intel.com>
References: <20220219193957.577054-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220219193957.577054-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Rob Clark <robdclark@chromium.org>, Kalyan Thota <quic_kalyant@quicinc.com>,
 kbuild-all@lists.01.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 llvm@lists.linux.dev, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Heidelberg <david@ixit.cz>, Stephen Boyd <swboyd@chromium.org>,
 Yangtao Li <tiny.windzz@gmail.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Xu Wang <vulab@iscas.ac.cn>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip v5.17-=
rc5 next-20220223]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Rob-Clark/drm-msm-Avoid-di=
rtyfb-stalls-on-video-mode-displays/20220220-185344
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: mips-randconfig-r021-20220224 (https://download.01.org/0day-ci/arch=
ive/20220224/202202241211.iXHxUcF2-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/e5d737074c502ff040a67f7fe=
1f8a9e2a308dec9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Rob-Clark/drm-msm-Avoid-dirtyfb-st=
alls-on-video-mode-displays/20220220-185344
        git checkout e5d737074c502ff040a67f7fe1f8a9e2a308dec9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/msm_fb.c:47:27: warning: unused variable 'plane_stat=
e'
   struct drm_plane_state
   ^
   fatal error: error in backend: Nested variants found in inline asm strin=
g: ' .set push
   .set mips64r2
   .if ( 0x00 ) !=3D -1)) 0x00 ) !=3D -1)) : ($( static struct ftrace_branc=
h_data __attribute__((__aligned__(4))) __attribute__((__section__("_ftrace_=
branch"))) __if_trace =3D $( .func =3D __func__, .file =3D "arch/mips/inclu=
de/asm/atomic.h", .line =3D 156, $); 0x00 ) !=3D -1)) : $))) ) && ( 0 ); .s=
et push; .set mips64r2; .rept 1; sync 0x00; .endr; .set pop; .else; ; .endif
   1: ll $1, $2 # atomic_fetch_sub
   subu $0, $1, $3
   sc $0, $2
   beqz $0, 1b
   .set pop
   move $0, $1
   '
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0. Program arguments: clang -Wp,-MMD,drivers/gpu/drm/msm/.msm_fb.o.d -no=
stdinc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./in=
clude -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclu=
de/uapi -I./include/generated/uapi -include include/linux/compiler-version.=
h -include include/linux/kconfig.h -include include/linux/compiler_types.h =
-D__KERNEL__ -DVMLINUX_LOAD_ADDRESS=3D0xffffffff84000000 -DLINKER_LOAD_ADDR=
ESS=3D0x84000000 -DDATAOFFSET=3D0 -Qunused-arguments -fmacro-prefix-map=3D=
=3D -DKBUILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-tri=
graphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dim=
plicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -W=
no-format-security -std=3Dgnu89 --target=3Dmipsel-linux -fintegrated-as -We=
rror=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -mno-=
check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-flo=
at -DGAS_HAS_SET_HARDFLOAT -Wa,-msoft-float -ffreestanding -EL -fno-stack-c=
heck -march=3Dmips32 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/inclu=
de/asm/mach-ralink -Iarch/mips/include/asm/mach-ralink/mt7620 -Iarch/mips/i=
nclude/asm/mach-generic -fno-asynchronous-unwind-tables -fno-delete-null-po=
inter-checks -Wno-frame-address -Wno-address-of-packed-member -Os -Wframe-l=
arger-than=3D1024 -fno-stack-protector -Wimplicit-fallthrough -Wno-gnu -mno=
-global-merge -Wno-unused-but-set-variable -Wno-unused-const-variable -ftri=
vial-auto-var-init=3Dpattern -fno-stack-clash-protection -pg -Wdeclaration-=
after-statement -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-array-bou=
nds -fno-strict-overflow -fno-stack-check -Werror=3Ddate-time -Werror=3Dinc=
ompatible-pointer-types -Wextra -Wunused -Wno-unused-parameter -Wmissing-de=
clarations -Wmissing-format-attribute -Wmissing-prototypes -Wold-style-defi=
nition -Wmissing-include-dirs -Wunused-but-set-variable -Wunused-const-vari=
able -Wno-missing-field-initializers -Wno-sign-compare -Wno-type-limits -I =
drivers/gpu/drm/msm -I drivers/gpu/drm/msm/disp/dpu1 -I drivers/gpu/drm/msm=
 -I ./drivers/gpu/drm/msm -ffunction-sections -fdata-sections -DKBUILD_MODF=
ILE=3D"drivers/gpu/drm/msm/msm" -DKBUILD_BASENAME=3D"msm_fb" -DKBUILD_MODNA=
ME=3D"msm" -D__KBUILD_MODNAME=3Dkmod_msm -c -o drivers/gpu/drm/msm/msm_fb.o=
 drivers/gpu/drm/msm/msm_fb.c
   1. <eof> parser at end of file
   2. Code generation
   3. Running pass 'Function Pass Manager' on module 'drivers/gpu/drm/msm/m=
sm_fb.c'.
   4. Running pass 'Mips Assembly Printer' on function '@msm_framebuffer_cr=
eate'
   #0 0x000055e0318e4d7f Signals.cpp:0:0
   #1 0x000055e0318e2c5c llvm::sys::CleanupOnSignal(unsigned long) (/opt/cr=
oss/clang-d271fc04d5/bin/clang-15+0x348ec5c)
   #2 0x000055e031822fd7 llvm::CrashRecoveryContext::HandleExit(int) (/opt/=
cross/clang-d271fc04d5/bin/clang-15+0x33cefd7)
   #3 0x000055e0318db30e llvm::sys::Process::Exit(int, bool) (/opt/cross/cl=
ang-d271fc04d5/bin/clang-15+0x348730e)
   #4 0x000055e02f506ccb (/opt/cross/clang-d271fc04d5/bin/clang-15+0x10b2cc=
b)
   #5 0x000055e031829a8c llvm::report_fatal_error(llvm::Twine const&, bool)=
 (/opt/cross/clang-d271fc04d5/bin/clang-15+0x33d5a8c)
   #6 0x000055e0325335c0 llvm::AsmPrinter::emitInlineAsm(llvm::MachineInstr=
 const (/opt/cross/clang-d271fc04d5/bin/clang-15+0x40df5c0)
   #7 0x000055e03252f4f4 llvm::AsmPrinter::emitFunctionBody() (/opt/cross/c=
lang-d271fc04d5/bin/clang-15+0x40db4f4)
   #8 0x000055e02ff70887 llvm::MipsAsmPrinter::runOnMachineFunction(llvm::M=
achineFunction&) (/opt/cross/clang-d271fc04d5/bin/clang-15+0x1b1c887)
   #9 0x000055e030c2d54d llvm::MachineFunctionPass::runOnFunction(llvm::Fun=
ction&) (.part.53) MachineFunctionPass.cpp:0:0
   #10 0x000055e031074807 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (/opt/cross/clang-d271fc04d5/bin/clang-15+0x2c20807)
   #11 0x000055e031074981 llvm::FPPassManager::runOnModule(llvm::Module&) (=
/opt/cross/clang-d271fc04d5/bin/clang-15+0x2c20981)
   #12 0x000055e0310754ff llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (/opt/cross/clang-d271fc04d5/bin/clang-15+0x2c214ff)
   #13 0x000055e031bff147 clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, clang::Ba=
ckendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<l=
lvm::raw_pwrite_stream> >) (/opt/cross/clang-d271fc04d5/bin/clang-15+0x37ab=
147)
   #14 0x000055e03284d693 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (/opt/cross/clang-d271fc04d5/bin/clang-15+0x43f9693)
   #15 0x000055e0333286e9 clang::ParseAST(clang::Sema&, bool, bool) (/opt/c=
ross/clang-d271fc04d5/bin/clang-15+0x4ed46e9)
   #16 0x000055e03284c4cf clang::CodeGenAction::ExecuteAction() (/opt/cross=
/clang-d271fc04d5/bin/clang-15+0x43f84cf)
   #17 0x000055e03224f561 clang::FrontendAction::Execute() (/opt/cross/clan=
g-d271fc04d5/bin/clang-15+0x3dfb561)
   #18 0x000055e0321e5faa clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (/opt/cross/clang-d271fc04d5/bin/clang-15+0x3d91faa)
   #19 0x000055e032313cbb (/opt/cross/clang-d271fc04d5/bin/clang-15+0x3ebfc=
bb)
   #20 0x000055e02f50827c cc1_main(llvm::ArrayRef<char char (/opt/cross/cla=
ng-d271fc04d5/bin/clang-15+0x10b427c)
   #21 0x000055e02f504f4b ExecuteCC1Tool(llvm::SmallVectorImpl<char driver.=
cpp:0:0
   #22 0x000055e03207ed95 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringR=
ef> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::alloca=
tor<char> const::'lambda'()>(long) Job.cpp:0:0
   #23 0x000055e031822e93 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (/opt/cross/clang-d271fc04d5/bin/clang-15+0x33cee93)
   #24 0x000055e03207f68e clang::driver::CC1Command::Execute(llvm::ArrayRef=
<llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, std::c=
har_traits<char>, std::allocator<char> const (.part.216) Job.cpp:0:0
   #25 0x000055e032054267 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const (/opt/cross/clang-d27=
1fc04d5/bin/clang-15+0x3c00267)
   #26 0x000055e032054c47 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) const (/opt/cross/clang-d271fc04d5/bin/clang-15+0x3c00c47)
   #27 0x000055e03205e2f9 clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) (/opt/cross/clang-d271fc04d5/bin/clang-15+0x3c0a2f9)
   #28 0x000055e02f42d63f main (/opt/cross/clang-d271fc04d5/bin/clang-15+0x=
fd963f)
   #29 0x00007f8e07c7ed0a __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x26d0a)
   #30 0x000055e02f504a6a _start (/opt/cross/clang-d271fc04d5/bin/clang-15+=
0x10b0a6a)
   clang-15: error: clang frontend command failed with exit code 70 (use -v=
 to see invocation)
   clang version 15.0.0 (git://gitmirror/llvm_project d271fc04d5b97b12e6b79=
7c6067d3c96a8d7470e)
   Target: mipsel-unknown-linux
   Thread model: posix
   InstalledDir: /opt/cross/clang-d271fc04d5/bin
   clang-15: note: diagnostic msg:
   Makefile arch drivers fs include kernel nr_bisected scripts source usr


vim +/plane_state +47 drivers/gpu/drm/msm/msm_fb.c

    23=09
    24	static struct drm_framebuffer *msm_framebuffer_init(struct drm_devic=
e *dev,
    25			const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **b=
os);
    26=09
    27	static int msm_framebuffer_dirtyfb(struct drm_framebuffer *fb,
    28					   struct drm_file *file_priv, unsigned int flags,
    29					   unsigned int color, struct drm_clip_rect *clips,
    30					   unsigned int num_clips)
    31	{
    32		struct msm_drm_private *priv =3D fb->dev->dev_private;
    33		struct drm_modeset_acquire_ctx ctx;
    34		struct drm_plane *plane;
    35		bool needs_flush =3D false;
    36		int ret =3D 0;
    37=09
    38		/*
    39		 * When called from ioctl, we are interruptible, but not when called
    40		 * internally (ie. defio worker)
    41		 */
    42		drm_modeset_acquire_init(&ctx,
    43			file_priv ? DRM_MODESET_ACQUIRE_INTERRUPTIBLE : 0);
    44=09
    45	retry:
    46		drm_for_each_plane(plane, fb->dev) {
  > 47			struct drm_plane_state *plane_state;
    48			struct drm_crtc *crtc;
    49=09
    50			ret =3D drm_modeset_lock(&plane->mutex, &ctx);
    51			if (ret)
    52				goto out;
    53=09
    54			if (plane->state->fb !=3D fb) {
    55				drm_modeset_unlock(&plane->mutex);
    56				continue;
    57			}
    58=09
    59			crtc =3D plane->state->crtc;
    60=09
    61			ret =3D drm_modeset_lock(&crtc->mutex, &ctx);
    62			if (ret)
    63				goto out;
    64=09
    65			if (priv->kms->funcs->needs_dirtyfb(crtc)) {
    66				needs_flush =3D true;
    67				break;
    68			}
    69		}
    70=09
    71	out:
    72		if (ret =3D=3D -EDEADLK) {
    73			ret =3D drm_modeset_backoff(&ctx);
    74			if (!ret)
    75				goto retry;
    76		}
    77=09
    78		drm_modeset_drop_locks(&ctx);
    79		drm_modeset_acquire_fini(&ctx);
    80=09
    81		if (needs_flush) {
    82			ret =3D drm_atomic_helper_dirtyfb(fb, file_priv, flags,
    83							color, clips, num_clips);
    84		}
    85=09
    86		return ret;
    87	}
    88=09

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
