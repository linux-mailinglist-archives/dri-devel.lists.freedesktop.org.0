Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B41AE9B5E88
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 10:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE7F10E0A9;
	Wed, 30 Oct 2024 09:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mjADBTJ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B85510E0A9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 09:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730279863;
 bh=U0Lcitof4XwxhliKnfl/tifm9V9g6nRWn98G7J4nOG4=;
 h=From:To:Cc:Subject:Date:From;
 b=mjADBTJ7rTRirHMR4oVc0m8MC2FT2CHWkD9Gc3YOQ7QoAqC0rT2x2xdhjYlthqJOw
 ieUFlRQGcM05QWWO0VAfBno37L66nMRlCPwYhjV7R8sKb9bxPVeUEEeK4tS8+hFbw9
 jgzkq5LsrkNWCIIAy9nHYSEIxlyUm+TTLAdKjHjS5deW31+HqzdHu8O70mZ36CD8FR
 MexiC1fVZVTzxvyLisTvrICfLRQ0qRRWj3CTnTpu1xgncGvupaSHLttekYWGWiwdtm
 MVM1xYkzX7ojuPzPINgUZQD9FXMyh+37hX1E5+dSBZFAu4+eHOUlrDxYFtUEdpbLZo
 m9eDRV1zwwYDw==
