Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF9EADF84D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 23:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B03F10E931;
	Wed, 18 Jun 2025 21:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rNft5JhY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF1910E4A2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 21:04:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UUQT938kQCMhlFiDYXHuSYSV4ZuGYvSWGUsrUBeet5db+pzuZ9hpBF6hL1zqIRjIFgGHyGpWLnIaCO5anFVuLlbd0dQpmwYY4XjHZHMA4TYlIs+If0z38bvLVpkJuGVE8BB91eiW4Wa4lR2Ph3Ou2ek1GM6zff0ypDnMgtemXG7nn8brPSO/7hXb4XH6n9+06YTJ/fSyWmXVgndNQMykFKLCswfU6WumR3E5B+YnLm237G5COqLCoK/qAUmXDLITLk2n3smVOFx8YsP3+Da4RpqviNxewJFC990WvTL4hohbjUuWVuy8U8dS1dgVpiLAvwvK5xOCNP173s8O66qBsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ettl+gMB029fJzWzjCQwLIEmoocGuVM1ItwcZeH/mmE=;
 b=auI6aM6qicYn1QhtD5Ta1A2R+wTy27ekhZkQknff3zhLeIe5Mx+IcT6Yhgc+EGliQX2fV4pJkURC0IvRXqYWoAMpOm2IpKGLS6IZTdLJXZBsKRxo7Hj6HmqQHDn8Ta9CFLlJtZIEbZTG8m+spVqG3xJCEr9oV0G9NGO40nyjfglSvpvyvIEKALXRGN6l1hrbmw5RYzD1mqXjyap3ypiw3MKcWt2m3/VBPDdD13ulRJNv/M8WMOE0l75iyNAXFlXldZnENFd+JOt8KJDsZqIzVPUdigdug1+XB5J/XGtIGW2HHj84JkU6a7wsnNiwmkp8obK0JZAJXph8iaHeZDu5hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ettl+gMB029fJzWzjCQwLIEmoocGuVM1ItwcZeH/mmE=;
 b=rNft5JhYSdgGuQ5Kv38mpVCvSsEDdxtB8t9V55mAr9dhPZASO5U0eW6wd1cnrzwlFB/k0a8yEJcAm0+9WzvprIFh1NNBSd1A2rJy3Av9Hwn8AJKIH0Ky9elsJv4QXOOgSrpR+wEZdzjieaJ9dbMAA2zBqLNkge6SdV2pYwb9DHvN3mhEb+DGU81rBvOU/4SfSFEEWRnRHXb9NpLuQlwcwyv+YEtp5g5sio2Ftg/7dQBZzChMYAMaeqMt4CxfRbvCLdcafAeIukiMC56orCSn/p0OAkwoLXJVDhX6gkAZAJz4lpbMAXQQaWHGSr8vhnIXJx9rLvE2pyZ65cw8wQRPmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8)
 by MW4PR12MB6729.namprd12.prod.outlook.com (2603:10b6:303:1ed::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 18 Jun
 2025 21:04:08 +0000
Received: from IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650]) by IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650%6]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 21:04:08 +0000
Date: Wed, 18 Jun 2025 16:04:05 -0500
From: Daniel Dadap <ddadap@nvidia.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Williamson <alex.williamson@redhat.com>,
 David Airlie <airlied@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
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
Message-ID: <aFMpxWiADVXBwVgO@ddadap-lakeline.nvidia.com>
References: <20250617175910.1640546-1-superm1@kernel.org>
 <20250617175910.1640546-7-superm1@kernel.org>
 <20250617132228.434adebf.alex.williamson@redhat.com>
 <08257531-c8e4-47b1-a5d1-1e67378ff129@kernel.org>
 <4b4224b8-aa91-4f21-8425-2adf9a2b3d38@suse.de>
 <aFLJTSIPVE0EnNvh@phenom.ffwll.local>
 <8ee5d492-4777-4dc7-a001-0bdbb3bff2a4@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ee5d492-4777-4dc7-a001-0bdbb3bff2a4@kernel.org>
