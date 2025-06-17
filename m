Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA88ADDD7C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 22:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E5210E149;
	Tue, 17 Jun 2025 20:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="neB8o4Il";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 841C010E149
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 20:56:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdRTTM5pNVNUDNky541NIoILdc0CSJUPCETd/eZpI/1ipkS2hnBjgQGDKhB7aAukboMRfQcWSaSD9A/WL9nGlvhw+trPhX7IAfNYUAshfB9hpdtgzV7eykKJLSG2hsudEgU77zkJ5kFYKmOj/DdfYl25w8E06LWhvoe1TMNysZByHdoR+QXezy4jcVoeY/7DTWGnpTIvsHq/POZD5i75RZB8hrumuxBWS133K9hZRpvFIfKCVpGvgk+WEhu4UyzkZXYiU3e4vDc0mv5jCiFsWgb6KDHl0jH34937eIfl7AdS9KuhU4md2sV0gNYJWZDMKbcrVKfnZvaHJuJvKFCQrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPUQNDafWxG2AjH+PAIh31ni9hRVeH/NRRYaP1Lxz8E=;
 b=Lqb6EKAcTytUuAipdvEl+tAPOnKsMiDoN3rXwdwMjIUgd9stsh98TXI3XO1nwYWA4tDh13R9ip4ePa9tKs0MwtqOpv6KYaDpgt63MPFb8EPuIALVILNZwEZOSyJqQ0tLmrL26qrmDYkp9+ursKcznSKL+ORHc4ymCKrOKo1J1bYXrIP2sOcBUxWukQWZc/fyhPdHPI9ks/ZonDYEcYxMqBH4T43KQT7meqhTSRPdC3co/DZz76inLiNUzEoriEthcFrC0sws7w0GBHNw/YeWlSnWFqPBEOTfuFFWqG41KEA7BG5JxYya4/dbJ4dAgn4midfsjOeRas8QoBqs+gIx1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPUQNDafWxG2AjH+PAIh31ni9hRVeH/NRRYaP1Lxz8E=;
 b=neB8o4Il6G2msOSKzgPI8V+w6j+Dto2HraLCUbCVSNrWUfu4iyHQA0Unn26uAtbpZXkz+5U1VjB3L6TiXL/oRT/7tiOhEpaRFz4hhWpwF84kuwoBGepuRT5/9h1G2Z3oAJXjThg3y4c8iEGWR+HNbERhtPvcSgC4HI9eU1kWw+vP02P0p2cgRpgw6kaCzgwI96srES2rIYwHt8Xrkc4VP4zthZeDtMlTkw3EVb2qpYGdVao/TcvPpwiQSho0VAdGMgLFhczYZwmsWY0j3ZinVXUIhMJu7QHCrHdOCSEoWeuRkf/UrE8WoTb5NU3lqY3Pjk4O7XF/RXPXWZCSp4uh8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Tue, 17 Jun
 2025 20:56:33 +0000
Received: from IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650]) by IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650%5]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 20:56:32 +0000
Date: Tue, 17 Jun 2025 15:56:26 -0500
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
Message-ID: <aFHWejvqNpGv-3UI@ddadap-lakeline.nvidia.com>
References: <20250617175910.1640546-1-superm1@kernel.org>
 <20250617175910.1640546-7-superm1@kernel.org>
 <aFHABY5yTYrJ4OUw@ddadap-lakeline.nvidia.com>
 <d40a585f-6eca-45dd-aa9f-7dcda065c80a@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d40a585f-6eca-45dd-aa9f-7dcda065c80a@kernel.org>
