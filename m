Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1596B85C31F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 18:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2A710E50E;
	Tue, 20 Feb 2024 17:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZCQC7g/9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F5710E509;
 Tue, 20 Feb 2024 17:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708451836; x=1739987836;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5b0caTBIqkcmuBPB3kAbUpuHRk/T9ENOQgNLBTAIg90=;
 b=ZCQC7g/9V7n6HI0PVvAD5WtYPX9lmvvZRQv70YCMONzQbcBsubQNAlqo
 dJ+jDkZE5TamvhVjveWyldMTziQqrtiIZpEQx9ktg6YlY/cqAF3EvJAwp
 lFobHuw/xVNZrGxSmP3rhEFTGrnSpPnq1Hv5Bm+Xvx2UpISDmYC25Qqcz
 Yivikb04KV4MbvLfAAfmOGDPuVnjyTC1rl/blADDutiLkk/Ney5erXyCS
 XWZnxI89cgqs43f4tpedo8sVam/fLlVb3chZ7zKSQgcFJSw2QqcmCdGlJ
 hJZ0+jwRPfz7oEmoCoiwBymodx1ypCEMYm5tgTsCe6kQsCJv0La76V7NN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2434408"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2434408"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 09:57:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="35624365"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 09:57:14 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 09:57:14 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 09:57:14 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 09:57:14 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 09:57:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBPv5FTW7Pl1SirXklkOmwUs33zIa3PCDjthDnxDUbQltTnDTXNWAMHkCitzmtFZwAQSnTl7huRP1xoiYBqKMPe2V7i+m3/GNH5x47T1neeNB6RnVWD6NGe9mie3+zMs3Sa8wEMeSY0Xnw7PHj09u87rek3lQHWMNrN81aFWkIBVIZVgmut/zZEhR5S+PN6XsLLrbsiDTdLl9IAtUjuZzJQxCcISqB0QAh8PEz9HADzXRW0bdSOY9V3CLlZVoS9TVof2s/Qan48iU2LR5G4pUdl4wSMmlGlq0UveS1K/gAMjKi6o6tXBLTF0A+UKAPNYFphGeZLOyvX0lAIWEuppnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7zgSIPAkZqygppTGay/JaMYV3LWZxNNfzzf5MX1Gqw=;
 b=l75mYXOjGrv1w8zuwS1iyDcSAZuEdMpjnm/7jNSZHizVMjtuAWfZuTA3Ek2DSbzyYHPjopHzcnD3/oiw5nIcNALqNic+4w7gJNvnAMptK/HmLKS1+qHnn+wBS/tE0dvlc1vhtf2xdhvJpxKtjhfX1yRsvtqjmZpofm/IhZnugKpdgxfDkr3qvjRfS0oH5eut77ohmikxJNmrBjKyi1O85WzWi0YoJCOIlMTndWOHif/Ju50F6k4B2pRzyKn8ECqnYgW6S3xo4rFerUJZeazo9H1jc6K+AZUV2xTthu+FFVbXeNCDX+3g36zc758o06VB/JMkEycvtg0oVIum//jnoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB6543.namprd11.prod.outlook.com (2603:10b6:8:d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.34; Tue, 20 Feb
 2024 17:57:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 17:57:11 +0000
Date: Tue, 20 Feb 2024 12:57:06 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: Maxime Ripard <mripard@kernel.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 David Airlie <airlied@gmail.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/tv: Fix TV mode
Message-ID: <ZdTn8oy1bs1rIqmL@intel.com>
References: <20240220131251.453060-1-mripard@kernel.org>
 <ZdTm1bFgR8x2IJhN@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZdTm1bFgR8x2IJhN@intel.com>
