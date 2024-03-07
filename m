Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CE48753B3
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 16:52:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB0510FF8D;
	Thu,  7 Mar 2024 15:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nI0fegb0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5439D10F4B9;
 Thu,  7 Mar 2024 15:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709826753; x=1741362753;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BN7W+lDjbORC/x+4tOnjMeIvbSf5ptYxR5bCds5SWUg=;
 b=nI0fegb0+AxOSH82YVzb8luL2xPmQ9ThD+SXenXIVJh3C/BXVAEHVuvz
 O3HbabqCYcZnZudWZgi+vu3E6RJFJZso0WOkzQ6Ol9coW1sIPE31CQ6Q3
 27EBry2rVoAmvhysTfX8FJ2IolFDlGczDHNI8OpNbPoYw93bC96LuJQir
 kHR9AMq0TOZzoWTqfH0oJhjd/cHJEEujH3Zr2yYjncY6wAKaeLh/dHA0l
 Be9lF/sc4Shp+KhpVJj3rhKxPRO4DNOLeyffAAgSkbq48fpm6s2AACnob
 p0/gLa6xodV4x0qUQDuXfBsYyf39DDbjwD7A6v3dJffcQqqNO3//RE/VT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4622176"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="4622176"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 07:52:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="10299913"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 07:52:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 07:52:31 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 07:52:31 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 07:52:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOFOKqrH1RmSmHQFFGX3VWVMjnMC2Fcm2KuFiyMUiUWUDtuA+84FVRBQWr72YyjQwFNbFyUrbbCp9hzep8O4nKvySOghTC+lXXnOKYbCbofDEC2vsiGGtrMtEwOcepRo5Z+dcp8ZTPvLQMDpLwWCg8eKToGZ0Ircl+BM2geippAMrGGL/W83ALC58CuMz6dAd76XWllkLNa/0PBxHUuUNjfgAFZLpk7U6rxfAb3dXh8fBSptqRShT3T7jyiKEgFoc3D+DqGaUpxZY//ZgZsjcPgT9peaqxk6DqAED9Nb/DdWzVNv2sZrguEP6h9nM7GZQ8xNUi7noNne6NflQ/XUEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+EyhHRdGq44kF1Mtyr8VYyFEvTg9lZMGZAbdZI15yA=;
 b=VqTLubaYogd83XbPMN+N0z99ByPYxu0eLgaUCuuPYL9oESOEL2ydWchyx3fg6N21Yw2jglQoaYaij7mj1tZIoYT87WjePl/tjkt4NDD0fCQs0Qs9Ccge2V+7g8deidN5LA4B2LVr+9q29qraMYH/F0BGrtrDNPSPh3uoqvAx4cra+uCJrYssPfaen3Ey7O50RHjdU0+hL3UDz5+C0XBipJ71/PTmbWU9Wg8tRxahgOz2E4YUHCD2MFqeok8doiz+HpJflro2JvEL/ET//kRmIErUxtKbx6KAYL+bNRX82xdrWbwH5cfi2EAvrj+flrakwDaUtJnTJn3I3vyUsLANDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB6087.namprd11.prod.outlook.com (2603:10b6:208:3cd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27; Thu, 7 Mar
 2024 15:52:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.006; Thu, 7 Mar 2024
 15:52:28 +0000
Date: Thu, 7 Mar 2024 09:52:19 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dawei Li <dawei.li@shingroup.cn>
CC: <ogabbay@kernel.org>, <thomas.hellstrom@linux.intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/xe: Declare __xe_lrc_*_ggtt_addr with __maybe__unused
Message-ID: <yrzae6eo4byb7sc663omlxchtjz2ydhqaffzgzbrxchutgrnhe@pcliqh2atxvn>
References: <20240204062324.3548268-1-dawei.li@shingroup.cn>
 <1543D46042445CE9+ZeZ6X5Ng2rq3swoo@centos8>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <1543D46042445CE9+ZeZ6X5Ng2rq3swoo@centos8>
