Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85C6ADAF54
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 13:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BFE10E369;
	Mon, 16 Jun 2025 11:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FGoRjAhp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8896C10E369
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 11:58:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXNKV3s5S3xqoQa/O8d/b4zrKNUiPcZ3quzyQNalYOFQyyiFkyBpEXNheZUJ4/b2AMyDFVVoz1cS+Ip5DXYj2PeaCiEES3pXIwUpK8RjK3dEV7hrNq5uFtKxc/6p2RBmCdMecki7POisU5s6cZ1Qu6Pd24Hb8QBGhpIzxYSoNcmwUnkzVgxqYMHmMQo4JmXPQgCLyXAwoETWcYnfaOc6ZjP7YGB+VINKsEXXaoliaCfStCjUAxR78MHoTdVlbgGUykk0jPB+InGPWRzDxx8x9YrKVo0L8R2GmzfoI5wLRWopyC0dArgwsTUqSrT5dlEzZI8EW9GuKHKjnXjEtkLxVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xU2G7ddnCtGYyvj2LJL7rTaQSlp2LMe82jG8vbhabiI=;
 b=a5mAYPN+4lEKTqRFr9RI/33uhDnNgqE4kr1B5zUgfidrEzCb4VU+TyfqQXQQuxGELkJXhopR99LXouP4eZIMzQZGjNDPv/u9WTzfMRPk3JRrNlfH/srSMQTadp2TDuMBs6bwF6ueN3UVm7HHyN7V0lD5z5VsATH/T47NAOyQAnTfJqL8MKEF1lookTIfoZYac7u29yA68sxT/irD8TaRu/cA4iPeYqvyJ4Sd16iF3qV0TpJ/ah1ObchphY6tEo70qQVMj/wAHw+oIumvZFjkC7DKcvYOH41etMvnhB2WIhdiXtvhPk5pwQ58HKTWVvj6aYK4es/yN49wLvPTJ8Zfxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xU2G7ddnCtGYyvj2LJL7rTaQSlp2LMe82jG8vbhabiI=;
 b=FGoRjAhpWLE3pQm/4xjmEzmie3yQhjCjJF79x04L+/QSWSw7ScfoOkqAWZl+df+sg7Wwta5N6V6eo789IUtnKvoBA9OUVleVajeIVD7V2N9NlX/kh551/LvULz+33TPkBX0VWxasVHu0a+lXVTffocfKwdFyYjr1fCBpR/1i26XTqvg6L3YmqexbqQdRd1XswRuh6HFmy28ioYlg7URqNfeOlYjcl3BuoRwApqePqT7bTXyFPUvCf8N+oE5N2WjU6ANBwCLDLh1d+74lkK0toOfMPZhE9YANNTH/a6Fb7c0TdK+qz6GeZrURvUALpv8DyuvcehLHoSx+hISWPAa7Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9)
 by CH2PR12MB9517.namprd12.prod.outlook.com (2603:10b6:610:27f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 11:58:46 +0000
Received: from CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6]) by CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6%5]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 11:58:46 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org, Alistair Popple <apopple@nvidia.com>,
 gerald.schaefer@linux.ibm.com, dan.j.williams@intel.com, jgg@ziepe.ca,
 willy@infradead.org, david@redhat.com, linux-kernel@vger.kernel.org,
 nvdimm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org, jhubbard@nvidia.com,
 hch@lst.de, zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
 John@Groves.net, m.szyprowski@samsung.com
Subject: [PATCH v2 02/14] mm: Filter zone device pages returned from
 folio_walk_start()
Date: Mon, 16 Jun 2025 21:58:04 +1000
Message-ID: <11dd5b70546ec67593a4bf79f087b113f15d6bb1.1750075065.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.8d04615eb17b9e46fc0ae7402ca54b69e04b1043.1750075065.git-series.apopple@nvidia.com>
References: <cover.8d04615eb17b9e46fc0ae7402ca54b69e04b1043.1750075065.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYAPR01CA0005.ausprd01.prod.outlook.com (2603:10c6:1::17)
 To CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7705:EE_|CH2PR12MB9517:EE_