X-ClientProxiedBy: SJ0PR03CA0199.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB6543:EE_
X-MS-Office365-Filtering-Correlation-Id: 034bed27-fa4c-4d26-a64d-08dc323d5c9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DWTxVFNurSSuzhhvHmQu+/WwRzPJasbJZmfJelfK1xpp7m+5xXoJrN1cWqyhPNN3S14X+mEvBU/2SdKgBGJDvoC0ZA2edo2ppBybchUg5i2RuOiYKm4J/r2l4GJl9fVXtw9ykR5MSP6rwwfxARLJKIzq4+JH/i0yaTyARGZGHihMQIAoUJOLYbPgp0IYjpH6mO7tiX1ILz+BLLgc00kwoG7YIVnyFBYnA1Q3n4or4sn8z/LNAEfEZUvoOoLBCGHNTrfarlyZCkMuEmfy2LOByQ6v3bf0LjDXOSMpx7B+3dsg8OdnT3Qu0oGgkO2xQ3fYOL49eGRxsxKc+SKFvORM0PwUtynyIZJb7RT1TLtlrQJPXh8AX2voxGtVKH2TVUs5rtUCAlDrFZ5AD5H2SvemPuhS3iQiSs93kS1Chtt3NBevgBt6QTQqq5FbHGUaRNN0Im0weLbYdCDjLhLf507VoCSmcGNKO/M4KGqEWPtHALYz3i1O8GdGQPmvKixS0HafxiIba1oEQaY7F3bmsLFbH9igCyDGaMyURIP5heRJfRU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?y0Chv35ysGJiCu5WwGkhsVPUJ1Fc2lsjn0HVLQzFVyc2ME0Lvs13WfR2ti?=
 =?iso-8859-1?Q?o5EwQhgvS35drDLDMHXM3tqc7Ds4QkQgJK6XeleCfajxE2daiQyQ0UE8QO?=
 =?iso-8859-1?Q?6NN6kSqXhX1v8tnFgLGqje6v6yyhkr70yDsDLufUPXSHUQTg19tUKLmpOS?=
 =?iso-8859-1?Q?Z64k8tXh1JS1G/TJIctgvzy9F9W5ZXTjNCQU9NnQb2zz6a8ToG91S3ekVo?=
 =?iso-8859-1?Q?37ilYzDoHsb/qzYzYzUhfkUqfUL+cnSJ9RVMa4LG0Terxl6SA2JkDiyX76?=
 =?iso-8859-1?Q?sQnDKQm3iYbJnPAgWaGd9myOitZemd2VNqC44lLjo7hU/DDtDMvlUuXZdj?=
 =?iso-8859-1?Q?qi93YH8qSHeBFLoVxYJ/BuJw0gl+B9oj8czTwqDFuPrlM5oDFzcVKx9GAf?=
 =?iso-8859-1?Q?Vgod8M2pY7QPWCb7Hh3nTFz1CHpDRyHnFHoAklm7fAg0zHBJNeoYTWHYlZ?=
 =?iso-8859-1?Q?Y/g2ul0fKvZN5T5s41xum7BMbNPwrL1YDAdHjiRUwXwUOYv2EtmT0b9uvv?=
 =?iso-8859-1?Q?1eC+Av8rT9JXCKpjtk5tCEvGLRmAYxN3t28aTUlGqC0jym0INr7iqDHA35?=
 =?iso-8859-1?Q?4AM+Kuu7j6XitnXP050vZQUifqwRebVBgMMyIcTF0QCg7Be8TAB0rf1ypg?=
 =?iso-8859-1?Q?D2MN1dCjWblI0IcAi4po/qiKmzkwbvaUhck1HX0OUsVwBJMeMUkDZgujgH?=
 =?iso-8859-1?Q?Zs+Mb5xuP0GIYimhJitGztqt1jB9tzbogwqKKoHC0gpNwK2sQP2nTquu2Z?=
 =?iso-8859-1?Q?4EAQCNFV0+bm3LVHZ6/YRWkZbj7OikX3T/BZzElYf9LpxKQklPJY2yVGBk?=
 =?iso-8859-1?Q?pJSYT0+t0wyoKXB1X3A8JbQ+RqYgulI1cDUq4HWhYpkK0zMqdAOwgt6yk8?=
 =?iso-8859-1?Q?/+R9XaKZo+vKs7r/5MXry3H3LbPYNdqdN7KcVh18baa86xs4WUEJyLvy2s?=
 =?iso-8859-1?Q?/rS1pFfqnHgM6OKE0+WuENaLWuy5EqPajptpwM57A0LX2uoKTKzsO6XW34?=
 =?iso-8859-1?Q?uw+4t/hN+X1KYqmy0+j+Hijd6aXjvx69uvO8e33gbWArdlzhWq5VGYRzWz?=
 =?iso-8859-1?Q?EIpqMaeXIuIQmugL35aM+PI6QdLUNlSe7U6xlEHxzJlqynLQb+kIZpbOLV?=
 =?iso-8859-1?Q?wlg5orF8ZEz2I8afi9C9PnvNK4tL4UeGU+ddN2rIds29w037uapKjipkDo?=
 =?iso-8859-1?Q?WxKriLFhR2cEq7nhCZUpzSzFlU1fzgxpxJMv3NmR1zoLM+ntW9ViMoHURB?=
 =?iso-8859-1?Q?1NkQrNlo4Pij9fuGyjNKaFqd86eVmFr3MCdA1dECeduMmYM3piVYn2T7q/?=
 =?iso-8859-1?Q?jH5YCe0pdJnhxe81I3DDlY149Zg9PD18w/iGkBnwUNvNVaohLDGcntjgsy?=
 =?iso-8859-1?Q?jxLZ/TLqDpnqA6ZVFwHLab9Pph7GeIyCoyWpIpFvRMjjqWjXYjXBFlireK?=
 =?iso-8859-1?Q?ORG+Zq+K3y5hWn8vuUixINP9NdZ0gJ+B4onI+DGBagFoI/d99nDachAO+V?=
 =?iso-8859-1?Q?NGpOGuVkfXKxBgAt6n+4t/W4YNf4SHCwZZiHNfSvYyyrl5swh9AISoEiLi?=
 =?iso-8859-1?Q?Q1HGisgsh/uBWUb+trzf/Uz0o2uo66o7pGBF33rQveJfvMVIhLLEdRZ2Bb?=
 =?iso-8859-1?Q?C8muZcU+DeFdqZmTm4I8AXJmSbbicNZPt9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 034bed27-fa4c-4d26-a64d-08dc323d5c9e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 17:57:11.2343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MjoxIE8hVKhDYS01Xvw/usdVZXaijtxs0Tu7yNgBZrO4/Wlacsr6ULOxtHE3k+AsOTYWoeB8bLuLXgI5o+9j3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6543
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

