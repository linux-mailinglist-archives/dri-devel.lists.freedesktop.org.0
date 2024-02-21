Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF0185E7D8
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 20:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36BB10E041;
	Wed, 21 Feb 2024 19:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCilb1Kx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D04A10E041;
 Wed, 21 Feb 2024 19:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708544765; x=1740080765;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2hy++yosiOYsDu7oJk7vqtloVW/nq15MbBVGugqmY54=;
 b=DCilb1KxdPgum1+50dE2PdvZRqQzqhBXtPjo1FjjFfPQ7xFR1pdy89IK
 Lu+v4WoNsmyO3TMEShar+lAroYuCZYh53c7N1rRp/tri7wXCroDPhZsaA
 7jz3IJTXjXkqUykGVZyVnDDWYxhEnh6g0endIDBwMQHZeJxM0i9IAGnR1
 v5m+naXIg+wDrB6qRZNIhIX686p8rbVDQKHs71MOo+twT+ZddvJW3FQHV
 xVRaQHpqXX28DVntz9G0DT5SdNgBZR4zp4hHvRnhqoWLkiwYJ9HSRFDqk
 kR71KGvxqAXN9IbLLcJXUsjnoj0r57llVXQkX95wEI//kxCzacIKbULio g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="14150560"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="14150560"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 11:45:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="9944416"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 11:45:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 11:45:50 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 11:45:50 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 11:45:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SrUMsW+czN+PFD9sjcFkMeI9flHpjEYH4k6U5lLkzaTNxyGnmH7dKq9Y6TK3/F91khdbvHMfFymY6DsXq2f5tp2N8KyEpNA5dssXwtZt/Hha9ntlXA9iWXJqzhh2pskOKioArTa8wH2fK5VBUHqYnxgEZgMsYluU2fD+wJfqSnZsPkwuCL5UXZRQQmPAZo2V22SYQYy2koGXnvOKwyrUmh84QE5LAIXLp6sGrePehV6qeH84dGpoCnUuf7q3pkSPWLVFckBEy9zfDVHoynPNR7iXZgAgtEgR+42GWuIOLsv35C5luLGcNFqGSEDqh2MFCSYtXfrddeUSPMjf1CBPuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BLnSiER+5az/T5tFOess4PsFviJOPZDWnQojCpgCZc=;
 b=QOCGnD11z5vafy8zuL2alJgu1irsRBSxVJUFaExAUtD507f1Z9nbO2RRBzITFtxe/PQYdVveaeRivjaNk6qJo6tIKUAIGSArYrwjNE9ycnM/X37KKdebbNm6A5q/6vr9K8ji1QGpgTrdHCHmlcVrBoT2a3A2reGqyTNvVnlYGaXGWod46XtJkOVqzA5SBGN1aLgTd4+4qF41zRkZlJbVOW9BHk7xfwjrDgh/1pLSMZuE1lzsZw8QqCjFJWEmTw8pDszwUP8jEVzslUY0RoOyK6GDHbsygcaP42G0r6CkWNV8JkK0o4XWaA4PzgbWmZooJmLt+z10VOHlF1lQTIZ+Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB7061.namprd11.prod.outlook.com (2603:10b6:806:2ba::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Wed, 21 Feb
 2024 19:45:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 19:45:38 +0000
Date: Wed, 21 Feb 2024 13:45:35 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Arnd Bergmann <arnd@arndb.de>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Arnd Bergmann <arnd@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: Re: [PATCH] drm/xe: skip building debugfs code for
 CONFIG_DEBUG_FS=n
Message-ID: <zospejkdqekbndbov3ubbbvr5skxwohezeslzciivhxakfjoek@oa5sp2ffcfix>
References: <20240213134817.3347574-1-arnd@kernel.org>
 <877cj88lck.fsf@intel.com>
 <17209419-093b-4674-8b43-06c92312ef61@app.fastmail.com>
 <ngu6vq5izal6suyr57p4vlxnrn4kxyii4ewdktxvw7k3uezlcz@6oevav3wpcjh>
 <20240221172117.243799cf@canb.auug.org.au>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240221172117.243799cf@canb.auug.org.au>
X-ClientProxiedBy: BY3PR10CA0008.namprd10.prod.outlook.com
 (2603:10b6:a03:255::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB7061:EE_
X-MS-Office365-Filtering-Correlation-Id: f0de2f2a-a034-4289-5210-08dc3315ade9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uu2IesG9zP3lkyc9oqhNhS+jxcl8ZRNFVQybkaLDlhfYRd4egNCdcTJDAQpDbcU2P9//KGO/PNXcmqVRXD8yXcl3fswwShUH6luctYuPVSBJU6uqc+Vsr2fCv5pHtSGGy0KzwNwIUwyxrx7YpeexY3Jdax6vSWXneCIEV3BF3pQQ04joeKzAHJM7kxpnL0sXCYHWzQ2Y3UZ8uJq7Jb2+dVX3UHNygtag8a84qKx8ngnamanlTUEai5dKyYAVqfd54hCibZHczTZDXyAwVQy+nGPBOBaZP/kwUkGlGdX8GAfF1TTU09bsY0pqb+ItZLKFie+tjUvYSkxikCgfrqCdZSK3+ApJzaXJPcyZH6untIy26oApgIh1wAgzjkDi4DpuwNMDgZ5j2MOlj6D8bPMUYzW0brKdf6go/MEhwgvjvhJtEaVstEAy8Lr2t+kCWMCKn23YJXkoP39Rz+jlJMRCW2IXRZpkhRdfuu7086nZ94L8ANDJjknaNSqnB+CECIHxLf/5FX4hWafQeswnArxHJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2vpC87nP06XfPcW/RTUwUPNMM1N1iD4pb1n3mYGZDzuHRAAkAPWnd6ia//?=
 =?iso-8859-1?Q?naqVWQTCHGyP9DK/9RJE1tYQsUr4bSWy3wA5FrM6PsRuIB8EGaiHu8Ad1f?=
 =?iso-8859-1?Q?z1AgoEdZq4290ZzclX5VU1XJJq3Sb3GUm95kfG+4ws+uFpDqOFcZGE/I+g?=
 =?iso-8859-1?Q?feNlG4N+ppzdCsh8pYHsecN4U4x14YFeNdZ2bm3opiFul9XymjIsn2ub/V?=
 =?iso-8859-1?Q?J0O/sATHWct7kd5I9PkykZ2ARpvELmoSWH1mjLJuq3We94xhkNM6RBkxh+?=
 =?iso-8859-1?Q?vE5ch9qikx7hJVI8OwFReACfHRp2cuX28BsgzJ3GlIpEciyxKo4cL6b61c?=
 =?iso-8859-1?Q?oNhvcekIKl4sr+PaKtjN26J+Cyoh46jNDT8Pg/HBltpzzeCxDgN+lpP29U?=
 =?iso-8859-1?Q?I3Opo6YRP1vcrFHeLUOAFZGpddMqURvBIAA4WFqmMd8M9FjWek/rBH3JJw?=
 =?iso-8859-1?Q?jcT/FQ+GJnOlEp6iTkGfuRg/T3LH059TuyUIsE7HqobZlAjtbWjuxPn5oK?=
 =?iso-8859-1?Q?Lj6cmcO6GweIPQ1mkBqz/XUqpvPqegClSYE1xhJQG66gE6NH/Aslz+QTVO?=
 =?iso-8859-1?Q?BwgQ64buC4g1viF3Gf2jZNfpg73HBvqLRaollHhXNe+4sMsIHJtgj8amK9?=
 =?iso-8859-1?Q?FV8vhN9cZ7rSi/qkDxOpy+mmgj1VvGCRkgxqJIJRUoXMDcQACONJ5GyRvH?=
 =?iso-8859-1?Q?17TMlPEIKU6CFDwXpjOy/V6iAdEtQmBaJLhlWb6ckvtNKYkTBPUCHaLM4W?=
 =?iso-8859-1?Q?TfwwUaqMgYLvLXH/aQ5V5SEkwOq1f3jh9KvsH2LtT856EeCYpMTAcqOj2m?=
 =?iso-8859-1?Q?5aHklWbJ0SE3aZche9zI5T8sSlUVQKbPGjQh3XcFIiPxyqPcGkUCTaDnM/?=
 =?iso-8859-1?Q?gvU079/cXan3K6FXrZCn4stbyc09TT0euoqGcWrFEK6smGGDvXlw4Q64xM?=
 =?iso-8859-1?Q?WWfwv2yBrq4hCfzuRch+kN2QA+aquxQeZ3FG2xDcHQbWikUyhdpkjDpBI1?=
 =?iso-8859-1?Q?SLN8rg7l+KBP8QhnnhxOGNfdUlbbDcEOXbEI2PiMX1iH+8ldxk5nd3hgy/?=
 =?iso-8859-1?Q?axHA2AMJtAIOztqDUl0E7zAe2DQiFgvAGgPXyzpOC48qNQvMjyY5mT2Gls?=
 =?iso-8859-1?Q?gG9MSLm8lczneDKQBap0wSZOGaX4tXnHpIfoN7tLGWRPrncfa8fLdwlisH?=
 =?iso-8859-1?Q?pcEOkSzCs3SSADX0Hg2lOIQUm2bZVZ0G8dG0jj/zDFX7e0UfN3xu1QbPDl?=
 =?iso-8859-1?Q?OL0qtZW3lxYI/+di1+MPc/bmk4oYGvr340MwG4MULzPZ6dqAyyMjfql7GN?=
 =?iso-8859-1?Q?fyg7MSBnDmp3oIt8L9+i8RUvTI8O2yYH5XBjHVhS1XX9Q2/uEWUopxSM0r?=
 =?iso-8859-1?Q?RLBVhPZgAI2/waN23DP3uf/PDFAx0fnnNPlF01W8YxrkRbcKeEPkwEBxCH?=
 =?iso-8859-1?Q?zemoXzLY0nJWeSjKjqwaKa2bx1gUkJ6pnVm1AlwRV0TLLDq5wwJ1mbXgKb?=
 =?iso-8859-1?Q?7R8JO8O+0kteS0PFbDkCbO6jgc72D998QcmylGg60KiM/IZ/4rtWFgFZfR?=
 =?iso-8859-1?Q?ZjHVmeSUmih8feCUqeD2LDlTReVsxplHz/SKiiSWOS8wgGc/c2ER+IqXW2?=
 =?iso-8859-1?Q?+mRuj89aGg723Scjx6F92+PG1khuKBnYvovAQkESdrm1HKtZqz0jQ4hA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0de2f2a-a034-4289-5210-08dc3315ade9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 19:45:38.6644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jXQWIGp6QgCzuA10QpBg9SNzfIfrMokc5EfhZeaAjy1o6k9EFGLxg6eRgB69+Sg/zsi/I6Y98sG9WFXzkLt5+HayQxOmTdLn19O70lI+AYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7061
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

On Wed, Feb 21, 2024 at 05:21:17PM +1100, Stephen Rothwell wrote:
>Hi Lucas,
>
>On Tue, 20 Feb 2024 23:29:54 -0600 Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>
>> Looking at https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2d5c7b7eb345249cb34d42cbc2b97b4c57ea944e
>> it seems we still don't have drm-xe-next branch in linux-next.
>>
>> Stephen, could you please add it? Or do I have to do something on my end
>> before that?  This is the branch:
>>
>> https://gitlab.freedesktop.org/drm/xe/kernel drm-xe-next
>
>Added from tomorrow.  Currently the only contact is yourself.  Do you
>want anyone else (or a mailing list) as well?
>
>Do you want the drm-xe-fixes branch included as well?

I don't think it's needed since drm-xe-next covers what is in
drm-xe-fixes. Please add other maintainers and mailing list:

M:      Oded Gabbay <ogabbay@kernel.org>
M:      Thomas Hellström <thomas.hellstrom@linux.intel.com>
L:      intel-xe@lists.freedesktop.org

Looking at drm-intel and drm-misc, they are using a special
for-linux-next. We may eventually adopt the same workflow, but I will
have to check with other maintainers.

thanks
Lucas De Marchi

>
>Thanks for adding your subsystem tree as a participant of linux-next.  As
>you may know, this is not a judgement of your code.  The purpose of
>linux-next is for integration testing and to lower the impact of
>conflicts between subsystems in the next merge window.
>
>You will need to ensure that the patches/commits in your tree/series have
>been:
>     * submitted under GPL v2 (or later) and include the Contributor's
>        Signed-off-by,
>     * posted to the relevant mailing list,
>     * reviewed by you (or another maintainer of your subsystem tree),
>     * successfully unit tested, and
>     * destined for the current or next Linux merge window.
>
>Basically, this should be just what you would send to Linus (or ask him
>to fetch).  It is allowed to be rebased if you deem it necessary.
>
>-- 
>Cheers,
>Stephen Rothwell
>sfr@canb.auug.org.au


