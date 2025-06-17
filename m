Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D45B4ADDC25
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 21:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84ABD10E095;
	Tue, 17 Jun 2025 19:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cohLoZ91";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494E010E095
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 19:20:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtEk4QO9l0kNYQIVs01X+dXKzZTmHDHER0ewQhFtdGZcsNeiqA/574zkkI9UNNbzG8mJoUL2r6nQTw57y0AKaFifGGt4qMVqk/2tZ/JjlNuoebGDq20DwWhYH8pGj8lPKlc2jfIkMK6fGrJ/hmsWpmISUH2YPau0EE1jU35hgPHl9m5zG/MSv2AguBx8dnoDK3IiyOEufYRaxZi5fqm/CSNFRp9V+9X9BGKBHleuEl9HuLaHBDuZjtPao0nx37xahAenZAPlqszbDJNx5l+4YRI1FmZZssNzYUrmLhmvOuqm2ydDHEzDZ7nzzSFYx1zTzF749+SSjecTUqCEd/5KRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAtoXTpu3mray1f1ixmSfchadSFtQKXNEFERGHk66Ds=;
 b=Tx7XFh7SknAQ+Ofh9giqukBWqvGtb/Kko/HwOtNt/afRUAgNrsOuuUjk2AkTc33gP3APYuP6prcH4aCBsRTyxFNNaAQVZ9OgXZNYA0Fh5whGMhCCtyr2TRwA5JoP6OwBvpKqlNaEh9gBgevFkabMqFlaxIOTo826uVUkXw/6dYwWWReF2buM3lFRtIQlKQ57CWdjL+ry92px12TNiqDLAe8ASbzoQyba5dsoInjVOwB5iJlufZH7t+CDIaENh82nxpbnlFYEkRGg8Fe+kCe62ZBHwhCtoih1ZrX7rabklggq5/8xAOobSk8lybNPxTRqMIVdZkCvy2PTY6be5iDwOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAtoXTpu3mray1f1ixmSfchadSFtQKXNEFERGHk66Ds=;
 b=cohLoZ91G5407TXUY1PukuL74GXwJU1/BWZyi581hRFWr2bLrTio6dMXM15GwL1cBA87NUcYY9BVHB2l0UdGNXhrRhSTP2NA0KM4VDbTS4mKt2eHuV4U/exsqwsTFgXEbI3ikWITntRK8aEmkqitA+VFJ0/M5FaRKyHIHFfq88JegULKmzecJwH7Itj3s+6XNUyLQg1BSDwUM+xO4q6m6eDdzgl+2KsS68kHkkXWqQY8qhclV79/+F2ElvlSRrCsvNoHcKL+VfpSXkzzeEREi5+HNGR1TJfNvqislassy9muMDxKkUaJe6zl9sLRGg8VrD4Oj1FXyyTq0hA2Gz50aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8)
 by LV8PR12MB9206.namprd12.prod.outlook.com (2603:10b6:408:186::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 19:20:42 +0000
Received: from IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650]) by IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650%5]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 19:20:42 +0000
Date: Tue, 17 Jun 2025 14:20:37 -0500
From: Daniel Dadap <ddadap@nvidia.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:INTEL IOMMU (VT-d)" <iommu@lists.linux.dev>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:VFIO DRIVER" <kvm@vger.kernel.org>,
 "open list:SOUND" <linux-sound@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v2 6/6] vgaarb: Look at all PCI display devices in VGA
 arbiter
Message-ID: <aFHABY5yTYrJ4OUw@ddadap-lakeline.nvidia.com>
References: <20250617175910.1640546-1-superm1@kernel.org>
 <20250617175910.1640546-7-superm1@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617175910.1640546-7-superm1@kernel.org>