X-ClientProxiedBy: SN4PR0501CA0072.namprd05.prod.outlook.com
 (2603:10b6:803:41::49) To IA0PR12MB8422.namprd12.prod.outlook.com
 (2603:10b6:208:3de::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8422:EE_|MW4PR12MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5a7b4b-f447-4b7b-292a-08ddaeabaa99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?7yWb5QjKqD9yytreAUPg8yG1d9fs9jVL5/TTtyrSRc+euShVrVvazc411x?=
 =?iso-8859-1?Q?oOgkCjrY4Ag7V+bjkSac23uXv35Qpf1efXaOcRf5srCXBiO0ASnGx5CaLM?=
 =?iso-8859-1?Q?P7XB8R/BiXeYOqRPNdkqriUG5x2+NZ3XlkWn7KZ4SQBTHTarAUWK6XyL9g?=
 =?iso-8859-1?Q?Z6u5ICYUbvHeNKkYJHNY+OGyYPooeWWzD0XU6L1V8nigb7+CbiWCu8AmtV?=
 =?iso-8859-1?Q?knxDb7f7rBfR67S0lMHo0mnSUONPXlqXgkzEecgHWRnGUVZ/EfyeYJpYKX?=
 =?iso-8859-1?Q?bS0vBMHyIp+gAF7wEcfapkc7Pg+u3X8zsC3Hk1U40N180zNNqQzzHo48j5?=
 =?iso-8859-1?Q?TjnCe1WGWvVPTKkjM+jktu7VKDZA3C8UHnGZFiG4tEBZkMnue5SKYmoT+l?=
 =?iso-8859-1?Q?ODmpv1gVcCbuQ5N2WNL9gNoWtXTo3Iiwq1GS0SvJ/IWvp/Fz+WAFyglNfV?=
 =?iso-8859-1?Q?tO0JTmsjaaDffbvWGIH3NG4B6LAIHPp8EusW1xzmyLrfFQDPqcgmrVyq2q?=
 =?iso-8859-1?Q?dmuomqOUtyVw8zfFN46sBebPzpU5CXToL4fren3mON+7eISWQsE6eVZjJZ?=
 =?iso-8859-1?Q?2NGVazKCK7M6vgwDwxSapRuSyJOpb6ddva0ncu+I6I7TK9etwtUxeF9iWl?=
 =?iso-8859-1?Q?Skq2n/J6zQU/NrtpQFWu+tXOm7dsQfeFOz20Pku+AZvmu6h4CpRLkptgnU?=
 =?iso-8859-1?Q?q5Reqmp0wHxOyKWJU4z9pHELqbmcpwqHwGui1tgaJl1yD3Ge0n01wLMEDY?=
 =?iso-8859-1?Q?iYuAVFORb5dKlmGnJRJ8ORB7DvB+tsGicuQoH/+LS4tKWVxzUM9W8YafE/?=
 =?iso-8859-1?Q?xqxcoEQH9gM/hwKbnw5wiQnYx7fT//fhXws7VhOugVNahHQrDdOnPtGaZU?=
 =?iso-8859-1?Q?x1/iUsfJMo2Ug2d46gu3APfKrXGkx+tmsb8of9q0ZobcwvdYST/j9LaCJd?=
 =?iso-8859-1?Q?fUBpdHAQh5nWlr6uiothlStH91lK1cCRGiQ+f9mGaqvY0BNZRkmrdAQ48+?=
 =?iso-8859-1?Q?qFAC+8rM07Ec+sQAjupAFtwgzetsACTs5TBiF+MOY8x9O5XrG2M2mc0bdZ?=
 =?iso-8859-1?Q?nN+c1lHS/ee7PWH3b4l8A6b/gIFPsYxNWVaLyLGMU37X262iz9YfG6c68l?=
 =?iso-8859-1?Q?ZwM6Xmc7BK3TsltjW2XhOrSOojU4LrfGGB17qhl7kRvM/1GPicyHHfwxn+?=
 =?iso-8859-1?Q?In3s1qbm4vWj/5edzjevF9fMAEVcA1wPJBSKcGDkWEKDHI42jXP1/HCoU7?=
 =?iso-8859-1?Q?U9N0AgU0xmu4Mx77UPC2p2QPvS91xCvczrkrmjN9fgMnaMxo1cj0JzjcsD?=
 =?iso-8859-1?Q?I7C0jH+ezfOav6gFnv+2cZRDzQVum8OCeqsDl0sDZZziCFX8qbKTjtvurC?=
 =?iso-8859-1?Q?YTzqL0jn0G3f2fFpQFer3sZDj5E00c2cJIBlUR3+pEdJtS39RP1FiOycYx?=
 =?iso-8859-1?Q?2udDVn6T2N3GNdcZooc+xcruGnWvXocE4qWaisGS4XjtSSSBuXPM45eMxx?=
 =?iso-8859-1?Q?8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR12MB8422.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?X0OzOlj4Tbt9ji1v+KDJcwBFA6MgiVlV8tRKeZPDSJ+I0Uvj6CMZnhdNV1?=
 =?iso-8859-1?Q?zhjzSkPzGwXhqLlwfQCnjgYahOZspNbPB+qdpKTWEHv+2wBMeTPM9cHsuY?=
 =?iso-8859-1?Q?cyJ5vzISshRWmGNWWrWPQynPgKhSy8vzIdTA+9b/vxwhAA5zthvOAWhpMR?=
 =?iso-8859-1?Q?o9OOCOtCXUxgG2thr4bIgbPezW2VbNvr5fsedUIcknjkFCSIo2qH/me01b?=
 =?iso-8859-1?Q?SrgIaMEeti6dyPhyJyhMQ/7djtoQ2EWtxRKyTFVDCn5hJ0S+2S1LLeWlFZ?=
 =?iso-8859-1?Q?Hwu3ZMrGPCMX8B0CrX77MblJ99xotLVRksdNW2K28AUKYJRYRrri+G612X?=
 =?iso-8859-1?Q?8kTBy/L6DN2HjhJ7UZPBYsfkB7FdV1q3aznAqZivbH0swXhdcEnwGIKZ5R?=
 =?iso-8859-1?Q?Atd8AJeA5358qqlrDzYx1pFikm7Xb8uOpwpGIp7HitsGBRxMSds8CopdrJ?=
 =?iso-8859-1?Q?Ihxwx9ZrecJLcG0JFUCGP0DAMtqFr3dxEzRH3oCDgEgWoJqKCshMQOUPU9?=
 =?iso-8859-1?Q?wM5ROBf/N5uSfU0VfC8yyJYiT3Pji23POGfPgAJio6VW8KGzDBxVemfXbX?=
 =?iso-8859-1?Q?73aDR9Uy790jZs/YeMag05/dcuUQ9C6MKi9bbHdSM+gbJTSAPdtZb76H2u?=
 =?iso-8859-1?Q?hi+wGmw+iKXmk0K3IJx1taUAPj0SjM9wDu0KXevxLEJ3pMCKDIoyMPhYwE?=
 =?iso-8859-1?Q?JkBOBhJHS+ZYn+KjdfCQH6DRZ6bD3Ob7aPjfxEvrqr61NgCsJy7YPJxLNG?=
 =?iso-8859-1?Q?ByDy6OI8OKZalbKSew0D5B4J1bYzTAn2BGtokR5WPogVPoDGpes+0m7oh8?=
 =?iso-8859-1?Q?YsQT/hhPLFvYarqM0HxBgADkMe+rDkOp9TEG7+eT213bEjAgVWdxckxpYo?=
 =?iso-8859-1?Q?Xv9JHLIeJkm2YdlMq6f4XCpFAA0JHlVGf+KnXxQdemCwQuq6Ar/whIYGGn?=
 =?iso-8859-1?Q?jfnGErpY/zjh1gC4ExMTRi78q8N3JkKbKlwO1XtCqRXNRSubnFfbn1HMKS?=
 =?iso-8859-1?Q?7lhNvBD8MTrdjMuqTza2IZKSBq8+hRWc8rz1nU2Mgcy4YU6EYVhIrUUth4?=
 =?iso-8859-1?Q?ABr+WNIoFS2ZW/aGCgzmuoQw7Ntm9Ueb3lgZbLBpkO83EXWP4BoS74mfpz?=
 =?iso-8859-1?Q?JJmLioiiBMhUiNNe7jhnxqYxHgmdq7LSIZFpYsbgJ7A+KLC2tfL5Aug7G5?=
 =?iso-8859-1?Q?hgjm0eaBoGDbA8f4kdQJaOn1CRBWBS9MsbzpFdndVMeYof6D2biovqPLNn?=
 =?iso-8859-1?Q?ZuFt3J1xMUi1jzyt9aSjbQEqY6jIGtURdzIvVFD51MtEzKx6knC3GNHyjg?=
 =?iso-8859-1?Q?1+d6cVmNsIT8l9KWO6lIhwY3Y14ffUl1+ld8siPuApZkopnU1nMOA4g5Lo?=
 =?iso-8859-1?Q?BJNBkQ/cNvy7fPydmKa6UvnzEKmAK2U5A70AIMNATm7u1S6LY/+N1ItY+w?=
 =?iso-8859-1?Q?WZvX6BwMGet/HhWrf3MSnLusgUSdw2NNyXLdt3X6scla53RhBjDNlpWbQR?=
 =?iso-8859-1?Q?KgR2Sroa1iEsRC1LXgtr2OfYd2XdIzUOzc1p6itExru5iechCXfwtmLQ1R?=
 =?iso-8859-1?Q?WOswAuIakOwY9jKw6aiJDXGrfpFbzLXtFsk1X8+puxyMHZmGGMbUfPtK0b?=
 =?iso-8859-1?Q?TQAZah18r/3+6UsqItuVyKM3Ye+7eFtJyB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5a7b4b-f447-4b7b-292a-08ddaeabaa99
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8422.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 21:04:08.3395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MCwtPv/jKeDnpfn8ES7YdiqhkmYvkmwjzUAnbj/jDBje+ZhWIntY5Gh0RrkZzoXh8ls1MeBBD/WOoPPV67nebg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6729
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

On Wed, Jun 18, 2025 at 01:45:40PM -0500, Mario Limonciello wrote:
> On 6/18/2025 9:12 AM, Simona Vetter wrote:
> > On Wed, Jun 18, 2025 at 11:11:26AM +0200, Thomas Zimmermann wrote:
> > > Hi
> > > 
> > > Am 17.06.25 um 22:22 schrieb Mario Limonciello:
> > > > 
> > > > 
> > > > On 6/17/25 2:22 PM, Alex Williamson wrote:
> > > > > On Tue, 17 Jun 2025 12:59:10 -0500
> > > > > Mario Limonciello <superm1@kernel.org> wrote:
> > > > > 
> > > > > > From: Mario Limonciello <mario.limonciello@amd.com>
> > > > > > 
> > > > > > On a mobile system with an AMD integrated GPU + NVIDIA discrete GPU the
> > > > > > AMD GPU is not being selected by some desktop environments for any
> > > > > > rendering tasks. This is because neither GPU is being treated as
> > > > > > "boot_vga" but that is what some environments use to select a GPU [1].
> > > > > > 
> > > > > > The VGA arbiter driver only looks at devices that report as PCI display
> > > > > > VGA class devices. Neither GPU on the system is a PCI display VGA class
> > > > > > device:
> > > > > > 
> > > > > > c5:00.0 3D controller: NVIDIA Corporation Device 2db9 (rev a1)
> > > > > > c6:00.0 Display controller: Advanced Micro Devices, Inc.
> > > > > > [AMD/ATI] Device 150e (rev d1)
> > > > > > 
> > > > > > If the GPUs were looked at the vga_is_firmware_default()
> > > > > > function actually
> > > > > > does do a good job at recognizing the case from the device used for the
> > > > > > firmware framebuffer.
> > > > > > 
> > > > > > Modify the VGA arbiter code and matching sysfs file entries to
> > > > > > examine all
> > > > > > PCI display class devices. The existing logic stays the same.
> > > > > > 
> > > > > > This will cause all GPUs to gain a `boot_vga` file, but the
> > > > > > correct device
> > > > > > (AMD GPU in this case) will now show `1` and the incorrect
> > > > > > device shows `0`.
> > > > > > Userspace then picks the right device as well.
> > > > > > 
> > > > > > Link: https://github.com/robherring/libpciaccess/commit/b2838fb61c3542f107014b285cbda097acae1e12
> > > > > > [1]
> > > > > > Suggested-by: Daniel Dadap <ddadap@nvidia.com>
> > > > > > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > > > > > ---
> > > > > >    drivers/pci/pci-sysfs.c | 2 +-
> > > > > >    drivers/pci/vgaarb.c    | 8 ++++----
> > > > > >    2 files changed, 5 insertions(+), 5 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> > > > > > index 268c69daa4d57..c314ee1b3f9ac 100644
> > > > > > --- a/drivers/pci/pci-sysfs.c
> > > > > > +++ b/drivers/pci/pci-sysfs.c
> > > > > > @@ -1707,7 +1707,7 @@ static umode_t
> > > > > > pci_dev_attrs_are_visible(struct kobject *kobj,
> > > > > >        struct device *dev = kobj_to_dev(kobj);
> > > > > >        struct pci_dev *pdev = to_pci_dev(dev);
> > > > > >    -    if (a == &dev_attr_boot_vga.attr && pci_is_vga(pdev))
> > > > > > +    if (a == &dev_attr_boot_vga.attr && pci_is_display(pdev))
> > > > > >            return a->mode;
> > > > > >          return 0;
> > > > > > diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> > > > > > index 78748e8d2dbae..63216e5787d73 100644
> > > > > > --- a/drivers/pci/vgaarb.c
> > > > > > +++ b/drivers/pci/vgaarb.c
> > > > > > @@ -1499,8 +1499,8 @@ static int pci_notify(struct
> > > > > > notifier_block *nb, unsigned long action,
> > > > > >          vgaarb_dbg(dev, "%s\n", __func__);
> > > > > >    -    /* Only deal with VGA class devices */
> > > > > > -    if (!pci_is_vga(pdev))
> > > > > > +    /* Only deal with PCI display class devices */
> > > > > > +    if (!pci_is_display(pdev))
> > > > > >            return 0;
> > > > > >          /*
> > > > > > @@ -1546,12 +1546,12 @@ static int __init vga_arb_device_init(void)
> > > > > >          bus_register_notifier(&pci_bus_type, &pci_notifier);
> > > > > >    -    /* Add all VGA class PCI devices by default */
> > > > > > +    /* Add all PCI display class devices by default */
> > > > > >        pdev = NULL;
> > > > > >        while ((pdev =
> > > > > >            pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
> > > > > >                       PCI_ANY_ID, pdev)) != NULL) {
> > > > > > -        if (pci_is_vga(pdev))
> > > > > > +        if (pci_is_display(pdev))
> > > > > >                vga_arbiter_add_pci_device(pdev);
> > > > > >        }
> > > > > 
> > > > > At the very least a non-VGA device should not mark that it decodes
> > > > > legacy resources, marking the boot VGA device is only a part of what
> > > > > the VGA arbiter does.  It seems none of the actual VGA arbitration
> > > > > interfaces have been considered here though.
> > > > > 
> > > > > I still think this is a bad idea and I'm not sure Thomas didn't
> > > > > withdraw his ack in the previous round[1].  Thanks,
> > > > 
> > > > Ah; I didn't realize that was intended to be a withdrawl.
> > > > If there's another version of this I'll remove it.
> > > 
> > > Then let me formally withdraw the A-b.
> > > 
> > > I think this updated patch doesn't address the concerns raised in the
> > > previous reviews. AFAIU vgaarb is really only about VGA devices.
> > 
> > I missed the earlier version, but wanted to chime in that I concur. vgaarb
> > is about vga decoding, and modern gpu drivers are trying pretty hard to
> > disable that since it can cause pain. If we mix in the meaning of "default
> > display device" into this, we have a mess.
> > 
> > I guess what does make sense is if the kernel exposes its notion of
> > "default display device", since we do have that in some sense with
> > simpledrm. At least on systems where simpledrm is a thing, but I think you
> > need some really old machines for that to not be the case.
> > 
> > Cheers, Sima
> 
> Thanks guys.  Let's discard patch 6.  Here's a spin of an approach for
> userspace that does something similar to what the compositors are doing.
> We can iterate on that.
> 
> https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/merge_requests/38
> 
> I think patches 1-5 still are valuable though.  So please add reviews to
> those and we can take those without patch 6 if there is agreement.

Sima already gave her Reviewed-by: for patches 1-5 in the thread for 5. I
don't expect my Reviewed-by: is worth much for any of those files, but if
you want it, you have mine as well. (In patch 4, the iommu/vt-d one, it is
a little weird that it's no longer symmetrical with the other class test
macros right next to it, but I still think I prefer using the helper.)