X-MS-Office365-Filtering-Correlation-Id: 818c82d6-5320-42b4-5e86-08ddaccd25ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pmMJWBuf180ubdvrnXwY/M7y4OvNP3hwZmjOxIPBOFwI/LSU9F5wTHuwDyIT?=
 =?us-ascii?Q?Ch28eVXypoNYncxNHwVvVtIjJCXJXLzD8st0htVsve7kWlE5iKyLG1xIiScw?=
 =?us-ascii?Q?HieC+BlWYqg+Vhs7jtFuISi6nfjTK9W1VKNVmwhNXoUbJUmCiI18m83JH4Yi?=
 =?us-ascii?Q?99GsWaitG27s/8iIv0+b9+EOM/XPqSPHQs2MuWK7paQ9JOokHM36p1skD25Q?=
 =?us-ascii?Q?pz84R9/uiJT6AxlicUu5D6ofSt6VE8YSYiRe7WGgZifwGMNPjd7Y3xbGxtdY?=
 =?us-ascii?Q?qzTxvFQmb6/PMS/cXSH47wee4gTH00W28rkFKSXOLVR6eEm+rci1UMwNDENV?=
 =?us-ascii?Q?zRG9H1skZ8VTWzUdeMepAvNlnFfWzAgnsaSO28Qz/q/NZbpAJ0oWV1ptWfk9?=
 =?us-ascii?Q?mIlNPZWqak4xRQX3K/REcp0H8C9LGeENzo1AXpVBCMKTI9mt98B8T5IiS4yQ?=
 =?us-ascii?Q?tNYrRl5rs8PiWDI+X0AbLCxRCAiEnrt3UGB2vDa0wtTzDwYckjKunSFAN/mm?=
 =?us-ascii?Q?lRNo8bu6QntK4NXGURJCgeUonWsW2MadZuuqhsnvCcIdX1UorKtPTn1Xhtrq?=
 =?us-ascii?Q?oo5+sXVWqCAsEkglFpH6uN9VYgX5MkTRZ94E2j9mkTgfAnBrsSIWkyO9q+af?=
 =?us-ascii?Q?GxCJ/1+D71M16IduMpfhrPh/TVMyEdmJ+/yo/16qZH/AsmMzOxd2Hin0TeSj?=
 =?us-ascii?Q?Rjz/CW/MoNM2tXX0QnH7TH89gWE4d8rZHhTsJLJJ0UoxIDZToRsphnFVrv+K?=
 =?us-ascii?Q?t/H0LXClib6BlpzlV0YNj1OFMii/nu0RvLosvFcsixM+ETZ7Ad4goBpnuzon?=
 =?us-ascii?Q?yEGlZffqxWY1lfgpGcOF04BAPuFmpB+gnW4rDE996cozIHcwCVp2sLIVrMYr?=
 =?us-ascii?Q?GtB1raS84M+dDE+k2+QqLZf+ZV7ziOOXit5M0c6/j4VEheNzNClG7cgfUe7i?=
 =?us-ascii?Q?gfOVHoSkHD0X/2X2O3SnlVx5N5krNFUrINkidh/O5Mp++7Uqv7kCnYdJ3Uqn?=
 =?us-ascii?Q?fBfanz5TroRBnngjviMhr6yRZc7kM8LktEe4nq5jHVOp7AmV6ORqz4FsL4+U?=
 =?us-ascii?Q?+Q/6JuEnHmAVtktVcWssuh45pHQk3Esjb2vEuAK+j29tDkVtXufS5X0l197x?=
 =?us-ascii?Q?drTbigGzQisVZ6XP2qbYG5f7YH+c4qgby0R63yGU8iVS3m2I7kuQZQdLFG9C?=
 =?us-ascii?Q?YaDGAlEW+LLcmCqWZDajs6c7t2GXI4vfgAZyvsTmOF4fE+hmJWys3Vw1RP2m?=
 =?us-ascii?Q?zZzxiHfRuVHbLwEVuMQz/xb7tNT0IrkCu7L13bp+H3uniDUdYX8Pzjm8pYTd?=
 =?us-ascii?Q?04o+a/2Atob/83v7vwbR/MkQwUodsEJ7Fxtx35YSH4w4qrXmzHSgeMTr/rpt?=
 =?us-ascii?Q?guvveQZwhEHVW5RcvH7VZp+jImBoA2nW1mEKUOpL5mj9FKeS/dBu8ZLpBoqC?=
 =?us-ascii?Q?ZWg2Yg+Rm4g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR12MB7705.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C2yT2VB1mEDpHVooO/MvEMC4m4DCKrVpzrfERDmtErqmJ0i3M7pisKJJYVVj?=
 =?us-ascii?Q?gJd7dfHGNus0opxlbXxIGv11hcNXggrOjQjTCoKcGNUfpB6IkGqycudYW2w8?=
 =?us-ascii?Q?S7C3wMumkm8PIDCI/oZ/ZjhzmKUnljF0HV/aTCOzqIZuvRyWrEeVm8T0PMzr?=
 =?us-ascii?Q?XejsBQh+q4EsmuZFUN9Cx7SQR1JS6+Uwj2TZvDEEl7U2VJf/m1te8YecERBy?=
 =?us-ascii?Q?tthC0fFFv+PB/U32hXi5IYXGsO7qy7WBnVKwpm5zMIE8W3Jr/XGJ4ZRhXRab?=
 =?us-ascii?Q?t8aXUQsPvjR9RdfqyzTw7oHF0VbMBRGtYj6NiiTnV5AKkvhGFpEeKHa+TgM5?=
 =?us-ascii?Q?hMrg2Ll/lmbUDkMXiEBbiIlwF5FezO96NPodJog3qy/AikRI9cFBOpRdbsCf?=
 =?us-ascii?Q?kSgJxjadCsxvbRS3amv51hpjNgt97jI/45OydVQOaJr95pmu4saF44vDsFbe?=
 =?us-ascii?Q?dwgE84CxoCxBVWYfMm5rQnUZ+3mQrRRB58b7Y+V2XYTBSIV4SuTuBJ0wl1Rb?=
 =?us-ascii?Q?QyTIexGjEQ+6tzBINWhmClDjYQbT099vBtLVXzuqmtVrzhjsQzLXuFv9Ag3l?=
 =?us-ascii?Q?KXxLsx7DOhNrh5tjiYTezOY9czozKV6mqK+Ri2n7tNuXXMlQEohyA6xjZOhE?=
 =?us-ascii?Q?yH4cw36BmB+UNdmNXQG48ZpR04kDpMwlkzDj+sEafiviciq0SEW9Ptay0PhB?=
 =?us-ascii?Q?txneeuFhW9zYq3vo+gBvg15a2IPWtoJ2zoF8YTBfbHWIYXmvTNMguevB0+bf?=
 =?us-ascii?Q?dCkDnFW5WwpZKeRKSWqYDIsyAmYDmlJnTbDHC9A6D3XmmWquFV5I9EPAO5v/?=
 =?us-ascii?Q?Iel6MS0fH41RqBDy73LGKygs9HPqFwfHXGSchC5swbi10ufln4II6+VR4GcZ?=
 =?us-ascii?Q?jgYdS0vdAs3LdX/LrJv23tvzHW3jrQHZ/u66yg1BkQI6SCRaQ1jzjou0sDSb?=
 =?us-ascii?Q?TtPl6lj0z0xskUx+3hhL8eQiUhvm+u2rbl6f/oONd8u4iOvUGUfe5JRaeVZr?=
 =?us-ascii?Q?D8bywgWSf4n4FAom1dSN1gd4ZldkAH9NLF0rwhI25fSwNuPMcnNaD47rF7CF?=
 =?us-ascii?Q?QmigLHbeBucJhs8/eIv95gkz4jiTysdzIERrQvDF+XEDM8vy31gaXIDCMayp?=
 =?us-ascii?Q?P0Y/kmt3uUSbgt4l9KLywKasllf2YEPHkes6n5CCbMI8ZzbWvfUQGEzame3h?=
 =?us-ascii?Q?RTZoYCucCMe7Q0k4Fhr59r3M0LQe+GIVGx/2pk+Ctw2BAX56l0Dn5XLO3449?=
 =?us-ascii?Q?mGVJBwkMvLMAQqt902boUFN3byS0m1kPYQk1YvamWeAg3oGzfbEJ9gqoOeBX?=
 =?us-ascii?Q?PcXSHF8iIs2GVR4IHdV5tCKRgu+kxA+ygJyyDXl6BfuWXCWgmGxP7GXETH31?=
 =?us-ascii?Q?IicXSEXAjWkvd/3bNgC164CyuG37LrRrcJOvVufaMOF3wxGdu5TOoXcM+5O/?=
 =?us-ascii?Q?TNzfNjFhHlkg2AQXDCDcVCmhVR4SNuL2jlXA+QNctLqorcrciiN+56AlEmQZ?=
 =?us-ascii?Q?FkoFcoUx4AbDp9uRZVjItO0PEzJekz46ihHGvjZzOUX8nbB2mihVC+Hjo9Wy?=
 =?us-ascii?Q?z6GUBboiaqXs7ysYPfCYEJdTPK9phcQ4W4W8UaU8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 818c82d6-5320-42b4-5e86-08ddaccd25ac
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 11:58:46.0428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GA8O847Pc9ZIPqldbpZriUyXUCHo/MOS5eSU/cNQpCF+Fu8Pm4yL9ZKGEMZdpsvL6F4t1cFs2J9KBIS1UGwnlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9517
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

