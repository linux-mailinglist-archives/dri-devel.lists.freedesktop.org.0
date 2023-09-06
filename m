Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A59793E55
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 16:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D51310E663;
	Wed,  6 Sep 2023 14:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C901B10E65E;
 Wed,  6 Sep 2023 14:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694009304; x=1725545304;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yAI6U2nrfx0AR0M/HAX198SsXXyEDf+n9kMZ68znaOs=;
 b=ScoZ2tfOkx5r7WTQHOKPJ851hr+y018CS2+E8sxK/u0nBqswtmOOQluK
 fjN1V4vdKFeiTbnVrptH0ApWzwjNlo3GKoiEkcSrM1XMt81d3DufbkkkA
 erhBt+jblFZ8EC1F2ohtPPo8uNCPNt0H8pK6jYTXJR2NF9LifJF02nj0i
 L/lFWL5A5341BjlBQ/dBLnyohOKb0yesAuQTtoNEqrObey6eZkTw/CFnv
 P5BiOk4+4uGZwUqwIrvCDM4QZ4yZrKdi+23Z3qe0rCMvsz35T9EMd58jf
 HcXwaEoSqgaYr9uj7MF8c0Cvnw3QSF2bjEHNyuCsF+yjo61vms2Jn806+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="376988727"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="376988727"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 07:08:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="776629022"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="776629022"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 07:08:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 07:08:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 6 Sep 2023 07:08:18 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 07:08:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+grs+z0UGnptBeRunbr7BpLXfawyzfdqqQJc/dk65vxwQ2l0zs8vAyCAcoBjor+C3ZrYEyMtGUI6ly3qeO2v9MVl1/BOORFL3bFakVbCt+MHl/0wDqHP0obpvzv2ahI8VRJ8GIgk0br3lGx8nf0XuU9wSpOGR7JVb3hc54ArQuGP+9aKyKnB3THaCMggzr5qA764yqpb1zngbkHusyTJk0PoaW6k/elZ7yKqnGxwNO4WWqVK2dhgTScimM5XNhWohGYtBtoO/AMS8KdH/+vPCI/g4EzQl5oCp00Lc14Ba8BYbr2fCckbae0HuSNY9sWN0BnVVbbV4jRkudJNDSSRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Il9L4BnAzXnEz8RwS92HxQRDeFnz+Qp1dSi+4XwAy/Y=;
 b=TYrRTAJIAXzjvY2Njww2twTMFkjvQ/aYH8fcb5JBRbnB8TPmjtHD34qVWwL7GkD+/PT/Ky/h5U8d6AFpAArNcxpAwkJ+3fNPGFm0Xs6aJfpJ1WuBSg+GatWlEJX4w1D7fYlF7g3I5cTAO93R41p9qwEJ4524euqoZZCC4qj0leM4su2P9J3o2Unoq9N1Mj9Swyhlt7NV2kMq3uqUAja7XK5YRD1W8ObCaVzt9wElOfquBgl/wRs3egTm6Uql8aEDom0lKU65334W55N0pr6dIfWBrFhOBVPgDdkASh/qnS97c1sEMs0J+IbzG1n/L7fDAIXymdeRniX08VFtPpIu7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB8160.namprd11.prod.outlook.com (2603:10b6:8:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 14:08:16 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 14:08:16 +0000
Date: Wed, 6 Sep 2023 10:08:12 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Drop force_probe requirement
Message-ID: <ZPiHzDymgI+kMRMc@intel.com>
References: <20230905193624.525020-1-radhakrishna.sripada@intel.com>
 <ZPhFj0H8OYtp1CGh@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZPhFj0H8OYtp1CGh@ashyti-mobl2.lan>
X-ClientProxiedBy: BYAPR07CA0047.namprd07.prod.outlook.com
 (2603:10b6:a03:60::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB8160:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fd83a47-3835-45a9-4754-08dbaee2b6cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tDMGSBFCA9rMssjNA0sPZeD72PjX45wEmvxcCzo5Vx8cuUCFtZrPCpY+dRPcny7Dih+C99W1VNJWYoMlz8ZVd2wlqE+P7jLPHhCxd1u+0fFaYX80w/79THECxCj7NHQrLbnLsOYn3ZH5WIkWaqQP4y54ycGgtSqxyrFBiNjsOetEQbzn1hdLv4EqyfekHs/r5uer+4lRBRGbLDRz+g0ZoMXtNXQcCKXRXFKSpDHV2dlz03D+9cACoJAE6TDI1fDenuf9NCPhUA/nw/vy+c+CJ+Jrf0v8gGW/HjqBFS3Ct0q5rlRyekHUXrhfx542GieQUAp6kBHseF5Qg1Flaodgj2LuPSJgEBF/F+PJATz0zErO9uav2BzUQCb9VExvcAw+tVWm6vafg1cZ5Jelzid0ic8/WwNANpYl9pEkvP5kwl+sMO6VP34lSKASrJlCmTXhW9YWO7MtIoABvJqwEEb0C9Q1AG8+rnLX7M5vSZubrhv2mm2M/nLjKuviAix8I0qW6ih/7BELrGHPgSKeJ+AeS6Ic6jpTmRWv6uU8TbsG5JRdBlA31lLJK1pmy6nUJMYviJCYoMoWZLJAjLuCbmfmpAS0++6cNG7BFkYOm7PtfFU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39860400002)(1800799009)(186009)(451199024)(86362001)(36756003)(38100700002)(82960400001)(478600001)(2906002)(6512007)(6506007)(6666004)(6486002)(4326008)(8936002)(8676002)(44832011)(5660300002)(41300700001)(6916009)(66556008)(316002)(83380400001)(66946007)(26005)(66476007)(2616005)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KvzxKfokDsiNP0cRE083LQPs2O/0pGQaiAtAoxIKXuczxeRq+PUo3Jrj3tZ2?=
 =?us-ascii?Q?mbXxcmIDohBxk59wmac6zWNnCC8yYUchcS1PgJQpKDchEnUbjCKxuZfj0SNY?=
 =?us-ascii?Q?wDd8IrT2IbMquozBnFcIPjBTqd+yv3OTKUYi7bu8wH1YjnsfvtRyUzVPjE0S?=
 =?us-ascii?Q?xGzheMiOTt6xScYKxGAR8ENJtQFEFDmEO8c0ytZW8uy+PJ/V+TC5Vbo3QAe0?=
 =?us-ascii?Q?fS2VH4deSRDY68C9ZuuI5Rnsajt781FZNqy5przzijj9B6ig8zzznx2NGemA?=
 =?us-ascii?Q?8/NzY/7ou4b/ihYMk5TULl6uHAZQo2ruZnHkZGTE2Pp8GfucBb9p06ESfmVK?=
 =?us-ascii?Q?UGFMD6TFbrRdH7W5Vvaxk1Iz3ErRGUCUQHsO3cB1OnWbdqShGiOm8892MXWn?=
 =?us-ascii?Q?a555N5qjfUvvPL0d9v6g7I2eZ4t+ZCp08ZV1I95e9ubvUoHYgdZ0OaZ+h0v1?=
 =?us-ascii?Q?/OerfDYQkF4ubJE/QQBpP4L6qEkd0oVmxh1AwHinGRJKLSZDXJTR8tyU5snD?=
 =?us-ascii?Q?6AHqmeYdiz+hcOL5p7V/E1Ae79jQwVz5Sm/zprR+W1FCEOu1xXYjDPklbcyk?=
 =?us-ascii?Q?brcqczC2oTn40ZD9gml4d9wlzbhmwbzn1oh34cPWH/thopYhPVQWYFuFTcfq?=
 =?us-ascii?Q?s/6oj3wB3Vr09X0odrSMXkH+xvpDU9cKMKtIBs77ByHnRH6/cKahlm2MiouN?=
 =?us-ascii?Q?HNL4jjriBs7mStTovAtAdFsdsrY76DORR8NbPXNeqbQDmRweUJdpQkQ5OD8W?=
 =?us-ascii?Q?oSa37jk/fuPRVoX03W+2+GioWKqMtjeRc7EWhPdh2pvjKWCAQQ69Suxzw02v?=
 =?us-ascii?Q?XMm5bEfobuynVojzu3VUt+50kj460eS4VFZmUqAie76HEzf4Q3fl8yszy8yS?=
 =?us-ascii?Q?JizGRxOO/wCH+QuSoB0N6U6cgsLZtlOptfSapdH0/Y0fksq4uXOjL/cXXKub?=
 =?us-ascii?Q?fEpMd/MrQuG/tzBbhnCnePeCC+axuncJhlvRG1jcqrNwV1GJ4/ioF3I0+wk5?=
 =?us-ascii?Q?mSjAzT19Hqy3OVDzj893/5zIIQd9uLtqmiHBY2SnPUPrX3ih00KyzZwJJCr1?=
 =?us-ascii?Q?jUueSt2t+peGILIXgcbxEoOuYhKVj17x3VZJ0bX6ldtbsY6wVyjehR530YA/?=
 =?us-ascii?Q?i4afDhFeX8E55vN2sJ1c4387oxPUqyP/jT4FLM5/E1Z4FILDdV8gc4FNLpDN?=
 =?us-ascii?Q?0i6qnxuH/n00HZSN51fe9pwcdTVHyL+dfa2ZaLsVCj5n7WTt4sZZ08YaHmo/?=
 =?us-ascii?Q?MD4ObNjYXX7P3wA3VmF/lSn6IM+0zDDi4iRu7L96nxpZ7rKFApcqsy+Zr7vc?=
 =?us-ascii?Q?viVx422kSKeDDXLFlTus1CJjTV/n27QPWokmv6UqfUmtXBRDWOf1SgmsMnXK?=
 =?us-ascii?Q?gdcBjlNqwE0/zYjypfeFUaMxJqAXgO4HRCsLkz6nlqZZoRhwSFDSPNJR13BH?=
 =?us-ascii?Q?TtjvuS7X4V2ftL5Q1XAO4SxaSQm1WPoFB6QBLlEUf+wZEGFv5IBgPPw2Sn10?=
 =?us-ascii?Q?vkQP9HmccGw6c0M3bkeWwDHSXGT+TSm6DncUNCbXsj8CdArXCjYQax46hvje?=
 =?us-ascii?Q?/jVHj/Kj2Js3H2pBX1XBsG0WZADLcDNzDM65e64pVq/03nwhK5JwvzBq9+aA?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd83a47-3835-45a9-4754-08dbaee2b6cd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 14:08:15.8175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xnp7Ncr7rGgNQQmZkvHoNPfe5bYMgfo8pQf6Ch7eZdc3mgIvn0N8uXVVQ3I58Y82q3FjLujnreOvNXwWdqxzmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8160
X-OriginatorOrg: intel.com
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 06, 2023 at 11:25:35AM +0200, Andi Shyti wrote:
> Hi Radhakrishna,
> 
> On Tue, Sep 05, 2023 at 12:36:24PM -0700, Radhakrishna Sripada wrote:
> > Meteorlake has been very usable for a while now, all of uapi changes
> > related to fundamental platform usage have been finalized and all
> > required firmware blobs are available. Recent CI results have also
> > been healthy, so we're ready to drop the force_probe requirement and
> > enable the platform by default.
> > 
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> 
> Please keep me in the loop as well... It's been a year I've been
> working for this patch to work :)
> 
> > ---
> >  drivers/gpu/drm/i915/i915_pci.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> > index df7c261410f7..fe748906c06f 100644
> > --- a/drivers/gpu/drm/i915/i915_pci.c
> > +++ b/drivers/gpu/drm/i915/i915_pci.c
> > @@ -836,7 +836,6 @@ static const struct intel_device_info mtl_info = {
> >  	.has_pxp = 1,
> >  	.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
> >  	.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
> > -	.require_force_probe = 1,
> 
> What's the thinking behind this patch? Are you trying to
> understand how CI behaves?

CI uses kernel config to force_probe. MTL is already being tested there.
Also there's no 'CI' or 'HAX' tag on this patch.
So I would assume this is the ask to remove the protection.
But based on this question from Andi and knowing that he is working on
the MTL w/a I'm assuming that this is not the right time yet to remove
this protection.

Please ensure all the diligence is taken before sending this patch again.

Also ensure that the current CI failures are fixed (gt_pm and gt_engines)
and that CI has a stable green picture.

Thanks,
Rodrigo.

> 
> Andi
> 
> >  	MTL_CACHELEVEL,
> >  };
> >  
> > -- 
> > 2.34.1
