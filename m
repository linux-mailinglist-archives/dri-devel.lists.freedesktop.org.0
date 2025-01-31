Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C60E3A24309
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 19:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C11110E425;
	Fri, 31 Jan 2025 18:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lxiyVh+y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2054.outbound.protection.outlook.com [40.107.95.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BD310E1F9;
 Fri, 31 Jan 2025 18:59:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2kqlBzceUj7Sej9anB5Mv7X1LR5f4AXHc0G+w3+sCtG/D61GxtXe/8OJl+1R3quGPaezplJ2I9LNNLG6U9Turw4HFTTmpptMTMMpF1gsQaDB3A1+HaMPydcVSd4LpHTnKbo7YjbvN2s+IQrBwouQwxmeIkvhRbaXVHD/24K3ZvhcpHCs/dZ2bRrQNQHouWybeIsue8KVnwRh9btxQ4Rp7UkCDjeBEYDBlSELTz17tqi0/r5WejsbEPW7YN/6NJ676OYXFWWF904dGoMHngjSSZyzLzgE995LkCNz3qS07PMo70ggvnW778GQR1RmcTBW31trqI0OsdMzVpm2zgQZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=651oPppyThJgl/pE7IjgXztBbii0R20oLcz3ouNye7I=;
 b=cq4kRgSZ+QTL0m5NZFMOoDT+rOMsCWKhCF0PoTXEvOhZObHZkdTpwmX80QFpkQVSxmaSuy6zH841KsIJ0EaSu4wujU0y5O0118zsXAiKk6xBmnNbJ6E7Czr3zwTKAMo4mXch4jROlAyr1duiG6simNj/2HHNwX/DvSTh6PE9bLUE5FS+aPvxihHYVnporaZ3sXRpDLIer7ai63yzQr5khT7lSrEYiMjxvBMtQc4qFSHq6tLEW1EoMc+P3u/CzxrLqNGGjnqHGp2AnPwM7SIKMntQkAj3JBoaagayI2rdOgwyEk6PmOnztgJMJNxlpdRI4szv3WtPejn43aHiECB5Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=651oPppyThJgl/pE7IjgXztBbii0R20oLcz3ouNye7I=;
 b=lxiyVh+yx7iDEYj4eKAHjWdTm5QGpjmFZV4M1YmA/9Ff63AjKsYYHlreiCZyVjcmw56damzVezwwBvDUS6qWqEhgq2Oy8KUzhKbf+hoSLXtcmFHYs+0SSSLEWX8wJDrhFkwO+i7WwansmBX89L2Q5gnjuOVYj2FCX59ozG0KJPY=
Received: from BN0PR07CA0021.namprd07.prod.outlook.com (2603:10b6:408:141::16)
 by CY8PR12MB7363.namprd12.prod.outlook.com (2603:10b6:930:51::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Fri, 31 Jan
 2025 18:58:53 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:408:141:cafe::e2) by BN0PR07CA0021.outlook.office365.com
 (2603:10b6:408:141::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.20 via Frontend Transport; Fri,
 31 Jan 2025 18:58:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 31 Jan 2025 18:58:52 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 31 Jan
 2025 12:58:48 -0600
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <amd-gfx@lists.freedesktop.org>, <tvrtko.ursulin@igalia.com>,
 <Christian.Koenig@amd.com>, <Felix.Kuehling@amd.com>, <Weijun.Jiang@amd.com>, 
 <dcostantino@meta.com>, <sruffell@meta.com>
Subject: 
Date: Fri, 31 Jan 2025 13:58:28 -0500
Message-ID: <20250131185829.827297-1-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|CY8PR12MB7363:EE_
X-MS-Office365-Filtering-Correlation-Id: cc0cb832-623a-4b11-819d-08dd42294e08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVJGWkNOYnI3enFXeU5XZ1I0cUhFRjY2SEs0NDBpQVZZemd4NXdhOUxFRVZp?=
 =?utf-8?B?WFNDOER4QWpKUTdmbDNFemRpU2Jldk9DR1VkMW82MlNMakNnTWtPTGVPNmFP?=
 =?utf-8?B?OXB5Vi83QWR6M1BvSGN5MC9pTG1OdWpGR2xCWlN1RHhiQ1hrOENtRzEwaytM?=
 =?utf-8?B?MVorZksxbkt4Q2piY1JXVzNWb2EzL1Z1TTVhVEUwR0RJMDhxOURYdUtmT3BZ?=
 =?utf-8?B?NCtwWmliS0h4SHZ5eHh4b0J6eDlFd3BkVDBzQm5pK0dSbUVXYVZyRktYanh0?=
 =?utf-8?B?K0NoVTdEVmRKbUF0TnpId3JRK0lkemdnUzFBa29SVlpGbzd1Y0xCdzNyTGRt?=
 =?utf-8?B?TXhIaTVQWmFQUnVpM3A1RjQ0TUFRV1liU1FCMkRwVjc0UkVBWXB1cm9BQjNm?=
 =?utf-8?B?WTBMaXd3ckN6VDZFcWpBbEdtbVdXSkhGVFhPUUNNUUwyNDNzVEh2cnRyY2JR?=
 =?utf-8?B?bFlVVm9pTlpENmtiTnZKV0tSeVdQRG4vcno0Znh4cDZLd1FlR0dNT0lFZDRn?=
 =?utf-8?B?em9DQVdFOXJ4K25zaldGbHh3Q21tb3psSkt3MmxrYUMrS29XdTV1S0RITUVi?=
 =?utf-8?B?TEtKVzYwMkFSTFNIYld4aUgxSFNYUEpROTlTSjZyWTIyWmM5R1UyQURUZHJa?=
 =?utf-8?B?NVREbTk2aERSRWFjOEdqNWlRbHUveml2UVRrL2d2dHFjQWR0anVYYVJKd0Mv?=
 =?utf-8?B?M1VGTThBOHlLQ2NhdmVFMDk3ekFUZ2RrQXhRK250UEw0Zjdpb0J6dGlzaVFt?=
 =?utf-8?B?bUlPL0lIbk9lTHpyVmdIK08zVG5DUTBYSTJTMFdMT0MzSGtFNU9mVEtxYjd0?=
 =?utf-8?B?L1NzRUt3ZnlaWGVSWlh4dE1wV0lxZWtUWWpqV3l2WUNKSnh5MDRxVnROOW5w?=
 =?utf-8?B?N2ZZamJGVTNWenhwYlg5TTdqQjZBeC9Jb0F3VGNyamw5YWNUUklNeWs1ZG5a?=
 =?utf-8?B?ZmpaZDVXSFNEUm53c0h6ditDVlNEbVNIcUwzdDI2Q094Y0xaNnoyV0RTbXJT?=
 =?utf-8?B?VlczeHBIVnFxWVhDdEwxK1JKT0daSCtHR0VEWDBtemlUdnducC94cVVxS3U1?=
 =?utf-8?B?cFVZWjhibnFJYUkyaTFrMHIwZytOTUVWRG5nUTNSaVFDU1NMTnFFNmpjeHRT?=
 =?utf-8?B?VjVFeENSNGRXcTJ6d2VrMWorRlV4cUl0L0N5MDBLNkpEVVZtMFhTazUvZkZ1?=
 =?utf-8?B?OWo2QXdmaDdaWkdMcG5tQXlrbTIzaTBCWHE2dDl0QXN2UGlIUjBMRjVJS3J0?=
 =?utf-8?B?RTJ4QlFsZ1BFQnRkRWxvWEZKZEdhZVFXTXI5b21UbHBjSi84a214Z3pJOEsw?=
 =?utf-8?B?UUVoUW5jdElNZjJIVm9GK0U3NjJGcDdVc2NyWFMxSVY3YVM1QW1OaWdHQzlB?=
 =?utf-8?B?M3JLdFBOUnJxZytGYVlHajdHV1gvak9HZDRQY2QwOXlmVU8wYXdJRk5SSEFO?=
 =?utf-8?B?UFZGS1pjMkh2dlNnVWxxZjA4TXBmT1JvZEVXNkFHV2J0dzYrSEZHcEVIbUFr?=
 =?utf-8?B?OWZNYVVmaGVJK1BXSm5CaUM2Qk9aanBVVXJDOEdQY1pDalYvTmMycWJHdWlv?=
 =?utf-8?B?RnpyN2x4bFREUTJnUUpFa2YyejY5cllaZ1p0UnJ3dzUyb2Q5Zk9RdGtjdGZU?=
 =?utf-8?B?KzFDWjUyODVwK3FGVEdiQTdnRUtURjhpVXA2T28yTExqR2ZFTkFTM1lWemFE?=
 =?utf-8?B?ZWhnanI1MVVxU1A3V3lQQ0tyRHVvOTBxYlYrelBiZ0l0UEwzRDlDNi83b3lU?=
 =?utf-8?B?UkxZNDFLZ01renZ0QW5FNndBRG1IcGw3VklpQWtMcGlRV2swU2dudjFlaWpL?=
 =?utf-8?B?dUd5QlJMZkcxdUlFd3lUMkRoOFhFTlU5ZHNJLzBJSWU0T3FzME9lVW00dXpN?=
 =?utf-8?B?RTFlenVLeC90encrVXlqMllTS1dMM2pOVGl1NFhiYmtKSDZzOFVMamVPaDBu?=
 =?utf-8?B?WUdOR1NtUEpWdTFId0FQRGk0TDFMS05VVHc3aGhweXpBQytnQU9Kbzg5cEFM?=
 =?utf-8?Q?UCb7wsXiUv33yJjiFSIx2+EC09OqCc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 18:58:52.5344 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc0cb832-623a-4b11-819d-08dd42294e08
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7363
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

We are working on extending support for CRIU checkpoint/restore in the amdgpu
driver to support new use cases and ROCm applications increasingly using
render node ioctls for memory management. In the longer term this may also
allow checkpoint/restore of graphics application. With this patch series we
are soliciting feedback about our design and proof-of-concept implementation.
Our intention is to upstream a future version of these changes in DRM, amdgpu
and CRIU.

Following the philosophy of CRIU (where “IU” stand for “in usermode”) much of
the complexity of saving and restoring memory sharing relationships is handled
in user mode. We believe our work can serve as a blueprint for supporting CRIU
in other DRM and dmabuf drivers in the future.

# Motivation

Applications managing GPU/Compute resources on AMD platforms use the
amdgpu driver. This driver exposes one DRM /dev/dri/renderD interface per
AMD device and one KFD /dev/kfd device file per machine for all devices.

AMD's CRIU plugin currently deals with both /dev/kfd and renderD device files.
For /dev/kfd it uses a CRIU-exclusive ioctl on the device file to dump and
restore device data. For the renderD device files, it only records the
device ID and topology.

dmabuf is a kernel component that allows users to share memory between
devices. A user can request export of a file descriptor (a dmabuf_fd)
representing a region of memory allocated on a device from that device's
driver. That dmabuf_fd can be sent (imported) to another device (by the
same process or a different one) to create shared memory between the two
devices. This results in the two processes having handles on the same physical
memory.

Further details about dmabuf can be found at
https://docs.kernel.org/driver-api/dma-buf.html

AMD is moving towards dmabuf-based buffer object management to support
inter-process communication, as well as other features.

AMD's CRIU plugin needs to support processes that have shared memory created
with dmabuf. Currently, all applications that use this feature allocate
memory in /dev/kfd, export it from that device, and then import in an renderD
device. This CRIU solution should be able to support future use cases
including allocating and exporting from renderD, importing on /dev/kfd, and
even sharing memory with non-AMD devices. As much as possible, we would like to
contain these changes in the CRIU plugin, although changes in core CRIU,
amdgpu, amdkfd, and core drm are also necessary.

Please find attached the relevant kernel and CRIU patches.

# Access relevant data

The amdgpu CRIU plugin already uses CRIU ioctls of the kfd device to
extract driver state from /dev/kfd, and to recreate that state during restore.
The renderD devices have their own driver state, and to access it we need
CRIU renderD ioctls.

The amdgpu data that needs to be stored during dump and restored during
restore is all BO-related: the bos' addresses, sizes, and flags, and the
similar data for associated virtual memory mappings.

Typically, applications access renderD drm ioctls through a wrapped library
called libdrm. However, since these ioctls will only ever be used by CRIU
itself, we have chosen to have CRIU call them directly. This means that the
relevant header file, amdgpu_drm.h, must be added to CRIU.

# Identifying shared BOs (buffer objects)

During checkpoint, the amdgpu CRIU plugin must identify which buffer objects
across the renderD and /dev/kfd devices in all checkpointed processes
correspond to shared data, so that that sharing relationship can be later
restored. An easy way is to use memory’s GEM handle. Because all the
checkpointing happens in a single CRIU process, shared memory will always share
a GEM handle. Gem handles are intended to identify memory and require no
additional code to use.

Extracting the gem handles requires use of the libdrm function
amdgpu_device_get_fd, which was added in version libdrm-2.4.109 of libdrm in
November 2021. This introduces a dependency of CRIU on sufficiently new libdrm.

# Restoring shared BOs - The Mechanism

During restore, CRIU must recreate the shared memory relationships that existed
before checkpoint. The plan is to mimic the means by which the memory was
shared in the first place. During checkpoint, one of the processes which holds
a shared piece of memory will be designated the exporter and the rest
importers. The exporter process will get a dmabuf_fd from the driver and
transfer it to the importer processes. Those processes will send the dmabuf_fd
to the driver, where it will be imported. This approach minimizes kernel
changes.

The renderD dmabuf import code cannot be reused as it is. When a dmabuf_fd is
imported normally, it is assigned a gem handle arbitrarily. However, the
checkpointed process uses the gem handle to identify this data, so the
restored memory must have the same gem handle as before. This necessitates
adding two new drm interfaces for creating and importing buffer objects with
a specified gem handle.

Transferring dmabuf_fds between CRIU processes requires a socket.

Each process creates its own socket and registers it to a name containing its
pid. When a process exports a dmabuf_fd, it sends it to the sockets of all
other processes. Before a process begins restoring a device file, it checks its
socket for incoming messages. In the current version of the patchset, this is
done in core CRIU, parallel to the existing socket for exchanging file
descriptors for shared files. It could be done within the amdgpu plugin
instead, but this would require an additional plugin callback to ensure that
all sockets are created before any plugin files are restored.

This new socket is created within the amdgpu CRIU plugin. Each process creates
its own socket and registers it to a name containing its pid. When a process
exports a dmabuf_fd, it sends it to the sockets of all other processes. Before
a process begins restoring a device file, it checks its socket for incoming
messages.

The sockets themselves and the dmabuf_fds received over sockets both must be
assigned fds. These fds cannot conflict with each other or with fds of other
restored files. We intend to alter find_unused_fd_pid to allow the allocation
of multiple regions of unused fds; this work is not yet complete.

# Restoring shared BOs - The Logic

CRIU already has a mechanism for handling files that have requirements to be
restored. Files that can't fully restore on the first try can return 1,
indicating they are incomplete and will need to be retried. We extend this
mechanism to plugin files to handle the shared bo case. Any device file that
needs to restore imported bos will retry if the corresponding exports haven't
happened yet.

Another option would be to do the plugin restore in two phases, with all the
exported bos in the first phase and all the imports in the second phase. That
would be more efficient but would require more core CRIU changes, in particular
additional synchronization between restoring processes.

To support this, files-ext.c is modified to allow plugin files to retry.

# TODO

1) Backwards compatibility

It is important to us that older versions of CRIU continue to work with new
kernels with the changes. The existing amdkfd CRIU ioctl UAPI must be extended
in a way that does not break the ABI.

2) Checkpoint and restore of dmabuf fds themselves

The usual approach to IPC taken by AMD libraries is to export a dmabuf,
immediately send it to another process, and then close it. Therefore, it is
unlikely that a process will have a dmabuf_fd open during checkpoint. We
would still like to handle this case, however. Work to do so is not done.

This would require handling of dmabuf file descriptors in the amdgpu CRIU
plugin. It woudl support only dmabuf fds that were exported by amdgpu. For
each such dmabuf fd, it would have to store an identifier of the underlying
amdgpu BO that can be used during restore to recreate the dmabuf fd from the
restored BO.


The CRIU patch can also be found at
https://github.com/fdavid-amd/criu/tree/dmabuf-post


