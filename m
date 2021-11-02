Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBBF4431D8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 16:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A6D72F96;
	Tue,  2 Nov 2021 15:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2048.outbound.protection.outlook.com [40.107.212.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F5C72F92;
 Tue,  2 Nov 2021 15:37:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jtcwte8/xKOMGTsxEOSD95vhBnHxlx+tJSymcWdrFdHBGFvCq6oN2DBhl2hoSgC7Rj6QBveKjdP6rES0mLBpYnNRpaIAILhqW4X+92gfjxyGyU1Oao2lOsPF70cibbX5d0OORdulpG94+GCNrtbCwR4IrBdp78rhEL/5ATR9LemvRUNGrgvizGKh3IvrPAxM/kC31D/QKolpb1/w+JxHWBZbQyfWgEEvkl6mqb9Z0Arwj5f9Y748A3RNOctoSlVgXG23m8yWu9YMhSFo8oDinWIxK+wgkRilgmM+5cYNVWRKG3gfGIf8PMXJeLarLAUF1TGr5okUzypykJumnigL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZbFXOOMWPAh0RCwPk1i1JauSuogdUSDXSXCbqszqAc=;
 b=SazjU+kpZ4UzY2nH7H4OgIXYGFleUEs+HQDWfxQz7WxlOUSWoWUMBNaSZleOZ6gXZ30za+zYoUlnFgqeisyAObdtrvzbMVOhVHT7BwbgJmMIkJsdN2hecqRibluSo9FFW6fY64ge0NVAVlp7h4CPOlfdiSITLMBmGVLtqU7V188Q3a4cZaChBoeu7LYJCMun3iAv8nwRfTVgACVc4Z1/wLoOz41IHozxI0boMS3SRuwR7pgn1TgZ5bZTCsk8Ui8c4p6qQxsA3YO3AydD7hib0PccpHex+/HS44qJnthLtMCB3hMsEHYOVWlzuFGYtqdGwh9IixIV1F/GZOD9pmgHIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZbFXOOMWPAh0RCwPk1i1JauSuogdUSDXSXCbqszqAc=;
 b=Qj13uQVOwoxhkL0NFGQ19/lBdKrXlO9Qhj5LYgmk7neVwzJgxQxmrzOlaco13/ipkPZE+G3ob1QdYid91cy4JbPw0QuEnJLzvmysUN0eAv7rSSdPUtSGlUzjyjq8XVD4Y5PSHCbNc8c0Dt6nwCKL/dhHX/1suWnnwP5ratImpFVk475UxS2/MB9obyVfXkYuzjP0R4ZtDbhNbZ/3j2CpAyoqKXifexl6GJwCnGC7J6Ng5oK0ZbwvgysqVqD3OowVnStPKl/wYqQoZiKbWXRGh0dorEoNWanM2rHqPry95rAgEYJJkdqHg+LtWbgLApNaY1eyVsx9oGmxW/KnDrqF7g==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5224.namprd12.prod.outlook.com (2603:10b6:208:319::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 15:37:09 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 15:37:09 +0000
Date: Tue, 2 Nov 2021 12:37:08 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/29] drm/i915/gvt: remove enum hypervisor_type
Message-ID: <20211102153708.GI2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-5-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-5-hch@lst.de>
X-ClientProxiedBy: MN2PR18CA0001.namprd18.prod.outlook.com
 (2603:10b6:208:23c::6) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR18CA0001.namprd18.prod.outlook.com (2603:10b6:208:23c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15 via Frontend Transport; Tue, 2 Nov 2021 15:37:09 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhvqW-0059oT-H9; Tue, 02 Nov 2021 12:37:08 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6f54be0-5f38-4f03-a73b-08d99e16a202
X-MS-TrafficTypeDiagnostic: BL1PR12MB5224:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5224E8C22030043C8E9EB12DC28B9@BL1PR12MB5224.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:260;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KQlBvJGFx+NeoUYtbOSjHV1kyUvrQGdhcgFaVko+PnG21M7X3J9FvsUbyveu/BaZmGqFc5Yx+/vl6DTYZaG4Hi3tcGgR/2Xr/vOJ9qCRdwlSdcYJtILIeIzxhbM1z79x8S/cFANN6MbhYE2yLIeDWA/RNFQlbNuOUvoNuF54dP22ttPmTdN2DcHwxLbPaAcqRrMl8hZvME7jj0RCgkaSdmBgeN1kdainxvGZnHFTVOSqpsjYnMAi1arvHKkSJA3wkAbRwFC5ellV6eV6rlZ5Gsx8xza+UtHDRhTn+Ez8uUiEN1bVIe7HL0stJ1tLeZsKIuMd91LlYNvm7iHYmVz/QdfwKjSBZqqASa8HCWdwYd+lJKNScpLS854oE+EmS9ar+dNEmjWNqB78a5UiEJSYq0Wtpun5+5J8CQEpzS86NWz852jiphua1jRCDsXEPRpxZkHZIvqKI9ZMTx+oJcZ8UC7qg4x16k9MjdaIBWwJRGgZC2VaRan8z66EvulewBuNDFtmDtWLFB+YtTsJMjeqyW0SSM556IO+vc5WSKLGRLORD8TsJFJjyYUoBuv5bYAW4a+yT3XRYJjWWkXcbCtNjuQIeVSfoM0sw7eqjl+eAd7qLqkhVCkouaJDWB/isZDatjwgEhjZ2fHALMk2gExPqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(1076003)(86362001)(5660300002)(38100700002)(426003)(7416002)(33656002)(4326008)(8936002)(186003)(2616005)(8676002)(9746002)(66556008)(9786002)(26005)(2906002)(66946007)(36756003)(508600001)(66476007)(316002)(4744005)(54906003)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q2puo1YWJ2Fq5cMsohsUHsz8iPoVR9BCRHd0+Vbk5PvbhtHhy1nV0tnHdYNf?=
 =?us-ascii?Q?j9mP0Nowvc+FQW2V+Qubvy2ZMcBviFQg6vrtobuRWbb8JD8mAJJtUExMl6Ok?=
 =?us-ascii?Q?1QlGa3CHIWVpMOueJikTpEFZvCveDxBX20yk1c1x8NjYaJJbgfTixyvhSqfR?=
 =?us-ascii?Q?SUhO7kIzudvuviToEZhr3tjPwhDEewpOjC0FjFZKxb8iK1hQx++QxUInRE8h?=
 =?us-ascii?Q?0fLxN5gon3e5qtHMCP2OMTQjjo26OkS2ccgfwIqIGAnFDbMRe+Bc9IV+TGWo?=
 =?us-ascii?Q?JzkmP+coKqmVhygrSFSXmhJB9ZbIA+alYEK4UptHNnJNkFRmIgzBIlTJNFTS?=
 =?us-ascii?Q?4HOiIO+MVi7olCIsAkldc4fLLRkSajin+F79EkISYGXFlnszvkx6vWqCYzYZ?=
 =?us-ascii?Q?c4lnMXx6ITmC5SknauY5vH1flOJLMVXE8RkR56777SA7AXayZmFEw9uYmrBO?=
 =?us-ascii?Q?rIblMgs9GuNEKi7cUDtwoG1NiKRrkrr56RjGLh6yzZzgj9cbTacTu0od/Ao5?=
 =?us-ascii?Q?k0pw9kxQlghIeonyjew7Oh7xwF/u+kfR9sE4Jk+EOYG2Rj0nK99SHJL6kG3L?=
 =?us-ascii?Q?bNEq1f/XSiO4i4apIyBhiOx9yG38E1R8Vu/lqQL6tZLGup7ndshTHwVFMILq?=
 =?us-ascii?Q?UG00qvpqo6Gh1Dqm+rx3/PbtakwbVSninrs/nukFbsjRmgIHunsELBneIP3M?=
 =?us-ascii?Q?ZunB8VvRnp7uAlrTj1eykhYgpQDgKV6KNLhua+9GIKLj2eH3fiCG3KMuUpVn?=
 =?us-ascii?Q?bUsR596Vy/lHzWvrtrnnottS9krDg6QdW5nH0BpUy8xd/Zllw5XGO7xJIw6N?=
 =?us-ascii?Q?z3G17Tq+7a10tkJLwpRWLLUEh5pSIWIztF6mag/PL/+xKhZxj7jAXUnmj9sp?=
 =?us-ascii?Q?h7f5IVI+JrzAEhKcNmOK6RF165HTEf4VO4nOTHy2PD2+VyPbzCydlFP3uJ38?=
 =?us-ascii?Q?XGmufam1eq4sVQQaL4QYiHmyU7X6zsfMZCkz5cNoZ08oCeDXJTJPHo6Fyd2r?=
 =?us-ascii?Q?pJOeo+7gWvwO0SpEwJ1PmhfczekYj5LhV1geXq5xJkq2S/ob0oVqDpn9q5f9?=
 =?us-ascii?Q?rmLN/xvwOoCvvIOE4oz3ei493zejcCRodIvwEnQEESUPKP4NgQT3UbNc9cyt?=
 =?us-ascii?Q?/z1glo5uz8pEpuqRZ49HJgcUpg5u/NXmMW67lbDDQ7QsH+JCeR4/1Cao7tO5?=
 =?us-ascii?Q?YrVR7mbdP0YKUj1+wt9ntEa8gwJ7poFxdQAKo8fyARa4EpaptfofBYvt4AWu?=
 =?us-ascii?Q?M1CCMlUZWRSd5oMMS86z0cdd69qnjkwB9o2h4HjoqiUG17az1nPvwheHoaZG?=
 =?us-ascii?Q?Js2l3KtHUbBvyDoH3PaSJDm/R5/CZGiZWWWL5XO0xar7RXmSkha2apb2OBUp?=
 =?us-ascii?Q?mM2nqVZwIhwWIXdrOhOBvCSi2EbpjinBeiiwokIceluEGhG8e1k69oOuFgBu?=
 =?us-ascii?Q?b2Ge9KGyoHyF5QMdwm5bcZOaRbVJIlHmJpKxfVtq6BQctlmelarfLpHYewcb?=
 =?us-ascii?Q?cfwfA61ksaAtIJSF12xk0gl8jh9Xm0yp1LLUj7JCEJV315Xv/nStlVQ6fweV?=
 =?us-ascii?Q?Eg6KndRiSVGxr0egHNs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f54be0-5f38-4f03-a73b-08d99e16a202
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 15:37:09.6029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6XTeMUVf2thsOyW70Pp/VWc1IRYa0WGsa9AjfTkhmDhEJVuxH2g46UWS01oWdFiV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5224
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 02, 2021 at 08:05:36AM +0100, Christoph Hellwig wrote:
> The only supported hypervisor is KVM, so don't bother with dead code
> enumerating hypervisors.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.c       |  17 +--
>  drivers/gpu/drm/i915/gvt/gvt.h       |   1 -
>  drivers/gpu/drm/i915/gvt/hypercall.h |   6 --
>  drivers/gpu/drm/i915/gvt/kvmgt.c     |   1 -
>  drivers/gpu/drm/i915/gvt/opregion.c  | 150 ++++++---------------------
>  5 files changed, 34 insertions(+), 141 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