X-ClientProxiedBy: BYAPR06CA0016.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::29) To IA0PR12MB8422.namprd12.prod.outlook.com
 (2603:10b6:208:3de::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8422:EE_|SA0PR12MB4462:EE_
X-MS-Office365-Filtering-Correlation-Id: e1b09a18-9887-438a-60a5-08ddade170a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aDoGkcNUGrIdjce73DxsY96R4p38ArR664cCBIiacJoHsvBrByc9Uxyeuxso?=
 =?us-ascii?Q?VnwbfQrYd+2mPOjjGn6U59tXyt9okyqOIGKE9iOLEJ+pNDStQyxSvVNYZNPY?=
 =?us-ascii?Q?KkxJxuN2MIC5ED0p1xKRRl8AZBBYvBOz+f9XpWFlc4VFgYFZxQp81A8suF9S?=
 =?us-ascii?Q?N2xBa579c3YWUiN7FBI+Uc9yJIFYF4+q2akUCRBQz/QorcBW0jAFe2wB16KD?=
 =?us-ascii?Q?gnsocvTp4MTgh/3MtbF/XxljWNDzQenv14puAeIWEoZvn9GJFwT0zfSSoon3?=
 =?us-ascii?Q?0QhX41xD1EQD7bDQCt8iPxYPffXv63aVeOgu3077RUCPU4QrhbOv8F8kDWcw?=
 =?us-ascii?Q?+YyMOvc0GpGkuYYzOn2paSChDUE6rpB3b9HgEDFLR059rMiDOeDal2AFeep7?=
 =?us-ascii?Q?wnJrwc7fBRHXQMJfkyRfn1NwCsIJYa/ZsY8GCmk7WeATjJsaeGxhkJ18DySv?=
 =?us-ascii?Q?eL6dOdXX1Q1rESO8904G3QPFYcBlcotdoLiSaQZfa9Qkii3XC8bIGYZ0wqb3?=
 =?us-ascii?Q?ZmFOda4l9kqxJgTON1tc7frJnIQGnUOoIn81Ti9s12P/7xVwVRR97uSG5Cxp?=
 =?us-ascii?Q?oleIrkp0X7bUF13il0MA19WV6VIp4yFl8mKY/Fe3FxDl8XPHRIVk6InHw6xo?=
 =?us-ascii?Q?wM+95N6+qwB3p89LpRDUWxXSYY2i7ekzLg/ehxMU6ssEpDH072gdwY0IZlrl?=
 =?us-ascii?Q?JZdOHtSl9GaFjAzsYaVBtPLe6NM57xS1Uez7JCIdvL4kXO2h58bB8qycGh0w?=
 =?us-ascii?Q?HQUJeM8Slrtk1QgrEFf+QqLG6OgGRA0A+buk/33kyNNAwv4aOpF7lTEV9xPh?=
 =?us-ascii?Q?a6j3nygakkw/gg/uVlI6qNyBmdhkDNM/2zIEJDGEnaHKOWvVHbXMs3OOuwlk?=
 =?us-ascii?Q?RfGLDB2QreEkqcSdbsh8Wg2GaSHamVu44Vumx6sms3Mro8Mtt8RxHv6UnwMA?=
 =?us-ascii?Q?iSSVT2bcQG0ZAI1WAp+EYDqx5Kz1r2Jx/ZyRfvEEWVpqC2xUhLWhycdLwjub?=
 =?us-ascii?Q?z4Yye5K9HyrLJn2qw8CyavPNiAWLn7wumopbKvR0yxhYs1p8jd9/R1NW7qCs?=
 =?us-ascii?Q?s8pDVR1SgxOms0anygBtS//HPVARZfQAXtbLmi+B5eYwA65dGPiA7vVPI/2n?=
 =?us-ascii?Q?21vVkHzwiURAVjnVgzkMAkvXcP8+7D6oib/oVTpjDImUDWCCvfABEBaJYZvV?=
 =?us-ascii?Q?/864zv+u3n+ZqiAjNr6PGVWLtOMY3vc8S7h8YKoGh+zNybgPjWsRp947urVH?=
 =?us-ascii?Q?hRAjtDV5lBLn80sYAu5WZjHjaMdWN6Xs9WqZA2F3bkkprS3ze2g0qf0ZjpB8?=
 =?us-ascii?Q?IX3+GV+W4SfquoM9tHvuH4n9GsY+YaZqK4/YeZ+I9wh2nFeIUXuRDdWU2Ush?=
 =?us-ascii?Q?hAFYqr1lLGT5qI95VoS6VIJGrGOVUbARgEn2lDTN+hQ8BS+fzQmO792/ALOM?=
 =?us-ascii?Q?p7CjnotBgpA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR12MB8422.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?05hwKl5IiTxhdh5IXvqJAiA8LTfKh4ydU1w6h9sFV6gmZBLYWenoXDTUyLb1?=
 =?us-ascii?Q?4pWxdy9HNG1HKco5cr5gqNgKquhsS0FH+YnrC2YLNyGFzd6WDhcvzsizqfVF?=
 =?us-ascii?Q?y+o5keiWpejXlTmQfW8DniBcfn7Jg5YuLlOITwifKoye5HXACJ8ZqlY6OLOL?=
 =?us-ascii?Q?BK1/Wu5xgtUp6GgHlzDdavBfjOrUgE95CtK+qTj+2m1NZ9KELQUzlpCPCMIv?=
 =?us-ascii?Q?/Lda8a9JdHAg291pOL0uF10tdtg/EG4q3EqCVU5/jr0We9hS90ZFEnstOHvv?=
 =?us-ascii?Q?a26TztY//dmIr60eWt443OBmzLghjCqtwbSQ8IrnN33PEHllKnAT7O2PmMS3?=
 =?us-ascii?Q?ow0lOGX8FRRbujzT+UN3X+AN+3JGj0MlJPQXxARc7IB8T8ctzD4esjYXMgeU?=
 =?us-ascii?Q?sWiZokwIcn3M1lHSB8usfG2w97/NRKYfxQ2FzwjsicyLRF2gYHd9g0udVYqo?=
 =?us-ascii?Q?o061pn4VFJQFbXKnUCw1DY/SNCMdv5xb6EaMvkiSHbSeTZk0kowNccL7ge+t?=
 =?us-ascii?Q?4g2p6ffpseRiZYMWPS5NkDejjvV8aPmt7Kx7Se+9DTjf6vcszRxiPYa4+pml?=
 =?us-ascii?Q?c0EGak2dtiXfKTv5kCuUInhJMssQCck5ZWlvID18TuLFuVOGLRW9rLTTF/HI?=
 =?us-ascii?Q?W9fsQWlxXhXTR35mU60VAEjgc1l1FpYAr4tELTuXQhXCdrVCeB5UUvSY7wM4?=
 =?us-ascii?Q?qW1zOfLyGFjrfZzHUuNu5nTDUpsCvrllA35cRlv/DM6YFlAD9Jmkji2m0FPo?=
 =?us-ascii?Q?fE/ndpXPp+H/2Nd/ZquWcNCQ9LksMqVSM1bB84RP1NZrPLLmBJeeOfv1JG2+?=
 =?us-ascii?Q?Ibh5OCw5jHcBbZSPoMOby0JWwz1TQ3UeEpNI0v0ydvH6n39/eNjDIAhAA6RT?=
 =?us-ascii?Q?dgUNcVBtKZw9Nbv2l0ubdVd2TPPoPaG4txliMe91sI3kE3mG20o8Lfy/CmYJ?=
 =?us-ascii?Q?bvdh8KhwTaWAqoiu0jtEU3qCIJEnwXQSw3dd18fHUTppSorWGweNFepET9jv?=
 =?us-ascii?Q?IHVz358ow87MVFXRcedHYHuqrgrUjhHIvPgdqwCAXhogCZQxNiDjTzde/GMs?=
 =?us-ascii?Q?RMGyt05gXj04fMQ93yHL8tk+dS9dj3v+0UoDpHR0V9qaGT7sYZUFdrxWPDK7?=
 =?us-ascii?Q?dvWLkeXs5asN07jWgPMGquA2ROpejMSc4UzIhA37lcx8OwqJCpmCfCeV7UJz?=
 =?us-ascii?Q?EoqpdZz96TO09kE62sZOSXD47JFtzw6RT6w6fP1aC8dhm3Z042vKMKg0Xyle?=
 =?us-ascii?Q?MTJaMjs18T2XSpwU1HvK+JpAJy1HOwRB+g5BXOvN4ZjartCQD0fIiPos8ZUl?=
 =?us-ascii?Q?q6kdxhRemhyjEX7Q+DJy25zvosHUf/TNK09EIBVxEEUbk8kw6Cq6z1IBWjQ+?=
 =?us-ascii?Q?f7c1U3z/9CMgTHukTYapw30+GHg7SrnqfM7QV15HM89q7M80M5NaFVekrPgq?=
 =?us-ascii?Q?Jzw+yxtMBm4rwRJIArDiPNkkhyujPIgNOdcyyk2UIIELyhiH0Y6wydmeVEJy?=
 =?us-ascii?Q?UdkJctqHAaykLKndijE9CBm6U5039zeKzbtEZkheNyVOv2GbhoO3D8T8C4nm?=
 =?us-ascii?Q?Y7cVfMfn6BGCqW7RbQ4n3NPNUIt5MSaFiiwuZkFu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b09a18-9887-438a-60a5-08ddade170a0
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8422.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 20:56:32.8238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ed9zkJKG/1Ko6kXJiic4rZtQYVJQ4wwxYhS1UeiGKlKeCI8wX4CWxYoW0R8wK+fyWMwv3u5V4vm3CpJ6E5G5lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4462
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

On Tue, Jun 17, 2025 at 03:15:35PM -0500, Mario Limonciello wrote:
> 
> 
> On 6/17/25 2:20 PM, Daniel Dadap wrote:
> > On Tue, Jun 17, 2025 at 12:59:10PM -0500, Mario Limonciello wrote:
> > > From: Mario Limonciello <mario.limonciello@amd.com>
> > > 
> > > On a mobile system with an AMD integrated GPU + NVIDIA discrete GPU the
> > > AMD GPU is not being selected by some desktop environments for any
> > > rendering tasks. This is because neither GPU is being treated as
> > > "boot_vga" but that is what some environments use to select a GPU [1].
> > > 
> > > The VGA arbiter driver only looks at devices that report as PCI display
> > > VGA class devices. Neither GPU on the system is a PCI display VGA class
> > > device:
> > > 
> > > c5:00.0 3D controller: NVIDIA Corporation Device 2db9 (rev a1)
> > > c6:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] Device 150e (rev d1)
> > > 
> > > If the GPUs were looked at the vga_is_firmware_default() function actually
> > > does do a good job at recognizing the case from the device used for the
> > > firmware framebuffer.
> > > 
> > > Modify the VGA arbiter code and matching sysfs file entries to examine all
> > > PCI display class devices. The existing logic stays the same.
> > > 
> > > This will cause all GPUs to gain a `boot_vga` file, but the correct device
> > > (AMD GPU in this case) will now show `1` and the incorrect device shows `0`.
> > > Userspace then picks the right device as well.
> > > 
> > > Link: https://github.com/robherring/libpciaccess/commit/b2838fb61c3542f107014b285cbda097acae1e12 [1]
> > > Suggested-by: Daniel Dadap <ddadap@nvidia.com>
> > > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > > ---
> > >   drivers/pci/pci-sysfs.c | 2 +-
> > >   drivers/pci/vgaarb.c    | 8 ++++----
> > >   2 files changed, 5 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> > > index 268c69daa4d57..c314ee1b3f9ac 100644
> > > --- a/drivers/pci/pci-sysfs.c
> > > +++ b/drivers/pci/pci-sysfs.c
> > > @@ -1707,7 +1707,7 @@ static umode_t pci_dev_attrs_are_visible(struct kobject *kobj,
> > >   	struct device *dev = kobj_to_dev(kobj);
> > >   	struct pci_dev *pdev = to_pci_dev(dev);
> > > -	if (a == &dev_attr_boot_vga.attr && pci_is_vga(pdev))
> > > +	if (a == &dev_attr_boot_vga.attr && pci_is_display(pdev))
> > >   		return a->mode;
> > 
> > I can't help but worry about userspace clients that might be checking for
> > the presence of the boot_vga sysfs file but don't check its contents.
> 
> Wouldn't those clients "already" be broken by such an assumption?
> We know today that there are systems with two VGA devices in them too.
>

Yes, for systems with multiple VGA devices, which is an uncommon case. I
think that on systems with one VGA device and one 3D device, which is
probably the most common case, this change might break such clients.
 
> I'd think those should have both GPUs exporting a file and one having a 0
> the other 1.

Yeah, agreed. I'd consider it a userspace bug if the client only tests for
the presence of the file but doesn't look at its contents, but it's still
preferable not to break (hypothetical, buggy) clients unnecessarily. One
could make a philosophical argument that "boot_vga" should really mean VGA
subclass, as the name implies, but even so I think that, in lieu of a new
interface to report what the desktop environments are actually trying to
test for (which nobody uses yet because it doesn't exist), exposing the
boot_vga file for a non-VGA GPU in the special case of there being zero
VGA GPUs on the system is a reasonable and practical compromise to allow
existing code to work on the zero-VGA systems.

I think it ultimately comes down to a semantic argument about what "VGA"
is really supposed to mean here. There's the real, honest-to-goodness VGA
interface with INT 10h and VBE, and then there's the common de facto sort
of shorthand convention (commonly but not universally followed) where VGA
means it can drive displays and 3D means it can't. It used to be the case
(at least on x86) that display controllers which could drive real display
hardware were always VGA-compatible, and display controllers were not VGA
compatible could never drive real display hardware, which I think is how
that convention originated, but on UEFI systems with no CSM support, it's
not necessarily true any more. However, there's so much existing software
out there that conflates VGA-ness with display-ness that some controllers
with no actual VGA support get listed with the VGA controller subclass to
avoid breaking such software.

If you go by the language of the definitions for the subclasses of PCI
base class 03h, it seems pretty clear that the VGA subclass is supposed
to mean actually compatible with real honest-to-goodness VGA. So those
non-VGA devices that pretend to be VGA for software compatibility aren't
following the spec. I'd be willing to wager that the system in question
is being accurate when it says that it has no VGA controllers. It is
arguably a userspace bug that these desktop environments are testing for
"VGA" when they really probably mean something else, but it will probably
take some time to hunt down everything that's relying on boot_vga for
possibly wrong reasons, and I think the pragmatic option is to lie about
it until we have a better way to test for whatever the desktops really
want to know, and that better way is widely used. But it would be nice to
limit the lying to cases where it unbreaks things if we can.

> 
> > I
> > understand that it's the intention to expose the file for non-VGA display
> > controllers in the case where none of the display controllers are of the
> > VGA subclass, but one of them is the boot console device and should be
> > considered "VGA" for the purposes of the overloaded meaning of "VGA", but
> > if it isn't too much trouble to minimize the change to UAPI here, I'd be
> > more comfortable with only exposing this file for devices that really are
> > VGA and/or the firmware default.
> > 
> > Maybe something like making the condition:
> > 
> > if (a == &dev_attr_boot_vga.attr) {
> > 	if (pci_is_vga(pdev) ||
> > 	    (pci_is_display(pdev) && vga_default_device() == pdev))
> > 		return a->mode;
> > }
> > 
> > (maybe we don't even need the pci_is_display() check at that point? I
> > feel more comfortable leaving it in, though)
> 
> I suppose it depends upon call order whether the above works or not.
> 
> I'm not sure 'off hand' right now.
> 
> > > I'd expect that to do something like (assuming two-GPU hybrid system):
> > 
> > * Systems with one VGA controller and one 3D controller:
> >    * VGA controller gets boot_vga file, contents are "1"
> >    * 3D controller does not get boot_vga file
> > * Systems with no VGA controllers and two 3D controllers:
> >    * 3D controller driving the console gets boot_vga file: "1"
> >    * 3D controller not driving the console does not get boot_vga file
> > * Systems with two VGA controllers and no 3D controllers:
> >    * VGA controller driving the console gets boot_vga file: "1"
> >    * VGA controller not driving the console gets boot_vga file: "0"
> > 
> > i.e., the behavior would only be visibly different in the case with two
> > 3D controllers, like the one targeted by this patch. You and I have seen
> > the two VGA controller case in the wild, so we know it exists.
> 
> Yeah I wish we had some more data from that reporter right now to
> potentially support a proposal that would help their system too.
> 
> This patch as it is today will only help case 1 and 2.

I don't think case 1 needs any help: the behavior I describe above is what
I expect the existing behavior to be. However if you expose boot_vga files
for all display controllers, the behavior for case 1 (which I expect to be
the common case) will be different after that change: both controllers get
a boot_vga file with different contents, versus only the VGA controller
having a boot_vga file previously.

> 
> > The one 3D
> > and one VGA controller case is what I'd expect to be the common one, and
> > hopefully this will have the same behavior before and after this change
> > regardless of whether a muxed system defaults to dGPU (like hybrid Mac
> > notebooks) or iGPU (like other hybrid systems I'm accustomed to).
> > 
> > >   	return 0;
> > > diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> > > index 78748e8d2dbae..63216e5787d73 100644
> > > --- a/drivers/pci/vgaarb.c
> > > +++ b/drivers/pci/vgaarb.c
> > > @@ -1499,8 +1499,8 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
> > >   	vgaarb_dbg(dev, "%s\n", __func__);
> > > -	/* Only deal with VGA class devices */
> > > -	if (!pci_is_vga(pdev))
> > > +	/* Only deal with PCI display class devices */
> > > +	if (!pci_is_display(pdev))
> > >   		return 0;
> > >   	/*
> > > @@ -1546,12 +1546,12 @@ static int __init vga_arb_device_init(void)
> > >   	bus_register_notifier(&pci_bus_type, &pci_notifier);
> > > -	/* Add all VGA class PCI devices by default */
> > > +	/* Add all PCI display class devices by default */
> > >   	pdev = NULL;
> > >   	while ((pdev =
> > >   		pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
> > >   			       PCI_ANY_ID, pdev)) != NULL) {
> > > -		if (pci_is_vga(pdev))
> > > +		if (pci_is_display(pdev))
> > >   			vga_arbiter_add_pci_device(pdev);
> > >   	}
> > > -- 
> > > 2.43.0
> > > 
> 