On Tue, Feb 20, 2024 at 07:52:21PM +0200, Ville Syrjälä wrote:
> On Tue, Feb 20, 2024 at 02:12:51PM +0100, Maxime Ripard wrote:
> > Commit 1fd4a5a36f9f ("drm/connector: Rename legacy TV property") failed
> > to update all the users of the struct drm_tv_connector_state mode field,
> > which resulted in a build failure in i915.
> > 
> > However, a subsequent commit in the same series reintroduced a mode
> > field in that structure, with a different semantic but the same type,
> > with the assumption that all previous users were updated.
> > 
> > Since that didn't happen, the i915 driver now compiles, but mixes
> > accesses to the legacy_mode field and the newer mode field, but with the
> > previous semantics.
> > 
> > This obviously doesn't work very well, so we need to update the accesses
> > that weren't in the legacy renaming commit.
> > 
> > Fixes: 1fd4a5a36f9f ("drm/connector: Rename legacy TV property")
> > Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/i915/display/intel_sdvo.c | 10 +++++-----
> >  drivers/gpu/drm/i915/display/intel_tv.c   | 10 +++++-----
> >  2 files changed, 10 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
> > index 825638702ac1..5f9e748adc89 100644
> > --- a/drivers/gpu/drm/i915/display/intel_sdvo.c
> > +++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
> > @@ -1220,7 +1220,7 @@ static bool intel_sdvo_set_tv_format(struct intel_sdvo *intel_sdvo,
> >  	struct intel_sdvo_tv_format format;
> >  	u32 format_map;
> >  
> > -	format_map = 1 << conn_state->tv.mode;
> > +	format_map = 1 << conn_state->tv.legacy_mode;
> >  	memset(&format, 0, sizeof(format));
> >  	memcpy(&format, &format_map, min(sizeof(format), sizeof(format_map)));
> >  
> > @@ -2323,7 +2323,7 @@ static int intel_sdvo_get_tv_modes(struct drm_connector *connector)
> >  	 * Read the list of supported input resolutions for the selected TV
> >  	 * format.
> >  	 */
> > -	format_map = 1 << conn_state->tv.mode;
> > +	format_map = 1 << conn_state->tv.legacy_mode;
> >  	memcpy(&tv_res, &format_map,
> >  	       min(sizeof(format_map), sizeof(struct intel_sdvo_sdtv_resolution_request)));
> >  
> > @@ -2388,7 +2388,7 @@ intel_sdvo_connector_atomic_get_property(struct drm_connector *connector,
> >  		int i;
> >  
> >  		for (i = 0; i < intel_sdvo_connector->format_supported_num; i++)
> > -			if (state->tv.mode == intel_sdvo_connector->tv_format_supported[i]) {
> > +			if (state->tv.legacy_mode == intel_sdvo_connector->tv_format_supported[i]) {
> >  				*val = i;
> >  
> >  				return 0;
> > @@ -2444,7 +2444,7 @@ intel_sdvo_connector_atomic_set_property(struct drm_connector *connector,
> >  	struct intel_sdvo_connector_state *sdvo_state = to_intel_sdvo_connector_state(state);
> >  
> >  	if (property == intel_sdvo_connector->tv_format) {
> > -		state->tv.mode = intel_sdvo_connector->tv_format_supported[val];
> > +		state->tv.legacy_mode = intel_sdvo_connector->tv_format_supported[val];
> >  
> >  		if (state->crtc) {
> >  			struct drm_crtc_state *crtc_state =
> > @@ -3108,7 +3108,7 @@ static bool intel_sdvo_tv_create_property(struct intel_sdvo *intel_sdvo,
> >  		drm_property_add_enum(intel_sdvo_connector->tv_format, i,
> >  				      tv_format_names[intel_sdvo_connector->tv_format_supported[i]]);
> >  
> > -	intel_sdvo_connector->base.base.state->tv.mode = intel_sdvo_connector->tv_format_supported[0];
> > +	intel_sdvo_connector->base.base.state->tv.legacy_mode = intel_sdvo_connector->tv_format_supported[0];
> >  	drm_object_attach_property(&intel_sdvo_connector->base.base.base,
> >  				   intel_sdvo_connector->tv_format, 0);
> >  	return true;
> 
> Hmm. I didn't realize we are using this in the SDVO code as well.
> I don't *think* that one is actually broken since it has its own
> .{set,get}_property() hooks. But I suppose doing the rename
> there as well is a good idea anyway.
> 
> Can you split the SDVO vs. TV into separate patches? We need to
> backport at least the TV part, and a smaller patch means less
> chance of conflicts. Or if you prefer I can chunk it up while
> pushing.

hmm ouch... I shouldn't had rushed with it, I'm sorry.
But I already merged this as is.

> 
> Both parts are
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Thanks.
> 
> > diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
> > index a96bcfcf90a3..2b77d399f1a1 100644
> > --- a/drivers/gpu/drm/i915/display/intel_tv.c
> > +++ b/drivers/gpu/drm/i915/display/intel_tv.c
> > @@ -950,7 +950,7 @@ intel_disable_tv(struct intel_atomic_state *state,
> >  
> >  static const struct tv_mode *intel_tv_mode_find(const struct drm_connector_state *conn_state)
> >  {
> > -	int format = conn_state->tv.mode;
> > +	int format = conn_state->tv.legacy_mode;
> >  
> >  	return &tv_modes[format];
> >  }
> > @@ -1705,7 +1705,7 @@ static void intel_tv_find_better_format(struct drm_connector *connector)
> >  			break;
> >  	}
> >  
> > -	connector->state->tv.mode = i;
> > +	connector->state->tv.legacy_mode = i;
> >  }
> >  
> >  static int
> > @@ -1863,7 +1863,7 @@ static int intel_tv_atomic_check(struct drm_connector *connector,
> >  	old_state = drm_atomic_get_old_connector_state(state, connector);
> >  	new_crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
> >  
> > -	if (old_state->tv.mode != new_state->tv.mode ||
> > +	if (old_state->tv.legacy_mode != new_state->tv.legacy_mode ||
> >  	    old_state->tv.margins.left != new_state->tv.margins.left ||
> >  	    old_state->tv.margins.right != new_state->tv.margins.right ||
> >  	    old_state->tv.margins.top != new_state->tv.margins.top ||
> > @@ -1900,7 +1900,7 @@ static void intel_tv_add_properties(struct drm_connector *connector)
> >  	conn_state->tv.margins.right = 46;
> >  	conn_state->tv.margins.bottom = 37;
> >  
> > -	conn_state->tv.mode = 0;
> > +	conn_state->tv.legacy_mode = 0;
> >  
> >  	/* Create TV properties then attach current values */
> >  	for (i = 0; i < ARRAY_SIZE(tv_modes); i++) {
> > @@ -1914,7 +1914,7 @@ static void intel_tv_add_properties(struct drm_connector *connector)
> >  
> >  	drm_object_attach_property(&connector->base,
> >  				   i915->drm.mode_config.legacy_tv_mode_property,
> > -				   conn_state->tv.mode);
> > +				   conn_state->tv.legacy_mode);
> >  	drm_object_attach_property(&connector->base,
> >  				   i915->drm.mode_config.tv_left_margin_property,
> >  				   conn_state->tv.margins.left);
> > -- 
> > 2.43.2
> 
> -- 
> Ville Syrjälä
> Intel