Received: from localhost.localdomain (unknown [171.76.83.143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9C3A417E0FC1;
 Wed, 30 Oct 2024 10:17:41 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com,
 wangyuli@uniontech.com, linux-kernel@vger.kernel.org
Subject: [PATCH v1] drm/ci: remove update-xfails.py
Date: Wed, 30 Oct 2024 14:47:20 +0530
Message-ID: <20241030091732.665428-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We can remove the xfails/update-xfails.py script as it is not
used in CI jobs. Once ci-collate [1] is tested for drm-ci,
we can use this tool directly to update fails and flakes.

[1] https://gitlab.freedesktop.org/gfx-ci/ci-collate/

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/xfails/requirements.txt |  17 --
 drivers/gpu/drm/ci/xfails/update-xfails.py | 204 ---------------------
 2 files changed, 221 deletions(-)
 delete mode 100644 drivers/gpu/drm/ci/xfails/requirements.txt
 delete mode 100755 drivers/gpu/drm/ci/xfails/update-xfails.py

diff --git a/drivers/gpu/drm/ci/xfails/requirements.txt b/drivers/gpu/drm/ci/xfails/requirements.txt
deleted file mode 100644
index 5e6d48d98e4e..000000000000
--- a/drivers/gpu/drm/ci/xfails/requirements.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-git+https://gitlab.freedesktop.org/gfx-ci/ci-collate@09e7142715c16f54344ddf97013331ba063b162b
-termcolor==2.3.0
-
-# ci-collate dependencies
-certifi==2023.7.22
-charset-normalizer==3.2.0
-idna==3.4
-pip==23.3
-python-gitlab==3.15.0
-requests==2.31.0
-requests-toolbelt==1.0.0
-ruamel.yaml==0.17.32
-ruamel.yaml.clib==0.2.7
-setuptools==70.0.0
-tenacity==8.2.3
-urllib3==2.0.7
-wheel==0.41.1
diff --git a/drivers/gpu/drm/ci/xfails/update-xfails.py b/drivers/gpu/drm/ci/xfails/update-xfails.py
deleted file mode 100755
index a446e98d72a1..000000000000
--- a/drivers/gpu/drm/ci/xfails/update-xfails.py
+++ /dev/null
@@ -1,204 +0,0 @@
-#!/usr/bin/env python3
-
-import argparse
-from collections import defaultdict
-import difflib
-import os
-import re
-from glcollate import Collate
-from termcolor import colored
-from urllib.parse import urlparse
-
-
-def get_canonical_name(job_name):
-    return re.split(r" \d+/\d+", job_name)[0]
-
-
-def get_xfails_file_path(job_name, suffix):
-    canonical_name = get_canonical_name(job_name)
-    name = canonical_name.replace(":", "-")
-    script_dir = os.path.dirname(os.path.abspath(__file__))
-    return os.path.join(script_dir, f"{name}-{suffix}.txt")
-
-
-def get_unit_test_name_and_results(unit_test):
-    if "Artifact results/failures.csv not found" in unit_test or '' == unit_test:
-        return None, None
-    unit_test_name, unit_test_result = unit_test.strip().split(",")
-    return unit_test_name, unit_test_result
-
-
-def read_file(file_path):
-    try:
-        with open(file_path, "r") as file:
-            f = file.readlines()
-            if len(f):
-                f[-1] = f[-1].strip() + "\n"
-            return f
-    except FileNotFoundError:
-        return []
-
-
-def save_file(content, file_path):
-    # delete file is content is empty
-    if not content or not any(content):
-        if os.path.exists(file_path):
-            os.remove(file_path)
-        return
-
-    with open(file_path, "w") as file:
-        file.writelines(content)
-
-
-def is_test_present_on_file(file_content, unit_test_name):
-    return any(unit_test_name in line for line in file_content)
-
-
-def is_unit_test_present_in_other_jobs(unit_test, job_ids):
-    return all(unit_test in job_ids[job_id] for job_id in job_ids)
-
-
-def remove_unit_test_if_present(lines, unit_test_name):
-    if not is_test_present_on_file(lines, unit_test_name):
-        return
-    lines[:] = [line for line in lines if unit_test_name not in line]
-
-
-def add_unit_test_if_not_present(lines, unit_test_name, file_name):
-    # core_getversion is mandatory
-    if "core_getversion" in unit_test_name:
-        print("WARNING: core_getversion should pass, not adding it to", os.path.basename(file_name))
-    elif all(unit_test_name not in line for line in lines):
-        lines.append(unit_test_name + "\n")
-
-
-def update_unit_test_result_in_fails_txt(fails_txt, unit_test):
-    unit_test_name, unit_test_result = get_unit_test_name_and_results(unit_test)
-    for i, line in enumerate(fails_txt):
-        if unit_test_name in line:
-            _, current_result = get_unit_test_name_and_results(line)
-            fails_txt[i] = unit_test + "\n"
-            return
-
-
-def add_unit_test_or_update_result_to_fails_if_present(fails_txt, unit_test, fails_txt_path):
-    unit_test_name, _ = get_unit_test_name_and_results(unit_test)
-    if not is_test_present_on_file(fails_txt, unit_test_name):
-        add_unit_test_if_not_present(fails_txt, unit_test, fails_txt_path)
-    # if it is present but not with the same result
-    elif not is_test_present_on_file(fails_txt, unit_test):
-        update_unit_test_result_in_fails_txt(fails_txt, unit_test)
-
-
-def split_unit_test_from_collate(xfails):
-    for job_name in xfails.keys():
-        for job_id in xfails[job_name].copy().keys():
-            if "not found" in xfails[job_name][job_id].content_as_str:
-                del xfails[job_name][job_id]
-                continue
-            xfails[job_name][job_id] = xfails[job_name][job_id].content_as_str.splitlines()
-
-
-def get_xfails_from_pipeline_url(pipeline_url):
-    parsed_url = urlparse(pipeline_url)
-    path_components = parsed_url.path.strip("/").split("/")
-
-    namespace = path_components[0]
-    project = path_components[1]
-    pipeline_id = path_components[-1]
-
-    print("Collating from:", namespace, project, pipeline_id)
-    xfails = (
-        Collate(namespace=namespace, project=project)
-        .from_pipeline(pipeline_id)
-        .get_artifact("results/failures.csv")
-    )
-
-    split_unit_test_from_collate(xfails)
-    return xfails
-
-
-def get_xfails_from_pipeline_urls(pipelines_urls):
-    xfails = defaultdict(dict)
-
-    for url in pipelines_urls:
-        new_xfails = get_xfails_from_pipeline_url(url)
-        for key in new_xfails:
-            xfails[key].update(new_xfails[key])
-
-    return xfails
-
-
-def print_diff(old_content, new_content, file_name):
-    diff = difflib.unified_diff(old_content, new_content, lineterm="", fromfile=file_name, tofile=file_name)
-    diff = [colored(line, "green") if line.startswith("+") else
-            colored(line, "red") if line.startswith("-") else line for line in diff]
-    print("\n".join(diff[:3]))
-    print("".join(diff[3:]))
-
-
-def main(pipelines_urls, only_flakes):
-    xfails = get_xfails_from_pipeline_urls(pipelines_urls)
-
-    for job_name in xfails.keys():
-        fails_txt_path = get_xfails_file_path(job_name, "fails")
-        flakes_txt_path = get_xfails_file_path(job_name, "flakes")
-
-        fails_txt = read_file(fails_txt_path)
-        flakes_txt = read_file(flakes_txt_path)
-
-        fails_txt_original = fails_txt.copy()
-        flakes_txt_original = flakes_txt.copy()
-
-        for job_id in xfails[job_name].keys():
-            for unit_test in xfails[job_name][job_id]:
-                unit_test_name, unit_test_result = get_unit_test_name_and_results(unit_test)
-
-                if not unit_test_name:
-                    continue
-
-                if only_flakes:
-                    remove_unit_test_if_present(fails_txt, unit_test_name)
-                    add_unit_test_if_not_present(flakes_txt, unit_test_name, flakes_txt_path)
-                    continue
-
-                # drop it from flakes if it is present to analyze it again
-                remove_unit_test_if_present(flakes_txt, unit_test_name)
-
-                if unit_test_result == "UnexpectedPass":
-                    remove_unit_test_if_present(fails_txt, unit_test_name)
-                    # flake result
-                    if not is_unit_test_present_in_other_jobs(unit_test, xfails[job_name]):
-                        add_unit_test_if_not_present(flakes_txt, unit_test_name, flakes_txt_path)
-                    continue
-
-                # flake result
-                if not is_unit_test_present_in_other_jobs(unit_test, xfails[job_name]):
-                    remove_unit_test_if_present(fails_txt, unit_test_name)
-                    add_unit_test_if_not_present(flakes_txt, unit_test_name, flakes_txt_path)
-                    continue
-
-                # consistent result
-                add_unit_test_or_update_result_to_fails_if_present(fails_txt, unit_test,
-                                                                   fails_txt_path)
-
-        fails_txt.sort()
-        flakes_txt.sort()
-
-        if fails_txt != fails_txt_original:
-            save_file(fails_txt, fails_txt_path)
-            print_diff(fails_txt_original, fails_txt, os.path.basename(fails_txt_path))
-        if flakes_txt != flakes_txt_original:
-            save_file(flakes_txt, flakes_txt_path)
-            print_diff(flakes_txt_original, flakes_txt, os.path.basename(flakes_txt_path))
-
-
-if __name__ == "__main__":
-    parser = argparse.ArgumentParser(description="Update xfails from a given pipeline.")
-    parser.add_argument("pipeline_urls", nargs="+", type=str, help="URLs to the pipelines to analyze the failures.")
-    parser.add_argument("--only-flakes", action="store_true", help="Treat every detected failure as a flake, edit *-flakes.txt only.")
-
-    args = parser.parse_args()
-
-    main(args.pipeline_urls, args.only_flakes)
-    print("Done.")
-- 
2.43.0

