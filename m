Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 075337AE024
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 21:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F26A10E326;
	Mon, 25 Sep 2023 19:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C8010E326
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 19:56:11 +0000 (UTC)
Received: from ginger.. (unknown [177.98.21.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D46226607090;
 Mon, 25 Sep 2023 20:56:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695671770;
 bh=chjj7f457UTycO5gqlbABiyYhcs5mj4/HOeu8mj10wM=;
 h=From:To:Cc:Subject:Date:From;
 b=c+KDXM1ri9KsNrzzIxXvDLsvZivu6WBgb/w8epOGJsQ63Iv6SPvWZczfKElhRJS8S
 BRLStsKCVWmVrTlhkimEhNuoH/wSwhmhSfPGfSih2C45YHRVktrHW3gYS6ASNvL06f
 Hd2uIV5yKQSvmXzEIMu4ccvKDG2MNNIJ/umR8YGfkiz0csrJGkhsbY1bEWqI0ASu6e
 98VeqF+gzsQjf/kpca7lRlH4PmecSsn1ohmQP35FlMAIUUK/Qs7objT3MfifOGKQBp
 Cht20ISRyeuFB+HW74XH6NAgGZ4oL0WTBVC0h7b41gmt7+Od5/KBY+rNmLt3HXXqQd
 Nsw6zWpDlAZVQ==
From: Helen Koike <helen.koike@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH] drm/ci: add helper script update-xfails.py
Date: Mon, 25 Sep 2023 16:55:56 -0300
Message-Id: <20230925195556.106090-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: mripard@kernel.org, michel.daenzer@mailbox.org,
 sergi.blanch.torne@collabora.com, guilherme.gallo@collabora.com,
 vignesh.raman@collabora.com, linux-kernel@vger.kernel.org,
 quic_abhinavk@quicinc.com, david.heidelberg@collabora.com,
 quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add helper script that given a gitlab pipeline url, analise which are
the failures and flakes and update the xfails folder accordingly.

Example:
Trigger a pipeline in gitlab infrastructure, than re-try a few jobs more
than once (so we can have data if failues are consistent across jobs
with the same name or if they are flakes) and execute:

update-xfails.py https://gitlab.freedesktop.org/helen.fornazier/linux/-/pipelines/970661

git diff should show you that it updated files in xfails folder.

Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

Hello,

This script is being very handy for me, so I suppose it could be handy
to others, since I'm publishing it in the xfails folder.

Let me know your thoughts.

Regards,
Helen
---
 drivers/gpu/drm/ci/xfails/requirements.txt |  16 ++
 drivers/gpu/drm/ci/xfails/update-xfails.py | 161 +++++++++++++++++++++
 2 files changed, 177 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/xfails/requirements.txt
 create mode 100755 drivers/gpu/drm/ci/xfails/update-xfails.py

diff --git a/drivers/gpu/drm/ci/xfails/requirements.txt b/drivers/gpu/drm/ci/xfails/requirements.txt
new file mode 100644
index 000000000000..26255fb6d6b8
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/requirements.txt
@@ -0,0 +1,16 @@
+git+https://gitlab.freedesktop.org/gfx-ci/ci-collate@4a5bb602855f2bd4fc1ecf43db19e84a906f4258
+
+# ci-collate dependencies
+certifi==2023.7.22
+charset-normalizer==3.2.0
+idna==3.4
+pip==23.2.1
+python-gitlab==3.15.0
+requests==2.31.0
+requests-toolbelt==1.0.0
+ruamel.yaml==0.17.32
+ruamel.yaml.clib==0.2.7
+setuptools==68.0.0
+tenacity==8.2.3
+urllib3==2.0.4
+wheel==0.41.1
diff --git a/drivers/gpu/drm/ci/xfails/update-xfails.py b/drivers/gpu/drm/ci/xfails/update-xfails.py
new file mode 100755
index 000000000000..f14f8ea78de7
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/update-xfails.py
@@ -0,0 +1,161 @@
+#!/usr/bin/env python3
+
+import argparse
+import os
+import re
+from glcollate import Collate
+from urllib.parse import urlparse
+
+
+def get_canonical_name(job_name):
+    return re.split(r" \d+/\d+", job_name)[0]
+
+
+def get_xfails_file_path(canonical_name, suffix):
+    name = canonical_name.replace(":", "-")
+    script_dir = os.path.dirname(os.path.abspath(__file__))
+    return os.path.join(script_dir, f"{name}-{suffix}.txt")
+
+
+def get_unit_test_name_and_results(unit_test):
+    if "Artifact results/failures.csv not found" in unit_test:
+        return None, None
+    unit_test_name, unit_test_result = unit_test.strip().split(",")
+    return unit_test_name, unit_test_result
+
+
+def read_file(file_path):
+    try:
+        with open(file_path, "r") as file:
+            f = file.readlines()
+            if len(f):
+                f[-1] = f[-1].strip() + "\n"
+            return f
+    except FileNotFoundError:
+        return []
+
+
+def save_file(content, file_path):
+    # delete file is content is empty
+    if not content or not any(content):
+        if os.path.exists(file_path):
+            os.remove(file_path)
+        return
+
+    content.sort()
+    with open(file_path, "w") as file:
+        file.writelines(content)
+
+
+def is_test_present_on_file(file_content, unit_test_name):
+    return any(unit_test_name in line for line in file_content)
+
+
+def is_unit_test_present_in_other_jobs(unit_test, job_ids):
+    return all(unit_test in job_ids[job_id] for job_id in job_ids)
+
+
+def remove_unit_test_if_present(lines, unit_test_name, file_name):
+    if not is_test_present_on_file(lines, unit_test_name):
+        return
+    lines[:] = [line for line in lines if unit_test_name not in line]
+    print(os.path.basename(file_name), ": REMOVED", unit_test_name)
+
+
+def add_unit_test_if_not_present(lines, unit_test_name, file_name):
+    if all(unit_test_name not in line for line in lines):
+        lines.append(unit_test_name + "\n")
+        print(os.path.basename(file_name), ": ADDED", unit_test_name)
+
+
+def update_unit_test_result_in_fails_txt(fails_txt, unit_test, file_name):
+    unit_test_name, unit_test_result = get_unit_test_name_and_results(unit_test)
+    for i, line in enumerate(fails_txt):
+        if unit_test_name in line:
+            _, current_result = get_unit_test_name_and_results(line)
+            fails_txt[i] = unit_test + "\n"
+            print(os.path.basename(file_name), ": UPDATED", unit_test,
+                  "FROM", current_result, "TO", unit_test_result)
+            return
+
+
+def add_unit_test_or_update_result_to_fails_if_present(fails_txt, unit_test, fails_txt_path):
+    unit_test_name, _ = get_unit_test_name_and_results(unit_test)
+    if not is_test_present_on_file(fails_txt, unit_test_name):
+        add_unit_test_if_not_present(fails_txt, unit_test, fails_txt_path)
+    # if it is present but not with the same result
+    elif not is_test_present_on_file(fails_txt, unit_test):
+        update_unit_test_result_in_fails_txt(fails_txt, unit_test, fails_txt_path)
+
+
+def split_unit_test_from_collate(xfails):
+    for job_name in xfails.keys():
+        for job_id in xfails[job_name].keys():
+            xfails[job_name][job_id] = xfails[job_name][job_id].strip().split("\n")
+
+
+def main(namespace, project, pipeline_id):
+    xfails = (
+        Collate(namespace=namespace, project=project)
+        .from_pipeline(pipeline_id)
+        .get_artifact("results/failures.csv")
+    )
+
+    split_unit_test_from_collate(xfails)
+
+    for job_name in xfails.keys():
+        canonical_name = get_canonical_name(job_name)
+        fails_txt_path = get_xfails_file_path(canonical_name, "fails")
+        flakes_txt_path = get_xfails_file_path(canonical_name, "flakes")
+
+        fails_txt = read_file(fails_txt_path)
+        flakes_txt = read_file(flakes_txt_path)
+
+        for job_id in xfails[job_name].keys():
+            for unit_test in xfails[job_name][job_id]:
+                unit_test_name, unit_test_result = get_unit_test_name_and_results(unit_test)
+
+                if not unit_test_name:
+                    continue
+
+                if is_test_present_on_file(flakes_txt, unit_test_name):
+                    remove_unit_test_if_present(flakes_txt, unit_test_name, flakes_txt_path)
+                    print("WARNING: unit test is on flakes list but a job failed due to it, "
+                          "is your tree up to date?",
+                          unit_test_name, "DROPPED FROM", os.path.basename(flakes_txt_path))
+
+                if unit_test_result == "UnexpectedPass":
+                    remove_unit_test_if_present(fails_txt, unit_test_name, fails_txt_path)
+                    # flake result
+                    if not is_unit_test_present_in_other_jobs(unit_test, xfails[job_name]):
+                        add_unit_test_if_not_present(flakes_txt, unit_test_name, flakes_txt_path)
+                    continue
+
+                # flake result
+                if not is_unit_test_present_in_other_jobs(unit_test, xfails[job_name]):
+                    add_unit_test_if_not_present(flakes_txt, unit_test_name, flakes_txt_path)
+                    continue
+
+                # consistent result
+                add_unit_test_or_update_result_to_fails_if_present(fails_txt, unit_test,
+                                                                   fails_txt_path)
+
+        save_file(fails_txt, fails_txt_path)
+        save_file(flakes_txt, flakes_txt_path)
+
+
+if __name__ == "__main__":
+    parser = argparse.ArgumentParser(description="Update xfails from a given pipeline.")
+    parser.add_argument("pipeline_url", type=str, help="URL to the pipeline to analise the failures.")
+
+    args = parser.parse_args()
+
+    parsed_url = urlparse(args.pipeline_url)
+    path_components = parsed_url.path.strip("/").split("/")
+
+    namespace = path_components[0]
+    project = path_components[1]
+    pipeline_id = path_components[-1]
+
+    print("Checking:", namespace, project, pipeline_id)
+    main(namespace, project, pipeline_id)
-- 
2.34.1