X-ClientProxiedBy: SJ0PR13CA0139.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB6087:EE_
X-MS-Office365-Filtering-Correlation-Id: a0137b82-0575-4fb5-f580-08dc3ebe9702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3jQwiImXUL/9klrYjbzH11YHIgOMRQeTtai2kidRzOR5MKlbBu+4AwWQyt+Jv1mHnsXCCC+spmtCC/LMEzGmwCEiyBb1Dw40eDBHiIiPfLOwgwhGWmMowBNDW6ozrzUpHxMyVpbLahn/tTWKQmfF8QGHLuLDm5W2CBo8GHGSI1PW45DqLkP228dQWzijZT8oi9fdc/WXhXCGebsMXW3MK56YdmX/V/tL6LO/7TPi/8cTJoo0IBIduBVa2SAPXQvXvVtsbaT4ujFJ/ZRMUhjsY/ltryiED7Q08EgNv37nd9eTEyIAywNo5VFcF0F/bonU9nIMrb4jTnjddyIeQtMKZToZyTV57A+z2cxRro7c4nP0rL9mgoqSFL2jrZNceBqWFeCcEZZ3X4cGF6rZfCxc+T78nXHeCj9UM1Lod3sU0I5kRle4oG3jux3mDyCgjRbZO1xpv+LxB9DPhISETPZvM1jwCDZnArRbGpLzpeeSvh/13xLGS4DWyncz/MM0Th1rexhTwGilVrFou0CF/lROztlmPQmI5DCGLkiGZ0Nv4LSK15jXkzJRbPCiOm5Ds2qkrAXFJdZM3nS6eyTF6XFAdU3oqa8eXWKANIpBJXakAy0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cdotVx9NozZ3JNS3xVrDN7mnuFRIpsOR3rAUhMYfJ5M4q5wTgOAqqPrRyQic?=
 =?us-ascii?Q?SGVJNcxWSbwvtiQZ8rCQOlBpLFTGOVZzvBUsg3MEJ25EAcfbFB9EzT4AprZP?=
 =?us-ascii?Q?hpUbD0QLrkAGsJL1ZvJAO9aC/Kvc+ENVjhJI1yBD8/6s7QNQPxQlvv4EZaN5?=
 =?us-ascii?Q?DWT99dxOGnVdh2uhxkH35/ebtlIO86+F8+TZ1Lpc8sucoyc4tqJiqlY970LF?=
 =?us-ascii?Q?rvpGJ+QPet7dt70Fz7vaxrhUOnPaTIFgjw6DQ+wKUXtio9uO2Bn3McauvGch?=
 =?us-ascii?Q?yBKTHoufLiwzRnd+6iWtaUURM91OspzLKNkCZGYqAtOxNr9nX26ECLQ41On3?=
 =?us-ascii?Q?j7Nfwgv7oHFsuXqNWIZXgCjVvTJfdU/C83/zAJ7KzOCTZ3N9KUk4DCMOV27l?=
 =?us-ascii?Q?bWB2ZE9v0iFtfTJOnufwZhXPqypzsrg6NL3T2qCF8BDBwyG9pbIB+QxE9bG3?=
 =?us-ascii?Q?cS7TtUNpSWyKe73CIKk7Z1bm2unYlOS49Xdms3F0vrOp5vE8EubKUr3LsICI?=
 =?us-ascii?Q?rxJdLXcP5W1285+HOjIKks3YXJdu+lx7TnrExG02+AZ1LKRs/MwhqUct2ah5?=
 =?us-ascii?Q?QUEEkixrlOztIK1U/fel+OJe04TgCI8y8h2JkkNtcZbR5w2S34+KWOuQ17fd?=
 =?us-ascii?Q?sa010Ck9Co9Z7lKqbZhJVnLOCSoeRQvhq09kxShbHsnb3cm4Og9yt141aC5M?=
 =?us-ascii?Q?QL0YJyyeoQtoreY0XGNGlkFoj0zKY7SEq9cVCWbQb4E06iHuNw4JqqSr22w6?=
 =?us-ascii?Q?MIyiODeys+yAVXLk3PVzQa0ZL9vlBhUNv19AcF0aW19ctD0shVUQe3b7ZovH?=
 =?us-ascii?Q?ToWg90fQfsTUWBdZpPp+RYvY+XMU6p3VK2tjiPGdbL62F3RlZAVZlDVtkcPU?=
 =?us-ascii?Q?bYdhdhjUDFLkUvwDBpkhDtw2Bb/hE4MYlPgXluY+KoCmFeB1qsMELnhnIjF4?=
 =?us-ascii?Q?2jIJ97HCJ7bbiKB77VAQstJ1E/vN9KJIyo6Gy2+9Qo4FC7QMG2qdG78kntCB?=
 =?us-ascii?Q?PFMNTuHUOLUTEGDNJ/ABZrBdqgJsQgsdt2VbE5tFUsudhU14EMiGydGxxqiL?=
 =?us-ascii?Q?QXn5/FWIcQ01poiZsKuVIJJgavkynk4tr29JbhgReXM+usRHLTKpGdb83S7J?=
 =?us-ascii?Q?imjpJzG8HNBIgrlkC1jc8PBhHJbSPmwM4pT28nToqeFYjHM4QlrIwj/K1k7L?=
 =?us-ascii?Q?AcI1WHNyG1Dls8lD+s+5WZzvb0b8h6rlOmUi0rxp1T+TFgngKyuoZSzSEsq3?=
 =?us-ascii?Q?kpRQzPg5Pe8PGqxZPGUlws3jeuhe2w60H8s/8P1BzxOS1opHCnZYbeB6Gklj?=
 =?us-ascii?Q?G2FxYkefEj0DAK2bKT7QTEAk99Kdq8SFJRhWsXr9ojHT1OANBSKPMrZnBnFA?=
 =?us-ascii?Q?nIoNbd3kSMD9rfApJD0whmqFBnLCp1DVxFH3vZVnPN5wIO04iYQwebOGX7jp?=
 =?us-ascii?Q?n/I2h8gNSttLqpt+OgM3OIVI3f111E6n0dFAa49ey8rc1ZpiUOIx64Vd71V1?=
 =?us-ascii?Q?+0hC1VejUJeQdd7hfoplSbzWPS3aGXztdid5DEkuA54x+tfJKWFS58ENTv3H?=
 =?us-ascii?Q?lzwqB0przMf+l5BioPRWOi636dQc3dJtQK+2NJBprmhIGO6utVxnVSp8QfXL?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0137b82-0575-4fb5-f580-08dc3ebe9702
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 15:52:27.9828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o+iEJ60fYeOIUQ2Lw3jT4SXaJf3BdRGMo+AUm/YF+1PKhzRKjzylyOdMYRPJc8EZDKPchhxjzpmekeXTzHgGhzouXrUYgNh8HNOhNRqEoHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6087
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 05, 2024 at 09:50:23AM +0800, Dawei Li wrote:
>Hi,
>
>On Sun, Feb 04, 2024 at 02:23:24PM +0800, Dawei Li wrote:
>> Kernel test robot reports building error:
>>
>> drivers/gpu/drm/xe/xe_lrc.c:544:1: error: unused function
>> '__xe_lrc_regs_ggtt_addr' [-Werror,-Wunused-function]
>> 544 | DECL_MAP_ADDR_HELPERS(regs)
>>     | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> drivers/gpu/drm/xe/xe_lrc.c:536:19: note: expanded from macro
>> 'DECL_MAP_ADDR_HELPERS'
>> 536 | static inline u32 __xe_lrc_##elem##_ggtt_addr(struct xe_lrc *lrc) \
>>     |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> <scratch space>:54:1: note: expanded from here
>> 54 | __xe_lrc_regs_ggtt_addr
>>    | ^~~~~~~~~~~~~~~~~~~~~~~
>>
>> 1 error generated.
>>
>> Declare __xe_lrc_*_ggtt_addr with __maybe_unused to address it.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202402010928.g3j2aSBL-lkp@intel.com/
>> Signed-off-by: Dawei Li <dawei.li@shingroup.cn>
>> ---
>>  drivers/gpu/drm/xe/xe_lrc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
>Just a gentle ping.


I tweaked the commit message a little bit and applied to drm-xe-next.
Thanks.

Lucas De Marchi