Previously dax pages were skipped by the pagewalk code as pud_special() or
vm_normal_page{_pmd}() would be false for DAX pages. Now that dax pages are
refcounted normally that is no longer the case, so the pagewalk code will
start returning them.

Most callers already explicitly filter for DAX or zone device pages so
don't need updating. However some don't, so add checks to those callers.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Changes since v1:

 - Dropped "mm/pagewalk: Skip dax pages in pagewalk" and replaced it
   with this new patch for v2

 - As suggested by David and Jason we can filter the folios in the
   callers instead of doing it in folio_start_walk(). Most callers
   already do this (see below).

I audited all callers of folio_walk_start() and found the following:

mm/ksm.c:

break_ksm() - doesn't need to filter zone_device pages because the can
never be KSM pages.

get_mergeable_page() - already filters out zone_device pages.
scan_get_next_rmap_iterm() - already filters out zone_device_pages.

mm/huge_memory.c:

split_huge_pages_pid() - already checks for DAX with
vma_not_suitable_for_thp_split()

mm/rmap.c:

make_device_exclusive() - only works on anonymous pages, although
there'd be no issue with finding a DAX page even if support was extended
to file-backed pages.

mm/migrate.c:

add_folio_for_migration() - already checks the vma with vma_migratable()
do_pages_stat_array() - explicitly checks for zone_device folios

