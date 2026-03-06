Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDF+G0psqmkPRQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 06:55:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FE621BDA5
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 06:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D79610E369;
	Fri,  6 Mar 2026 05:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lplm6ODF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012016.outbound.protection.outlook.com
 [40.107.200.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2054210E169
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 05:55:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=STto1zu/GLz4G2gKAISxgLvNdTJrYrH5oWk8sVvIhiTmeS0Pd3UnpPV+NDq3j925hL5/H1dRPfAbYKGePYIkJlomp9fzbK3wBSXAAe4WoNbGq/HtQi1C9G1r0yZeBrosHfoDfiSpsH6BwcH/DaTrMdS98/igncir06LvNkIMeg19iFZhGrBIrblyi1DSmc79uiUksS+TeMN/PDx/42C6KMOVvaQjhCyPOZs6rtUFcfGWt6mHi0ttCsA2Kz5Pb8I2rDu91IoNhPGMFtJS3KtF6H4Uet+REuLX5vB6lDmOvGnhhDAOpOS+bPKZ+AUQ4GuragV9Te+X4FOQRGT5Juvq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GeQUOnn+AywNbb5z3AcaR1ODWeepByTUQhRA82hnjC8=;
 b=VjRdg4SFXtKGGil5P3H6kfBHlTZ917xrM4g+jqJ3Tg2wVMhKXTTWXoKKHmQ2fsL2swKLEc3z53ztbBNmgcemnAXEuVaxU5hhnNfwn/IVgLjB7h3N3j4ZgOUV+rRzdgPOEk48In1X6bxXKkY7Po0NLqw3CN/AKppvCYYNJtCc0zuEONTBpNSfgYNpInSKOhDXU9I64wTcyXcrfAAlMh06ACbKgyZpIn4k3Mbll5hjTSSkXghYiGRGHjRrnaGDCBcFEOWJOmVpIvPLeERHb/x2avx2Fv+rKDNGqJJIy3uEEKo9bXv4XS8mN13SFK+2yPd3TTtMxFNRzE5K/TblCv8Srw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GeQUOnn+AywNbb5z3AcaR1ODWeepByTUQhRA82hnjC8=;
 b=lplm6ODF2xyJdG1weY7P/zIQtYy2wfNbPvKzJ7qKYPc26pQ83dMbKpVZp0PWgmPxPmi8Slfby680muKJay+pEa6u71oENNrOtDMoDULYz8Jchc7LSuy89e08Q+x7sdzX5Sn6Yoja22EzS10rwbtRjbIBMflZYVkWrTjRoFbPWOw=
Received: from BYAPR03CA0011.namprd03.prod.outlook.com (2603:10b6:a02:a8::24)
 by BL3PR12MB6619.namprd12.prod.outlook.com (2603:10b6:208:38e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 05:55:10 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:a02:a8:cafe::c9) by BYAPR03CA0011.outlook.office365.com
 (2603:10b6:a02:a8::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.27 via Frontend Transport; Fri,
 6 Mar 2026 05:55:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Fri, 6 Mar 2026 05:55:10 +0000
Received: from dogwood-dvt-marlim.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 5 Mar 2026 23:55:08 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [RFC PATCH 2/2] tools/drm: Add TTM EFI variable configuration utility
Date: Thu, 5 Mar 2026 23:54:39 -0600
Message-ID: <20260306055439.1822879-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306055439.1822879-1-mario.limonciello@amd.com>
References: <20260306055439.1822879-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|BL3PR12MB6619:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b18215f-a5ac-411c-f017-08de7b44ed4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700016|1800799024; 
X-Microsoft-Antispam-Message-Info: oT6z9bATNE2TdoUsiAj9QyE2wGOg7YzR9zoy8wYlnk+NKaACol+sYwV6OudmG5C3pYcMuFwi0TYZ4/dSvpmfe2PEOk6p2CVgXZu7tGlh1NKJZ9gVB/7qthLD0twAme4TsvT03y5etcB1LXht2mp7GSTd9re27elU78t8DeEt56t+4O3QzmELi+PCfvmDCCsoB1krDP3QkJ9KSbY5Ny9PVe5bpSeWLo38NEh75DhxQB6bTZ+la19RDF/zVQiOnzV+UL3prn+M3oeoMc4G324IDL3TVpJfgOwi9RcXZrsgOYaZrdND1l3G6IUc42Hw9uwB6sNAiIAiI37PlXV88BonZfJiFZRc4WsC04K8Aak4qjZK2hbaiBe9o3jpvjyd6ytqZMqYdgmT1w5xiWC/d3z6Je7mOIw/m1BvZTNbjucUBLWRzIThvm+RzZdBDt2ovTYYNJpwrufP9dDSfRboA1xL2uL3B8dev4kqdpeqK1FgRcp3CafKaX1ZOu4I9OI0/mj1j+SpGbIi6KS36SvotRBvAQU9snr963GfM7kjILMbVGGBNp59LU1N6VT9amXJO6CJ1y3zCAxoz1tHdjhgHfh2b30ZF816hhUSLQlLsAGQ49Y3RvKBX35wuLlCBCUvlYM7yRtpRJ3cfIYSW1vcil6Re5MA3tcvGwpe4iULryEVfvJTdNYAB00tF0gP34kP5V2UHwGlbmEaxj1JoE7Y0OYFAYKbqc0eqzlCiOrgi8K1x+25iWcXXrtspH3VWGGR8pht6qZDPemcscRZbETKpfhX8Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YSCcdzxOf6oTWMmdWgwzJUey9az3+F2Ew34UcdNQdT3qp8IVTzbBwCK4UnM+s4mGCZbT2pZD6TqAEzSd5cDVpdL59eYz0IXXAPwzAS10QKxFZWEEQfjGbREI7U/D5qeX24z2o68BKoRhvUCPHfm1qYA8Gu4BMvmnOiQ2owu1pcMO3Qhp23wtIZENEgpBpLn5Hqc0h9at3NbZoRtMKofCoX41o8BhbNXcqTHklVkOYUWd/sM5zVNSOuyLKKdGceBgooLAsdZrYYMVI8UZGrNsKMs/HIkSINCPOPn8GlmQsnqxykdkNFoHMxbC1pPQDX4oJ5gTIgKd46XOWUVDHOTdl//jFP3RCeqyHVmNFBczgGJxT+vFa8dv52EKimjsw5csA20GZcN9tg4+Yn/3/txI6JCqV+U2MNd5AKHp1XmuXVoq5G7fqZMyNPFHf2Rm1P23
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 05:55:10.1226 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b18215f-a5ac-411c-f017-08de7b44ed4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6619
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
X-Rspamd-Queue-Id: D8FE621BDA5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Add a Python utility script for managing the TTMPageLimit EFI
variable that controls GPU memory page limits in the TTM subsystem.

Assisted-by: Claude Opus 4.6
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 tools/drm/ttm_efi_config.py | 303 ++++++++++++++++++++++++++++++++++++
 1 file changed, 303 insertions(+)
 create mode 100755 tools/drm/ttm_efi_config.py

diff --git a/tools/drm/ttm_efi_config.py b/tools/drm/ttm_efi_config.py
new file mode 100755
index 0000000000000..374abd30de874
--- /dev/null
+++ b/tools/drm/ttm_efi_config.py
@@ -0,0 +1,303 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""
+TTM EFI Variable Configuration Utility
+
+This script allows users to read, write, and delete the TTMPageLimit EFI
+variable, which controls the GPU memory page limit for the TTM subsystem.
+
+Usage:
+    sudo python3 ttm_efi_config.py --read
+    sudo python3 ttm_efi_config.py --set 2G
+    sudo python3 ttm_efi_config.py --set-pages 524288
+    sudo python3 ttm_efi_config.py --delete
+"""
+
+import argparse
+import fcntl
+import os
+import struct
+import sys
+
+# EFI variable configuration
+GUID = "8be4df61-93ca-11ec-b909-0800200c9a66"
+VAR_NAME = "TTMPageLimit"
+EFIVARS_PATH = "/sys/firmware/efi/efivars"
+VAR_FILE = f"{EFIVARS_PATH}/{VAR_NAME}-{GUID}"
+
+# Standard EFI variable attributes
+# NON_VOLATILE | BOOTSERVICE_ACCESS | RUNTIME_ACCESS
+EFI_ATTRS = 0x07
+
+# System page size (typically 4KB)
+PAGE_SIZE = os.sysconf("SC_PAGE_SIZE")
+
+# Linux ioctl constant for getting/setting file attributes
+# From linux/fs.h
+FS_IOC_GETFLAGS = 0x80086601
+FS_IOC_SETFLAGS = 0x40086602
+FS_IMMUTABLE_FL = 0x00000010
+
+
+def check_root():
+    """Verify the script is running as root."""
+    if os.geteuid() != 0:
+        print("Error: This script must be run as root", file=sys.stderr)
+        sys.exit(1)
+
+
+def check_efi_available():
+    """Check if EFI variables filesystem is available."""
+    if not os.path.exists(EFIVARS_PATH):
+        print(f"Error: EFI variables filesystem not found at {EFIVARS_PATH}",
+              file=sys.stderr)
+        print("Ensure your system booted with EFI and the efivarfs is mounted.",
+              file=sys.stderr)
+        sys.exit(1)
+
+
+def remove_immutable(filepath):
+    """
+    Remove the immutable attribute from an EFI variable file.
+
+    Args:
+        filepath: Path to the EFI variable file
+
+    Returns:
+        True if successful, False otherwise
+    """
+    try:
+        fd = os.open(filepath, os.O_RDONLY)
+
+        flags = fcntl.ioctl(fd, FS_IOC_GETFLAGS, struct.pack('i', 0))
+        flags_value = struct.unpack('i', flags)[0]
+
+        if flags_value & FS_IMMUTABLE_FL:
+            new_flags = flags_value & ~FS_IMMUTABLE_FL
+            fcntl.ioctl(fd, FS_IOC_SETFLAGS, struct.pack('i', new_flags))
+
+        os.close(fd)
+        return True
+    except Exception as e:
+        print(f"Warning: Could not remove immutable attribute: {e}", file=sys.stderr)
+        return False
+
+
+def parse_size(size_str):
+    """
+    Parse a size string into page count.
+
+    Args:
+        size_str: String like "2G", "512M", or raw page count
+
+    Returns:
+        Number of pages (integer)
+    """
+    size_str = size_str.strip().upper()
+
+    multipliers = {
+        'K': 1024,
+        'M': 1024 * 1024,
+        'G': 1024 * 1024 * 1024,
+        'KB': 1024,
+        'MB': 1024 * 1024,
+        'GB': 1024 * 1024 * 1024,
+    }
+
+    for suffix, multiplier in multipliers.items():
+        if size_str.endswith(suffix):
+            try:
+                value = float(size_str[:-len(suffix)])
+                bytes_total = int(value * multiplier)
+                return bytes_total // PAGE_SIZE
+            except ValueError:
+                print(f"Error: Invalid size format: {size_str}", file=sys.stderr)
+                sys.exit(1)
+
+    try:
+        return int(size_str)
+    except ValueError:
+        print(f"Error: Invalid page count: {size_str}", file=sys.stderr)
+        sys.exit(1)
+
+
+def format_pages(pages):
+    """
+    Format page count as human-readable size.
+
+    Args:
+        pages: Number of pages
+
+    Returns:
+        Formatted string (e.g., "2.0 GB (524288 pages)")
+    """
+    bytes_total = pages * PAGE_SIZE
+
+    if bytes_total >= 1024 * 1024 * 1024:
+        size_gb = bytes_total / (1024 * 1024 * 1024)
+        return f"{size_gb:.1f} GB ({pages} pages)"
+    elif bytes_total >= 1024 * 1024:
+        size_mb = bytes_total / (1024 * 1024)
+        return f"{size_mb:.1f} MB ({pages} pages)"
+    elif bytes_total >= 1024:
+        size_kb = bytes_total / 1024
+        return f"{size_kb:.1f} KB ({pages} pages)"
+    else:
+        return f"{bytes_total} bytes ({pages} pages)"
+
+
+def read_efi_variable():
+    """Read the TTMPageLimit EFI variable."""
+    if not os.path.exists(VAR_FILE):
+        print(f"TTMPageLimit EFI variable is not set")
+        return
+
+    try:
+        with open(VAR_FILE, 'rb') as f:
+            data = f.read()
+
+        # EFI variable format: 4-byte attributes + data
+        if len(data) < 4:
+            print("Error: Invalid EFI variable (too short)", file=sys.stderr)
+            sys.exit(1)
+
+        attrs = struct.unpack('<I', data[:4])[0]
+        value_data = data[4:]
+
+        if len(value_data) != 8:
+            print(f"Warning: Variable size is {len(value_data)} bytes (expected 8)",
+                  file=sys.stderr)
+
+        if len(value_data) >= 8:
+            page_limit = struct.unpack('<Q', value_data[:8])[0]
+            print(f"TTMPageLimit: {format_pages(page_limit)}")
+            print(f"Attributes: 0x{attrs:02x}")
+        else:
+            print(f"Error: Variable data too short ({len(value_data)} bytes)",
+                  file=sys.stderr)
+            sys.exit(1)
+
+    except PermissionError:
+        print("Error: Permission denied. Run as root.", file=sys.stderr)
+        sys.exit(1)
+    except Exception as e:
+        print(f"Error reading EFI variable: {e}", file=sys.stderr)
+        sys.exit(1)
+
+
+def write_efi_variable(pages):
+    """
+    Write the TTMPageLimit EFI variable.
+
+    Args:
+        pages: Number of pages to set
+    """
+    if pages <= 0:
+        print("Error: Page count must be positive", file=sys.stderr)
+        sys.exit(1)
+
+    try:
+        with open('/proc/meminfo', 'r') as f:
+            for line in f:
+                if line.startswith('MemTotal:'):
+                    mem_kb = int(line.split()[1])
+                    total_pages = (mem_kb * 1024) // PAGE_SIZE
+                    if pages > total_pages:
+                        print(f"Warning: Page count ({pages}) exceeds system RAM ({total_pages} pages)",
+                              file=sys.stderr)
+                        print("The kernel will cap this to system RAM.", file=sys.stderr)
+                    break
+    except Exception as e:
+        print(f"Warning: Could not validate against system RAM: {e}", file=sys.stderr)
+
+    attrs = struct.pack('<I', EFI_ATTRS)
+    value = struct.pack('<Q', pages)
+    data = attrs + value
+
+    try:
+        if os.path.exists(VAR_FILE):
+            remove_immutable(VAR_FILE)
+            os.remove(VAR_FILE)
+
+        fd = os.open(VAR_FILE, os.O_WRONLY | os.O_CREAT, 0o600)
+        os.write(fd, data)
+        os.close(fd)
+
+        print(f"Successfully set TTMPageLimit to {format_pages(pages)}")
+        print("Reboot required for changes to take effect.")
+
+    except PermissionError:
+        print("Error: Permission denied. Run as root and ensure efivarfs is writable.",
+              file=sys.stderr)
+        print("You may need to remount efivarfs with write access:", file=sys.stderr)
+        print("  mount -o remount,rw /sys/firmware/efi/efivars", file=sys.stderr)
+        sys.exit(1)
+    except Exception as e:
+        print(f"Error writing EFI variable: {e}", file=sys.stderr)
+        sys.exit(1)
+
+
+def delete_efi_variable():
+    """Delete the TTMPageLimit EFI variable."""
+    if not os.path.exists(VAR_FILE):
+        print("TTMPageLimit EFI variable is not set (nothing to delete)")
+        return
+
+    try:
+        remove_immutable(VAR_FILE)
+        os.remove(VAR_FILE)
+        print("Successfully deleted TTMPageLimit EFI variable")
+        print("Reboot required for changes to take effect.")
+    except PermissionError:
+        print("Error: Permission denied. Run as root and ensure efivarfs is writable.",
+              file=sys.stderr)
+        print("You may need to remount efivarfs with write access:", file=sys.stderr)
+        print("  mount -o remount,rw /sys/firmware/efi/efivars", file=sys.stderr)
+        sys.exit(1)
+    except Exception as e:
+        print(f"Error deleting EFI variable: {e}", file=sys.stderr)
+        sys.exit(1)
+
+
+def main():
+    parser = argparse.ArgumentParser(
+        description='Manage TTM EFI page limit configuration',
+        epilog='''
+Examples:
+  %(prog)s --read                  # Read current value
+  %(prog)s --set 2G                # Set to 2 GB
+  %(prog)s --set 512M              # Set to 512 MB
+  %(prog)s --set-pages 524288      # Set to 524288 pages
+  %(prog)s --delete                # Delete the variable
+        ''',
+        formatter_class=argparse.RawDescriptionHelpFormatter
+    )
+
+    group = parser.add_mutually_exclusive_group(required=True)
+    group.add_argument('--read', action='store_true',
+                       help='Read the current TTMPageLimit value')
+    group.add_argument('--set', metavar='SIZE',
+                       help='Set TTMPageLimit (e.g., 2G, 512M)')
+    group.add_argument('--set-pages', metavar='PAGES', type=int,
+                       help='Set TTMPageLimit as raw page count')
+    group.add_argument('--delete', action='store_true',
+                       help='Delete the TTMPageLimit variable')
+
+    args = parser.parse_args()
+
+    check_root()
+    check_efi_available()
+
+    if args.read:
+        read_efi_variable()
+    elif args.set:
+        pages = parse_size(args.set)
+        write_efi_variable(pages)
+    elif args.set_pages:
+        write_efi_variable(args.set_pages)
+    elif args.delete:
+        delete_efi_variable()
+
+
+if __name__ == '__main__':
+    main()
-- 
2.53.0

