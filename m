Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCEF44326E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21D273160;
	Tue,  2 Nov 2021 16:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23F57315E;
 Tue,  2 Nov 2021 16:13:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQ/aBKG1tsRxVc//YxnhlRc8nGawmtumjQc9Jf+fZUgTrx7+VrCQrTmDVIf+Mj2vhuBSebsziy8zjKKLzPeo/60W0KYTCjEbRd/44W5ZqV3WRT6bdssRN/dhuKj1ALZP6XAE3SwvvqDZpp+40eUVfpsBSko2kRf4iYsj9RdY0RWcqJTjo90kaqp8l4B7sr85e94wVGdd600TBOJi+vsbJr5Ov9LNwdXTK1Xsm+w3ZDY9sWxqT9jUT57YLuqlPe23mgyYABttHEHUWcw/NG001bc4uwF2mOKDfmTOPnUh+7SvEvtPQZpwXrWai63IO0V/OkG4uS/ViwRWqiJI7xqB9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdqpxa5lP0ODLDEkKchwwSM5EILko4DZtSP+PIbgcT8=;
 b=nxbGNK2kZAB341ATuvJPN+B7mFX5jg0+jOgHzdwKi5uTj+1YWFfrTP6/9Z/Kayln1ASBRh5Ock7ZHU5hK2me7fUcklfuP/ssnZDNRBEfl0NoicHDcmQ6iG1wFrPKVAFFxdHnNvL6innmeubeLmMo7zSNKSSVZzYlSwSp2ZYVrynrSt3rHwVUrsvopgp4QGnC9SZ0OeoXFFiU+j4i4kWtrHiKXkXdOf9riOJ2PmO5GdY5pS2mZ0ODFTxEWRvZ/02CT/FpjBgFcpoLEfrajeF5AnCICIMNmNYyt6rPQgoXKk8iuYoYEDo1s6zGBpXHuCNgEEaAxIVAuZn6iHqVnjWUYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdqpxa5lP0ODLDEkKchwwSM5EILko4DZtSP+PIbgcT8=;
 b=CGQD9LGGihJ7nOgWB+6vEWHtolZukyK7Wxh+e+jeuytp+nibe/lFJgIWAUJmLbFBpR0cTB1/Jf6JivB6h+9pPo4NCokEXZqzLXbtrT0zHrzWz5Tldyxppggikkk2FX6qUUhHfCXmcB+8Dzc4tZeCTzgcjy2RdUsjtnKNfXCUaTX1zhG2F/irNg+VAIZIwPoqT//Mui0GT2AGHz1jq3eVDxzKnc04GRFiUB8gnEnsV2SvWfAqm4tS7AaSF4DzBAwPyro9vixslFrxJZziGjIVRe2A7jlimaJ76zbgOR/Ge+jyp/Vj/MD5uV5ONk+yfyHPqTLrIE6iBhNgwQFySb68ew==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5160.namprd12.prod.outlook.com (2603:10b6:208:311::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 2 Nov
 2021 16:13:06 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 16:13:06 +0000