kernel/event/uprobes.c:

uprobe_write_opcode() - only works on anonymous pages, not sure if
zone_device could ever work so add an explicit check

arch/s390/mm/fault.c:

do_secure_storage_access() - not sure so be conservative and add a check

arch/s390/kernel/uv.c:

make_hva_secure() - not sure so be conservative and add a check
---
 arch/s390/kernel/uv.c   | 2 +-
 arch/s390/mm/fault.c    | 2 +-
 kernel/events/uprobes.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/s390/kernel/uv.c b/arch/s390/kernel/uv.c
index b99478e..55aa280 100644
--- a/arch/s390/kernel/uv.c
+++ b/arch/s390/kernel/uv.c
@@ -424,7 +424,7 @@ int make_hva_secure(struct mm_struct *mm, unsigned long hva, struct uv_cb_header
 		return -EFAULT;
 	}
 	folio = folio_walk_start(&fw, vma, hva, 0);
-	if (!folio) {
+	if (!folio || folio_is_zone_device(folio)) {
 		mmap_read_unlock(mm);
 		return -ENXIO;
 	}
diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
index e1ad05b..df1a067 100644
--- a/arch/s390/mm/fault.c
+++ b/arch/s390/mm/fault.c
@@ -449,7 +449,7 @@ void do_secure_storage_access(struct pt_regs *regs)
 		if (!vma)
 			return handle_fault_error(regs, SEGV_MAPERR);
 		folio = folio_walk_start(&fw, vma, addr, 0);
-		if (!folio) {
+		if (!folio || folio_is_zone_device(folio)) {
 			mmap_read_unlock(mm);
 			return;
 		}
diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 8a601df..f774367 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -539,7 +539,7 @@ int uprobe_write_opcode(struct arch_uprobe *auprobe, struct vm_area_struct *vma,
 	}
 
 	ret = 0;
-	if (unlikely(!folio_test_anon(folio))) {
+	if (unlikely(!folio_test_anon(folio) || folio_is_zone_device(folio))) {
 		VM_WARN_ON_ONCE(is_register);
 		folio_put(folio);
 		goto out;
-- 
git-series 0.9.1