X-ClientProxiedBy: DM5PR07CA0067.namprd07.prod.outlook.com
 (2603:10b6:4:ad::32) To IA0PR12MB8422.namprd12.prod.outlook.com
 (2603:10b6:208:3de::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8422:EE_|LV8PR12MB9206:EE_
X-MS-Office365-Filtering-Correlation-Id: 773e894c-1dce-4fbe-6616-08ddadd40cdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GTPjhZAOR2zhSs9ZQXv66F+Z0kIJqPFZ05lF5kyJRzBcWCMrMkAiObF8u9KS?=
 =?us-ascii?Q?rIADtU31hAMNP70sGTCdj7rnpc5gJuygKIjo3cLhAKDkBDhZa4IVnbROncyb?=
 =?us-ascii?Q?eSgr25ywejJ1JDSI2pBfA/UhPCFWgDSbhTNSxqM9VdtANPVGk4Ros9LRs1bj?=
 =?us-ascii?Q?b/CwLVAzOQVzZ03l+/STejWp+YON08Ev8k+zWcJjCJr0Wq2wsRgOpcL5kBr/?=
 =?us-ascii?Q?JvzbpxkikVMfoau2NxWfsIkSx6XQtMqlOMrQXF2XoOYi0sXjhgwmn1cz52A9?=
 =?us-ascii?Q?5zw27XWCaTVbmkLGwEuWYGgOUkJAn1H3L4c3bfabUB6thENcL1KN7bVSlerJ?=
 =?us-ascii?Q?tHFKKwVCnug7bCCCl7NatwgqGETgiGfwsT9XqjpgKerEOVgCApV5lN1zsaQp?=
 =?us-ascii?Q?ZALwKMnTZQLFjSdSmNPXssJgVRFpS/IBsERml5X0rLFuVN0nh/7HmXYyevP2?=
 =?us-ascii?Q?BQ2J2pVGzWOrx3Eh/rXBbW5tRjlMR8Sl6D8Bx9N7WBQHJFgKX73VCEzWpxlP?=
 =?us-ascii?Q?2nUu41+gukGs+l/eNYZps8k7/f6BPRXxiTSdwmPmxfZWVieQbMaq2+0jQtSG?=
 =?us-ascii?Q?kPd1O25+6yfKp++SCkTpFZVlL/6GrGNjyZeEmi7Z0FRn1uKqzR8RH3N7okOX?=
 =?us-ascii?Q?sL0iZ0x/q+prafGrbbM3XjPVeEZkZH7/UYKz77LAZ1SbblJ5kFFGWd5sZw9X?=
 =?us-ascii?Q?AhX783xXGjMI8A7LbSyvfE0Z1Ze8WqQeC+ekc0Cn4nUAvtbuo9fDrQhWJEvx?=
 =?us-ascii?Q?MsZOu1fwFIf2THiLJ46L/8RbF7/5nXNYeBUONrxQ++4D5Z532LFb4tmuXQoc?=
 =?us-ascii?Q?nlLCqQyGleaxwYij+Vm9IAHMUcMmTgFq5unTq88kAx+TIp13aiP16HHG9vpf?=
 =?us-ascii?Q?kyu7Md1XS5pQ/7YSwNpPWNhKtixkrvfTREm/ZmAnguBv07Sg/z7xe7Wf6maG?=
 =?us-ascii?Q?DW9fNPi1uaP9mWL7MbhVPr0/vklYUQRyZSdlx0VbOTjLBKHbBlOJBd/WlRPV?=
 =?us-ascii?Q?slELOnyDpY47jnmRsctdPtuJIKJbNRUtrmEpHZlErnLeVBh3+2JVzL96Cuk4?=
 =?us-ascii?Q?MNTDvze5na6QaEhTT9MeSrRD6NrFb1Mm4qM1jKz9m6d4xHOTCrOwni+CXbIT?=
 =?us-ascii?Q?YEo6ThkpfTddZcizz/lOCgt6BOPg68wmv4KVn2yO27Jr9Gq7/W+/Z/TjH4cC?=
 =?us-ascii?Q?eQbpCq4Lcc3ewHXX3TK5rsJlV8UJkPnKS6H+sdY6SBQeUTJf+DEb/BmAViXu?=
 =?us-ascii?Q?PqnWQX/6uCpPIs0Gu90/3PGcN4xQ/HgPku97i7UOegD7fKgHZMiJPGZlPBGN?=
 =?us-ascii?Q?JpSmmRDg8KZaeHB+IzoqJGXWJJnv/EHTp4YY578JT7Uqb1MRQRJoVIPKZyYh?=
 =?us-ascii?Q?uZNS6t8lgb2SQnwt9XCSRYyvrLwjP84TM+kbvl5Av+WJutmRCF/gni4OQOph?=
 =?us-ascii?Q?h3hXGE8J5WI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR12MB8422.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FBcpyV6Ukw00ZDv7ajMxIAafP3LkUCSUnaL6E5CAHCGJU8KWj2SSGx5YqTNP?=
 =?us-ascii?Q?9VHxgyEvBdrTIBgbGqua17byELAnWZycwAQX8YmdOEf0kEA7tCz62GtTOuZe?=
 =?us-ascii?Q?xwL0a5wALS3GEN7TUKCP6N9EUHErO7QP7MvpLYgLrj7adak2QlV3q3wDbvn3?=
 =?us-ascii?Q?CW2RJeftp7S73Hz8rewHVZvbv6klQOdInZ5cauV8+iqXWsTuBPRQibXN0WFR?=
 =?us-ascii?Q?CGJS6EvJpwGV9l+Z9fAwWENqYtOlgYgTFZA7CYLN6bQjSun5hlXl6WCOeJ9k?=
 =?us-ascii?Q?K4pPDX6HExgmiNhyV7/KyODZdbW5SahhHBKWhjdRGfZlXWsO/YpSLoLz74si?=
 =?us-ascii?Q?pJ/Vy9SzdNzqjSeDIZERECQ6AmTAtw3pXaLBUTBowQnVqF9KK+xRlItINRR/?=
 =?us-ascii?Q?fEaO0YZRiN+lGV3Vc/raybN3bFPBlayFOxtq9/aZb69WzxelLUFRB+9o2uDV?=
 =?us-ascii?Q?s1qX8hUUW6rhM98r21vGj4IEV2aJV1c/r6V5ZmAchhhVQNKPAdjc+U2Y6Tqu?=
 =?us-ascii?Q?9ic3CABdRbKZXC9EYYhqXungAAvyX2atdau2DL9/uYrBzRVoCxs4Lw3Mo+RV?=
 =?us-ascii?Q?sH0bBOTUwg1JCYLqS820hvV7WeMAlBEmpI+ezQ1c0jUEFC4o1KjWr3TI9tk/?=
 =?us-ascii?Q?AGjjIGl15QyH+U3iOKG3AQf2hKTHpptf4tppfYxQbxsL/PV62CKq0QUhH4Ty?=
 =?us-ascii?Q?1oaqQQCQ9+PcZcxGSwdfSjSzgij15qfeCTdnYgPnoZc7QKNtmsFNpFFXB5d8?=
 =?us-ascii?Q?KNDda1QL+xhS03a/J5LSf0jrX6zGa8WajYQBTTDCZWzQpfGa/uPG81rmmb7x?=
 =?us-ascii?Q?+g/ig01046hyiG75gb/tT/58rNi7Jha/QAybLBEIfFwb8aEJyhtPdfOxpI/j?=
 =?us-ascii?Q?Aji1t8MX2YDi26JOT81IUDCGgokHjy49+6QgwKEc41EO25BCsejoTQ9cnDoB?=
 =?us-ascii?Q?+JZtsVSs/FGZtKB5ZoUERFTrQJfItcE3ldWTXbp6HK4j2hdm2TdYQXrCm82a?=
 =?us-ascii?Q?Jl3NARroElqXsper6rdqJ+Ut2mCg20yfdULvL+aeM8XSCSJebQbJMxKUoKFG?=
 =?us-ascii?Q?d+T7AL7yv/deXQQVd4mlU0Bq/mwjbKa73utfV3h6yCL/gf/ZbV/ua4j6fjhz?=
 =?us-ascii?Q?YDODvThcRqlltmc3Z6xudR49+tTCUFNM9T1BSOpSbYiewyU5Q8k6fyEQbM5q?=
 =?us-ascii?Q?+e3wr3PiNE6RLFOW4ifcTKsVYfIoZXHAasvyBAsdTDFqbQPiVT1injpNTkEg?=
 =?us-ascii?Q?VKfv252RQKKV35oSNLen24HswRtIlgpdR9iScrYOaYthWQjUyREZZXR0p3uu?=
 =?us-ascii?Q?/SybsAvwmC3nUtRezVmlegsqjNcKB3NLhUC/ibw5gH/XTIkhC367vjfz32LP?=
 =?us-ascii?Q?7lT2Bdj3oiMsn0PU7PYJmVqe8sa1udJMh4+BUeQWPMeel/zvY/UReja+yr/V?=
 =?us-ascii?Q?JVEi91+JSlL1XncTUUsXSA63ysJ4gN7ZRdjjg3gWBZZhCfEDK/uhKeCiFs9m?=
 =?us-ascii?Q?FGEutmVeuuazG/sGssLfYL9ynexrLBUBD4RyXDtgE/mVfSgAv9iAjxIPLBeT?=
 =?us-ascii?Q?t5odIYtbDyxHcsyS/BOvzKAMeis4jxK8eTyAROVw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 773e894c-1dce-4fbe-6616-08ddadd40cdf
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8422.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 19:20:41.9666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FfeKCeHH/zXzL3Ip0ZH0250sWh+l39Z3Pg1NMfZqeDS55GZkJLnIPL20tjx/mE2FRqL1rpmuVGKFKmXNK1+eXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9206
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

On Tue, Jun 17, 2025 at 12:59:10PM -0500, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> On a mobile system with an AMD integrated GPU + NVIDIA discrete GPU the
> AMD GPU is not being selected by some desktop environments for any
> rendering tasks. This is because neither GPU is being treated as
> "boot_vga" but that is what some environments use to select a GPU [1].
> 
> The VGA arbiter driver only looks at devices that report as PCI display
> VGA class devices. Neither GPU on the system is a PCI display VGA class
> device:
> 
> c5:00.0 3D controller: NVIDIA Corporation Device 2db9 (rev a1)
> c6:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] Device 150e (rev d1)
> 
> If the GPUs were looked at the vga_is_firmware_default() function actually
> does do a good job at recognizing the case from the device used for the
> firmware framebuffer.
> 
> Modify the VGA arbiter code and matching sysfs file entries to examine all
> PCI display class devices. The existing logic stays the same.
> 
> This will cause all GPUs to gain a `boot_vga` file, but the correct device
> (AMD GPU in this case) will now show `1` and the incorrect device shows `0`.
> Userspace then picks the right device as well.
> 
> Link: https://github.com/robherring/libpciaccess/commit/b2838fb61c3542f107014b285cbda097acae1e12 [1]
> Suggested-by: Daniel Dadap <ddadap@nvidia.com>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/pci/pci-sysfs.c | 2 +-
>  drivers/pci/vgaarb.c    | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index 268c69daa4d57..c314ee1b3f9ac 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -1707,7 +1707,7 @@ static umode_t pci_dev_attrs_are_visible(struct kobject *kobj,
>  	struct device *dev = kobj_to_dev(kobj);
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  
> -	if (a == &dev_attr_boot_vga.attr && pci_is_vga(pdev))
> +	if (a == &dev_attr_boot_vga.attr && pci_is_display(pdev))
>  		return a->mode;

I can't help but worry about userspace clients that might be checking for
the presence of the boot_vga sysfs file but don't check its contents. I
understand that it's the intention to expose the file for non-VGA display
controllers in the case where none of the display controllers are of the
VGA subclass, but one of them is the boot console device and should be
considered "VGA" for the purposes of the overloaded meaning of "VGA", but
if it isn't too much trouble to minimize the change to UAPI here, I'd be
more comfortable with only exposing this file for devices that really are
VGA and/or the firmware default.

Maybe something like making the condition:

if (a == &dev_attr_boot_vga.attr) {
	if (pci_is_vga(pdev) ||
	    (pci_is_display(pdev) && vga_default_device() == pdev))
		return a->mode;
}

(maybe we don't even need the pci_is_display() check at that point? I
feel more comfortable leaving it in, though)

I'd expect that to do something like (assuming two-GPU hybrid system):

* Systems with one VGA controller and one 3D controller:
  * VGA controller gets boot_vga file, contents are "1"
  * 3D controller does not get boot_vga file
* Systems with no VGA controllers and two 3D controllers:
  * 3D controller driving the console gets boot_vga file: "1"
  * 3D controller not driving the console does not get boot_vga file
* Systems with two VGA controllers and no 3D controllers:
  * VGA controller driving the console gets boot_vga file: "1"
  * VGA controller not driving the console gets boot_vga file: "0"

i.e., the behavior would only be visibly different in the case with two
3D controllers, like the one targeted by this patch. You and I have seen
the two VGA controller case in the wild, so we know it exists. The one 3D
and one VGA controller case is what I'd expect to be the common one, and
hopefully this will have the same behavior before and after this change
regardless of whether a muxed system defaults to dGPU (like hybrid Mac
notebooks) or iGPU (like other hybrid systems I'm accustomed to).

>  
>  	return 0;
> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> index 78748e8d2dbae..63216e5787d73 100644
> --- a/drivers/pci/vgaarb.c
> +++ b/drivers/pci/vgaarb.c
> @@ -1499,8 +1499,8 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
>  
>  	vgaarb_dbg(dev, "%s\n", __func__);
>  
> -	/* Only deal with VGA class devices */
> -	if (!pci_is_vga(pdev))
> +	/* Only deal with PCI display class devices */
> +	if (!pci_is_display(pdev))
>  		return 0;
>  
>  	/*
> @@ -1546,12 +1546,12 @@ static int __init vga_arb_device_init(void)
>  
>  	bus_register_notifier(&pci_bus_type, &pci_notifier);
>  
> -	/* Add all VGA class PCI devices by default */
> +	/* Add all PCI display class devices by default */
>  	pdev = NULL;
>  	while ((pdev =
>  		pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
>  			       PCI_ANY_ID, pdev)) != NULL) {
> -		if (pci_is_vga(pdev))
> +		if (pci_is_display(pdev))
>  			vga_arbiter_add_pci_device(pdev);
>  	}
>  
> -- 
> 2.43.0
> 
