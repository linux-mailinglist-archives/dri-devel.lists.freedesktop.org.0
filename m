Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBJTGxGOpGlYkQUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 20:05:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC6D1D12EB
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 20:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF6310E3F6;
	Sun,  1 Mar 2026 19:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PpAKcDjE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012060.outbound.protection.outlook.com [52.101.53.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5AE10E3F2;
 Sun,  1 Mar 2026 19:05:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YS04b4MeXOktTFXdM44FNGU1S06Z4Hfe5eWTu1m3Q9T1Y+CPouoESq+0O8v9RGFUGER02vIAvNZRiKVdd5/iqoJ0zD52e83um4126ZYmJRV1nX0i+b9uR5sUckonD7HIRZm+RL3aZTa3KFH9wjh8Kky2G5+9vNOIIK2NDgWebK0h3fyysUaAsLZqFd5pefzhrIKlMcFTJbGYHd9vGDDEMue5vBR2CZIg9PTREZlwFYTu72RYhwNoyoGgiHJq7EwgPdbByX3gS1Y+ykkmtiQKvQcZFtbMF2C4KQOCrttg0v4nHjz54rLPCghOEF0NtGR/rAj6inuO95MQW5id5+krcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTcGJxcpXK81aXJPeYcwvBcR6Va4VSyOpbXP/adPWRE=;
 b=LGwIbVFYjsX5NROJUPNBux+dtsy4Lt3abfkCWBdJBL7iok0N2yLD9mTP/mSoX+qgAVpUQVeWjX33XhHD2MYtFC7PYvOPWheCHthCaZQ2BHkRfNm+H4BRF8+UCvwe6ZxCVsFLWIvQcjGAIv2Vh4mfnNyco8H0t9qwAuJVy5n7M0kn8yl9/V3ZJ+xUGqlgAp8j9ItPQ5l5IaBg2aa/CU0JWH0YE99Obdxp7qBza5M55mzSTBB945k32TgQsOcKaaxqFABbbVcmcCjan+wWl04mN1kJ4m3N93SRIxD8w0tr0QynHCqQFXrROeo03rcnVhKUOeNqJZx8Z98AkUCwFqxcYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTcGJxcpXK81aXJPeYcwvBcR6Va4VSyOpbXP/adPWRE=;
 b=PpAKcDjE7ra4froggO9Pb224HdajFA5E7wWUmNQIud4/mu2JZLjv/KlBxoK0RSZU79YHS80zBzwvZEbzgqpAv4qjCH0IjTYha8tZ+qe99VbqmAksrF2BU2kCNHAXoGVNB6Zq9aX6ptVBSNBgBy7ERbonYCXP+EOtAItUtGdgq3uhjzgSpwh4189kxNSBNFdSiLn/+ff2i6E/Cv06mAn1OEMg96zRA/6t9MfTjcWyuadSCmCOCLAWRwkXyGkqpim44BwjU52JZ/Gpt3aUFa4ZzEKNE/SCauKElLNhEjqt3YeKKAknnKP8M45ZRE7OG/IAR2acDzF1rRUGUiyTiL90EA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by BL1PR12MB5993.namprd12.prod.outlook.com (2603:10b6:208:399::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Sun, 1 Mar
 2026 19:05:44 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9654.014; Sun, 1 Mar 2026
 19:05:44 +0000
Date: Sun, 1 Mar 2026 15:05:43 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian Koenig <christian.koenig@amd.com>,
 Dongwon Kim <dongwon.kim@intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 iommu@lists.linux.dev, Kevin Tian <kevin.tian@intel.com>,
 Leon Romanovsky <leonro@nvidia.com>, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH RFC 00/26] Add DMA-buf mapping types and convert
 vfio/iommufd to use them
Message-ID: <20260301190543.GA768004@nvidia.com>
References: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
X-ClientProxiedBy: MN0PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:208:52f::10) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|BL1PR12MB5993:EE_
X-MS-Office365-Filtering-Correlation-Id: a200f667-22f5-4af1-7048-08de77c589ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: FCOjuAQgDqtC51UatFUH/Kd5iO6r3coOY01AW+YuoMzlpPvh4W2W+1eExfjtoRMN9YUr5rL13M5X84ZLC7FrwSpEDDsz7nbVicjQ2KdbRATUt3PA+PwwMRjL/ZFd2xB1ZflsWYGb/9OClMhrvWDEg/kL6+K8eNOx6rV1V7sL/yfJmegMo52h6RQisCtkNZfxMUxZkyQpGmr1jvrQlLSkZn8pxrirBDo32t28Q8Bj5yJO8XUwOD7aoJ6u0hkwL/32KPwr8NYvevVvv1Z9lm412nKpEqCnFCOM+Jg5Pq+fehAoLWtRA6hHHVq+xhm7qNjXN5zWI8o5i5iNA5BUu7Z9roZFg8NOiYZD+9OwRG8F3zKWGXOScjAOyffnY53SntTOAPoLoL7J9VdWgDUDzEkj0rLeyVzSgYAWI7BiUwEO7FGbeLogSh/zvglNEcq9v1W4cRTl8sM/rV65f2HU6C4SJ4UtmGVvXz1087HEHcws5WY87dyfRfgdGX9Hh1iU0sdf8g6GSgROpWZsmhV6jamPgpCnQD0R5eQD82z4oQad4zDWbO/IBdsBw184xWcV4emDv4d6lLCVFnYQftkljGqI2jO5AQ1RJAAma7PW5u4NYSrr/cncLRN6rONcen59k36bWui7fjId23DXEwtR3BTWY0OtsN1s6AtaezmzvbzKsVPUcoZiBldtEhzzfPj5no2/NQTaTsLaZ/NAjA/jvjo6pe44LUIBUg+Dba27hSP5gCD/gYDzniuaRoEvx9rFZ0lx9w1s7C65oRbTai4f3Wpu+/L46kWWPNPdHlcFWHMpdrQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BIvUSlKeOs6dElWw5NTwf2/gSW5emGw11fTAV2FhtHDkXSHwN8fRWlEogJH0?=
 =?us-ascii?Q?c85WvuNglyDlawsVLRAxQhVmAcplE2MF9Ma7RwaZMBVFNdZisd3Fj/doKDrC?=
 =?us-ascii?Q?H6YjY2IK7jTYf2e7qsv/nHU5kZSGl3EaDNLc5wyeV6z0RcFKAaFA++5ssT0N?=
 =?us-ascii?Q?WDzIZnZDgIJSaz39Z3x0aU5fFdyswIVM6qOKMh4Eeczz5VozrrBLtv7q2z3T?=
 =?us-ascii?Q?xdOJ870SAlOgACzugQ+u2vbaFjju/BLOJnVI3DBDR5yQJtLUbtdCqtiQU8iu?=
 =?us-ascii?Q?7FF2ApvkRWsMuUPM9OoJRnlQRhGLxbonvsxEi6Q8LQ8d2FGLzysyEbgNtFWj?=
 =?us-ascii?Q?7pxsm1Gq4pIetyBgJH0cs/BUwOL0Y5AeTc5dy4tv0VWBxE0w/scLT9sCLPEn?=
 =?us-ascii?Q?J3UG+ODa+bapl2Km7FFAnXi5gaSndIeT1xr1TcnQil/tG/jT95Zgfd93j26m?=
 =?us-ascii?Q?iksZPq6VZOgl6UeUpm8brh3jOS5csB7rJeHEyUo/nvQJfk2T8Jx+pI5J0jaq?=
 =?us-ascii?Q?7Wmh8LDqCTEMpcrpawFvRnNaRL0JAetoo1dIhC8B3Mb8ND2bH0MJIVaMsHta?=
 =?us-ascii?Q?5YTyIs0Bu/LmtmKY82njDson4TnKc7+2hmLXQSyOl5cCpqtom1Rn/JJG83ri?=
 =?us-ascii?Q?Rxw4gVvfyeu3VAQyjB5Utddmp2P1xmITmKx5f0BDxe5WygcvbajB56Gebh7e?=
 =?us-ascii?Q?revfOuRE0lJa6gwzl7O0ZeUHAJ8iaz3Id48f9vAM+Wf8NIrXWFqAb0mg+ZSw?=
 =?us-ascii?Q?YdTfQtnbFxlx/kKSgDe6tnfq4GZgee5oE30E67GXuvPLeq67ber9VIc/kcze?=
 =?us-ascii?Q?FH8+0A7iRLuvBmsYkV81B0K9dND9FPHMKtOmcY0QCp5KFuA3m3wfhckPB55+?=
 =?us-ascii?Q?ZctuW2nSqF0S8Ch3pHVV6RA6r42WzaC41AyrnCmhiy02E+g74JPj1ldSEqdD?=
 =?us-ascii?Q?q2QZiBq1YLDWTuhOrbZTIs0ZP+2cmg7gKiMAF+b8Gfme0/gFYLF9Zgkzmnto?=
 =?us-ascii?Q?A7VlAAOFAPfVk/YD09FmJoldSOR/RF0vvMfCXNO2bJSH6PH45ObzE49q1dI7?=
 =?us-ascii?Q?BHKEmBq07AR9lwcKwewFAgizxfbbrqpYdfuY+x3USRQb9EF868czw0WePkdi?=
 =?us-ascii?Q?4ZHC4PIF5HFTkvrL7ALuvRnKYAQ49A08DgVxNFrF4/t1/JDPAyCbLXgnUqCr?=
 =?us-ascii?Q?b2c0Qv3UtItZ0JqJyVFhdE97NPLk3Ey5rT19orPP9DFZE+6eL6qenSNsrEY2?=
 =?us-ascii?Q?rdmUa296Co1EDliHIqequPNyyq6x+UHuUm9vDtfxVieXfJC3A0cumFpYc8ZZ?=
 =?us-ascii?Q?ss2cQzp0dZKCsU8LeevQnkrGOxz+1MPZGnA+Z1Rxo4dWHlCoNzz8yRa95wO5?=
 =?us-ascii?Q?5v6s4vsA1g/VSEccYWJMGNNvDR4AEEGKRk45OnSIZU9tMYuixH6ydqs73Y5P?=
 =?us-ascii?Q?yPyDpFC3HF/Y/SaHz3czV+z+94d/FR+RdasjUQesEzHKyBr7qQd/akxolYbw?=
 =?us-ascii?Q?ayDWfBt57+vpZCyd0XYj/DrA4AoE2o0XyRQEKI6g6vaWV0opqWOSPQoIuiGi?=
 =?us-ascii?Q?AazP0KHCrC//KgRUfKS7YRhCF3AJb3yGSOIy+jdMmQgVsDeWI6sxkpvFbDp5?=
 =?us-ascii?Q?N0CyS/qeev5LBDnw5aLR3b6ehnDVuFFNGqYggFWP4vJCrov8SJ7o2C3mA3w7?=
 =?us-ascii?Q?hR7deJuLaBziMQFNrJ3IlQh+fk+dPunqESJvC8/K/b7ewT//JdX6Fo+cgA49?=
 =?us-ascii?Q?MdI4MZ/6BA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a200f667-22f5-4af1-7048-08de77c589ed
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 19:05:44.1626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gqPLu4L5eKhKrMvWOTnwRSVdeKEUmkWNTJdBqjgTJuUGv80zGODIsdlI6Bo35UzZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5993
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: BCC6D1D12EB
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 08:11:31PM -0400, Jason Gunthorpe wrote:
> Jason Gunthorpe (26):
>   dma-buf: Introduce DMA-buf mapping types
>   dma-buf: Add the SGT DMA mapping type
>   dma-buf: Add dma_buf_mapping_attach()
>   dma-buf: Route SGT related actions through attach->map_type
>   dma-buf: Allow single exporter drivers to avoid the match_mapping
>     function

I've rebased my github branch:

  https://github.com/jgunthorpe/linux/commits/dmabuf_map_type

On to drm-misc-next comit 41dae5ac5e15 ("drm/nouveau: Test for imported
buffers with drm_gem_is_imported()") and reworked some of the pending
bits on the VFIO side to accommodate Leon's series.

Christian/Thomas/Vivek, how are you feeling about this approach? I'd
like to focus on the above patches, should I post a non-RFC series?

Thanks,
Jason