Date: Tue, 2 Nov 2021 13:13:05 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 16/29] drm/i915/gvt: devirtualize ->detach_vgpu
Message-ID: <20211102161305.GV2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-17-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-17-hch@lst.de>
X-ClientProxiedBy: BL1PR13CA0200.namprd13.prod.outlook.com
 (2603:10b6:208:2be::25) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0200.namprd13.prod.outlook.com (2603:10b6:208:2be::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.4 via Frontend
 Transport; Tue, 2 Nov 2021 16:13:06 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhwPJ-005ASX-60; Tue, 02 Nov 2021 13:13:05 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbb3e401-7c77-4369-b42b-08d99e1ba79c
X-MS-TrafficTypeDiagnostic: BL1PR12MB5160:
X-Microsoft-Antispam-PRVS: <BL1PR12MB51605E4E7E22251AE352F72BC28B9@BL1PR12MB5160.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a7wG1W0Zm6oKop1kb/PhPspjkoECfRaETGjO1Uygfke1pNL7WjnVmZcRvTdxFddgXWItwXw1PwJZ2GeYQRO7N/914GIBXLfA8SwGbnphI6DbMPzVFGliCQ8G32ttzypLv2szrP6WW6VjJKOxGkx1fpuN1cgTqz8fB5JWyKohF9u9dyQiBm02lWsg2En4QALkGmdALYp2u2TvAylwCmOlGK/h7JT4sOjaug4OX6mmg6EMlOKWoaeWhl7TWDfdA9Hb0vR84ufRWyTMgZiJZVZFBbUSSLhQSXbnmPBI1Qbk+J5XCrd+xuv+vLj2gFMk7kJcLsqtsER9gu0l0/PLYb1HT59NZeXluxXx43P693CP/MEZK5KudLNA4ZqfJ8p0GkRLNn/pvY8t8CSJn5YD2FcGSsFet/r3hDm6JcbNRf2HSr4MzlkJNED7iodUUWFc+Akxxi/X0ejtThvD9aX0W4Wj1jKeW7IG4+rfFlqGdbuFtjh2cmkxI4mnTM/ThgUAWVg1X8mR0ZB4ztNGBM4Cj+CXmcPld0ujQfv/hU2XMYP479rC5d76DE6fa8YcdbTc2diLccc4oyqAlOEdbz9mdM226tpIkWRDxkjqKEvn/SeLgRWzfA1upzANlQIZOT02fMNn5UJvT+1zCE/dokEDxEy7tA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(36756003)(38100700002)(2616005)(83380400001)(4744005)(33656002)(8936002)(1076003)(2906002)(26005)(508600001)(426003)(8676002)(9746002)(9786002)(66476007)(66556008)(4326008)(186003)(54906003)(86362001)(6916009)(5660300002)(7416002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ycyJ0C0m/ItzN5/VFnG7Kl53dezICEmskByRlk77kxR4+HWaIkXRROQ34cmi?=
 =?us-ascii?Q?ojy9OOGLL9tinRRWNZBLt9mmaUdCgl5szXbrHflhjsDP7sNm3yshkUir7m1V?=
 =?us-ascii?Q?vcAC2EGFNeoIGpHgIhnudKVpjaBPRtQM0svpn5Z3CKdnXYLkdxmZcVFNN+ef?=
 =?us-ascii?Q?Zx3orupKBblB021shmo2RfyXSkyAKLOtj7clISlkRbUNI2JCSuj8RR7LwJpD?=
 =?us-ascii?Q?JdzN2bB9OauHM9zefk0MExNSPjTPAH8Ucg1+lfZoyT+s9KCYcmaOPw724A3N?=
 =?us-ascii?Q?592SzrAdq16SUJwSHBMz5ILQBbjYkVidybvgJf9xsKh6ei3wr24sFxDS1JKm?=
 =?us-ascii?Q?hgafKuYCLutArwig3+3YzBvU3mFoSShdgk0koEjm5vXKqh+UPHMycw1/XJ2u?=
 =?us-ascii?Q?nH4NbN0lxtPNGZwZFb8RUfZPZruIoIpIU8DyCazZYYX1nCc+2EKaI984d4HJ?=
 =?us-ascii?Q?pLdnboVFW3u+Sd8qvf9UpdfaF8emt+WLMQsFcd3GS/grg3HyiaVj6RMeMA6O?=
 =?us-ascii?Q?3CgWgpa30Q2mp7b2m7cD8tB8BugAuwdcKzE1wzJL2kRd/lL1JueeKyeiU/vp?=
 =?us-ascii?Q?TrGZ9K5/T1aGV5i6pX86VZvx+H8Zopdll2oqld5159aMbAyfCzZgd46f2ccE?=
 =?us-ascii?Q?5cAGEoopUlSwQKdfP+cyBMgLOoWspyz6Xif5eDrYstTAQHLN4v0BV7AOhVJF?=
 =?us-ascii?Q?+LRaBcfErsLlqxIT8hmUFOBODAiKLm4GxzpAVV15mE9EzQwSmI1YjjNC+6o0?=
 =?us-ascii?Q?rx6L/f5+XfKSLO/bgWALkL89YUcB8HzhBSOhKeJMmotV8zmPSkPCufyHl6rU?=
 =?us-ascii?Q?srkmNvNEXr+/jf2Y32mcxcbO4rjTe+67GzxgAocu65HNjZ+Iu/WUSKFtFXwe?=
 =?us-ascii?Q?I0R3lf7tvRwa461MnYTIOoxLVMquVH4ykyAxKHicQe4CE4p8R9SGI3Pxi4bH?=
 =?us-ascii?Q?kPGae069Rj9F/3LXEl8Y4dmnzRwOUsMwVWpf4Aqx9aKr7embJguAUNBJw0R0?=
 =?us-ascii?Q?5fhFxyA4aO63ns71nwKwoWSCAGUVlSWIwQKxo4V0YadG5RmNKRumAjdnoBsT?=
 =?us-ascii?Q?IeSERjxuTdM8a+KaL8eFsamgyBwuSa5ld3DunyzLdJh4UOeL8QCVbllC0kf8?=
 =?us-ascii?Q?q5aNeqKkEbfAzJDtbeOjAoB1Z4p1Ogb7h8/h/oPtZ8ziS1zjFe2Dac6bZuXt?=
 =?us-ascii?Q?KshNkivCLJGYCfXUs974uDEYF1S3I9Nbo/quzjdRBnBTSrV9F+enKL4HMbUd?=
 =?us-ascii?Q?zQMCHsJZ6wXSwuvP6UdPPzL7a28PTGJJirqblqR8j7RM/ipN94AljA0Ul6wc?=
 =?us-ascii?Q?VDZPqCnXxiFytjS48oUA7B56zC8XjBFocj71mXl3JHSf/U5Rx3MKT97WimWH?=
 =?us-ascii?Q?jaqJ92hu83j+9qAjgqc7/KvETc7/UnQdTasG8AOVZB7ycHrVjA96VzxPWp4Z?=
 =?us-ascii?Q?kD3XSSGjVFW2NUVkEajsPERRjoZ+XBWiN85SvVH/94LwJ+eYDRnB/s436+7L?=
 =?us-ascii?Q?ZnoSPwiojscfixnMdY6H4pNdVcf4LKFfkvW6fMi/m53GHVu2n5h8HAjFQuEV?=
 =?us-ascii?Q?HpFufmBGg/DRnpjJ4Ks=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb3e401-7c77-4369-b42b-08d99e1ba79c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 16:13:06.4021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8bYjabe0FwTx3/+NgKxzTK93zIR3YSuPeZDWG6PWsDLdmLdtA3KJCu+0VyuDqhd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5160
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

On Tue, Nov 02, 2021 at 08:05:48AM +0100, Christoph Hellwig wrote:
> Just call the function directly.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.h       |  1 +
>  drivers/gpu/drm/i915/gvt/hypercall.h |  1 -
>  drivers/gpu/drm/i915/gvt/kvmgt.c     |  3 +--
>  drivers/gpu/drm/i915/gvt/mpt.h       | 16 ----------------
>  drivers/gpu/drm/i915/gvt/vgpu.c      |  2 +-
>  5 files changed, 3 insertions(+), 20 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
