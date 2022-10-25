Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BD760CF1A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 16:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E5810E0DA;
	Tue, 25 Oct 2022 14:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2041.outbound.protection.outlook.com [40.107.212.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E019410E0DA
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 14:34:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+09TtIL9mXESWFAuADcSJg7kw7o8TTMD96OVeVSIOwD81ufLde8ybCDNi5AfIE87iN6r6/fAAGauLIENtq9+JnyG+PnXPRoHfMPPt8LU/bT7V8FX/NzEnOWADCH/WArZWj7t5oVTQD3gywfLiSe/KmLvEkOZROq2Vs5ddDrdpXTz94OwjXR1PcTHdWcn0oqir8o++XtInTdmECmJYYStJIvq6a6ofexlbBOSZ38z5uzXiMCK22+GkiYARFZ6i/m+EaHw12XFG+sxmWY3qbhVm2RnU1yINYVkmUs3Iey7hsnFvIF2XD/Betnp1CT4pzWj66yVslFZEVFlBOJngCZ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/9W5NPhOYWCT/H0hftinCyaG21iCdenJ+ImiAxOS9w=;
 b=F6Th/qBA0j7tSGTdeI6Exm/Z9pmtdes5BusBM9cJKxdcBIQaXs8VT3ACpZDOHKr7H+fgswgJpafJTOuDRUvEFrU4Mrm93hJkcQlIiax1LkjuO4g2nuolTMpkgVlu9GTeuqhjRsc9PtE/QbOerbQbrwhbqFCWl1ue9y2juXnF2RTMm+HcC8mZkJjTQ/z9rA3dZfFCvueay8gNeDueeIa7E8MjQeG0XBdnzy8clBFVzkpceAtvlXHBhMcWCcf57LlOssIuXx1+KXG5ZQI12P/BbZsFVY2fDCl4x42Uff+jg5ze2BPhKPArHAK4Hd0BFLfGQmDokNO3ed9AfhgieJCoDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/9W5NPhOYWCT/H0hftinCyaG21iCdenJ+ImiAxOS9w=;
 b=iVWT28uxFaF9iCdMlo4E6jGheBaALNjodknYSW8zh751WkcLD5MbsSG6eR0glVRqgDKd++eAr1xBomBxygGlkLTu46Plamm+n9LqEwWRJ8CSNVVF8FSUfJYJz4Nz6kaaNx0ivAf1e86MI6PhrHywlTUgo74mN5CjJnXqi5MGW9YapmktWsXTOkDlfMMyZmu65hkbsAxSGjaKIQ6ezbGL5owxTDRjnpdUErMfhurDiIRHX+EmDl8zoTRkFxot2tA02GN3ol6p/dolVddV82Bb/qUVScWAXMbiu0HI7Nk7Sp4IQwxMSI1F3XDvgDVIRKDL3gVzvKk3zp8xoqPF7+bnuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5361.namprd12.prod.outlook.com (2603:10b6:208:31f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 14:34:29 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5746.021; Tue, 25 Oct 2022
 14:34:29 +0000
Date: Tue, 25 Oct 2022 11:34:27 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [RFC PATCH 0/3] new subsystem for compute accelerator devices
Message-ID: <Y1fz89kib4zVuqn5@nvidia.com>
References: <20221022214622.18042-1-ogabbay@kernel.org>
 <af4c71cb-be60-e354-ca4f-23e834aca6e1@suse.de>
 <CAFCwf12HDZvsr1TrRFQH9Vi26S-Xf9ULgxtBazme90Sj5AzhQQ@mail.gmail.com>
 <c22bd93e-8bd2-6865-711a-37aeadbca7f9@nvidia.com>
 <CAPM=9tyEqzQ09WcRtE1Zd3XjOaR9a2ms-vL-O5x2ong7iPF=4w@mail.gmail.com>
 <Y1fFRIxRq+enLWyd@nvidia.com>
 <CADnq5_PH3xR_nnN2wQ2NjydUoT+X0z_9OvHtaabwcPbwP-o+9A@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADnq5_PH3xR_nnN2wQ2NjydUoT+X0z_9OvHtaabwcPbwP-o+9A@mail.gmail.com>
X-ClientProxiedBy: MN2PR05CA0066.namprd05.prod.outlook.com
 (2603:10b6:208:236::35) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5361:EE_
X-MS-Office365-Filtering-Correlation-Id: b635a5fe-b5b3-4f96-31a3-08dab69605f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7QjJ0syQnDUaTO0z1yHHNO+PJXkWfH9i0WDySWyo78r8q/KAiYUWrH1blBySNIXBl/b11TM7qfk4SfG+GaHLFUD9CgwzyWHUba6fWhL7Tu+P8Vv1UDYAvz3ubc0ckVUj88f9TSu1fNDE4bMi1kleD5nsQtMWcjbBjltxmhWBY13QsU39TrJHTpzfyE4FbLSUEYHLi9YRh2wI+DJXqCK52GDYxZHqUkztFU7gU89EKPvg8M7hc+ce79In6DChPLyRGxW7P5Dat41eNRBm///9opyWDxXN0NE6E2yLaCXq0F2OjMJo8o/qJyCevNfgie/F9Um0lpnwD0Z6+C0LHViUWNJ99iFDpR3cYehyBVlQG5MsnP7NIRl0aM7Yf36ui6UUwjbDTP88ANENFN0ajk7loZkMzv/+12wdtdB+Vpyb/OX/FwRGRUp1ft/VB11CYvLsrir28ziMX9cqabFOHkkeUnGmdUJLooH0gn8YyLSDG1pdQZcOdeMnL8XvzhtnTTEoRVQH669fODWVpxji6eWaxTPiMVv8Nu3Ztp52/zaeR6yJk49jd/FzcI4aBrl4CG7M0UbpToNo6nVPsmgmNlVQqV628cUTZ4p6YalDE1MjC2oyaM3N1Z5lpf8e/XsgJvhlVZ7nADP/1en/FLOe4N95C8mkUteMnVCNfdyUMywrccIjZOBstkLop7cblPE8TjDTCiJrkuEuSq0D2MAt5EaIXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199015)(36756003)(54906003)(6916009)(6506007)(186003)(2906002)(41300700001)(38100700002)(4326008)(8676002)(66476007)(66946007)(26005)(86362001)(6512007)(316002)(66556008)(4744005)(2616005)(6486002)(478600001)(8936002)(5660300002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f9yYBjHP1wDsT1uF7j2OD+GcPktMFJ3oaas0yAj9lw601Qn6kpQ2YiwIvJnR?=
 =?us-ascii?Q?v4wodeyAy7l10sVIKDyP/rcHPaGhSweZ7dkmlFK/7gXWMl7YvMTd50XxIDEh?=
 =?us-ascii?Q?W2p5helwGvjP70lVWeI75rihim8sgyX7mrwOFdHQP+a0uj09kbYKy6B0M5SA?=
 =?us-ascii?Q?zU7OJ8WW4FmnYg58Zx0TZ1fCgWZ6WAY0o0hzkcnjPVtRvfz2wI9x9lFKFTYY?=
 =?us-ascii?Q?P9BBLvYcqy1wm3lNHii/3BUzRVwo+RZgPoyWFZhFA0L6+3yDwyIpjmle8AZ5?=
 =?us-ascii?Q?CNC6npxpuZo0x3pJddVier8EAbPKkijMwTvO6nTlVD78N8J3wDmxVMA+YK1u?=
 =?us-ascii?Q?/VEBGwf9I9R8+JHpKGn13NKBHSQPGiLQqG1QRNjSNRJhmFKIwX5xVcD2B5L/?=
 =?us-ascii?Q?0aChvUpjFwQKbq46iIwCLIhEEcJojS6stBSwukr/MRIiZk+7yb2+GB6Og/BS?=
 =?us-ascii?Q?nSrEcY0j7aWcoe+lNm5GAEUjVNXuRk5lENi4tz0HE4QrIT9XWN5y6etW5SKF?=
 =?us-ascii?Q?0Ir27xhqSUjuy4CaRaP6p8lNmqnoMiPakXtscDu6KE9uh+M/cHwSR4ACjqdV?=
 =?us-ascii?Q?eoDSWdUt8NVKh2MpR8LIx2mT5jbONDzLu8E+8gygOCRsnP3Gq4OfWHnIrd4t?=
 =?us-ascii?Q?0TFmoU3hQkBhjBJXEXpp9pOtlQRokqzevkTD63WZmfCnD0AHEpRxdGqS8muC?=
 =?us-ascii?Q?iUBYS+bwcYE1cx616SVAdZRTdbk6QiTz7ongjVWkW034Hjz27LDae/Zt0lrA?=
 =?us-ascii?Q?GSZPOrme9KCfUOzkNPNIY02yBmW4W3XaiVIfXEZK/Blnm5eHLcCHP0MyHYsR?=
 =?us-ascii?Q?NFiki8szGKcPiXKeF8osGJKDHkBdZOPRvvGVZ+cA/+UFK1XhJ8uwYPeY0+1h?=
 =?us-ascii?Q?uw6hYxHBHIY2swc+7lYAt+6f2pRcCA5ZmWsnx6EOFyUGTl+ZTXhInjr4qJrF?=
 =?us-ascii?Q?V6YetDs+pV+fA7sB9NVrWew6QyPCe1RuTMFN67/7cB1zzR7GVBabLuAPBZUY?=
 =?us-ascii?Q?2MPWky8vhZ2/itq1x5+NIqsAGqCS4jnxuuYMlWAo6rWS+f7OKU/YhCrTh6Vl?=
 =?us-ascii?Q?+DfYd4bDx5e6a+yzwhXv/fSvDzYBO902LVot/H6pFiYxuYe+gBkhN+ltpFQO?=
 =?us-ascii?Q?T41TNoqKmEk1/C1EameJ/7SjKEXU/fEmbhD04VnqTkuRplPReJA+uLt+ktlD?=
 =?us-ascii?Q?RTdVWMFseRAtVxV3u1Ms3DzA+gtoTCegXZF4nGgZPQ/eqYczTKRsDw0s9ox9?=
 =?us-ascii?Q?TSHmc4QUmeVhqzgUXBpUnRVy8eGMu6/4L/SzmdvvVbRWg/01c+3t55SdmBx9?=
 =?us-ascii?Q?i5yk6OwBsYGPjyxIQN6sSBD2mS/UPpKHlGYSySB/FnUPtFMLzs+Redr48Zdp?=
 =?us-ascii?Q?hQqPn6tj2MZWhoqa/kMCm1kwAONhBPZltDW2PY0dhj4Dt5mb3yho7UrKfYmY?=
 =?us-ascii?Q?PLphMrGdohagKi3f7YBnisMjAhA59lL/jAu+qmXZsktpJlHuBjA6a8r0MUWT?=
 =?us-ascii?Q?3El4w3wv60MOSZ9YGGCLjSGvVHFni75jruxXeWK9CzYS/dXm+hb1Dp2FDxH1?=
 =?us-ascii?Q?lC2AnEhSkf3zGdAL4XY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b635a5fe-b5b3-4f96-31a3-08dab69605f2
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 14:34:29.0422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ev9Wc+RqIgUikb3Q1hZ40fzsFGmnSAg07A5oHvl28xwShzfDgQ6WLwRPXYnahBdc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5361
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiho Chu <jiho.chu@samsung.com>, Oded Gabbay <ogabbay@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>, Kevin Hilman <khilman@baylibre.com>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 25, 2022 at 10:21:34AM -0400, Alex Deucher wrote:

> E.g., the kfd node provides platform level compute
> topology information; e.g., the NUMA details for connected GPUs and
> CPUs, non-GPU compute node information, cache level topologies, etc.

See, this is exactly what I'm talking about. What on earth does any of
this have to do with DRM?

We alread have places in the kernel that own and expose these kinds of
information, drivers need to use them. Not re-invent them.

Jason
