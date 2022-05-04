Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F47519A02
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A8410F7F4;
	Wed,  4 May 2022 08:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 369 seconds by postgrey-1.36 at gabe;
 Wed, 04 May 2022 08:38:05 UTC
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2954910F7F4
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1651653483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uQfWNe1RxVIVhGw370YZzsDPbGmRCJ6APtQ7SkS5ucE=;
 b=S2uw+aJQJegDR+922shLcMB0Z1wAjn26lU6W9muFcVcPuX0k7jsouvIfV7j8ciHeqKI0k1
 g2PxkPJumXHiN7XHYVwgm2OSLZGpDEdvkUPLO6pYUT8tNo7YyUWubQX+umQ129aerSjSt7
 w/F3y2FbIrIlFAw//T/24m5Sfs7tWHM=
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2053.outbound.protection.outlook.com [104.47.8.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-s03ChdGRMva8mRVmUNHg1Q-1; Wed, 04 May 2022 10:31:51 +0200
X-MC-Unique: s03ChdGRMva8mRVmUNHg1Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/TcqT3FmKHLvjBoB2dTAf6qSEpSlXxnWt72lZgDZiAkI9tYIVrN/TMZ97c4y/V8yI78LutDPzRWxcmg1UJrgz9KA0VRaTkZFLFW0RNv83UrNA/oW59EGQRvDoy16Mdyh1VlRZeeijbPKMW3LAfX2jXocIGzzFWIaF8yrVWhgNdEUkP1Hjm7xtuQyASavG+hMlPcSml8DTlPrUWgZBEdWPF4WhzKdnRK679jX3rpCDgOy3LDFefGuhONH43yATAH2+3s0WMz83mvZRpn3j9U6HPs2J+1OK2Vht86oeQTX3STNcvMm7lTncPA3eB7iROCONua4/pv6WEC0CUv2l2ALQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQfWNe1RxVIVhGw370YZzsDPbGmRCJ6APtQ7SkS5ucE=;
 b=O/MdNjN/vdEiSXOOv5aLaCtKv24zDcfASUE87VxaXEgPQKkbLQvP3Vv8mzBcP+UPSkGYiMSfawR2oP9hdRouktrHCaJjbMoFw7NLD301yyAi6491YzglTUj7Vs9f3UUu8Vu07gMAm6AAIroem+1EURPb63bd+afJDuf4ah/XP0KhZCJD0cCxBfIE9R87T5Or7YUVtAJeZZxxbYnWTRHqNQK0o87njqmybuWh3Tb1fe3fbY1WdOd3ue6N8NLs/39mRmVoR2tMRB3cra0mdkwohQlau0ZBp4Vq1bo/RLlVJkMkGNk4Ut2SqS+x26oFZATs8JPye6R+ii69xpG+p78r4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB5437.eurprd04.prod.outlook.com (2603:10a6:803:d8::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 08:31:49 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 4 May 2022
 08:31:49 +0000
Message-ID: <1d86d8ff-6878-5488-e8c4-cbe8a5e8f624@suse.com>
Date: Wed, 4 May 2022 10:31:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/2] x86/pat: add functions to query specific cache mode
 availability
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
References: <20220503132207.17234-1-jgross@suse.com>
 <20220503132207.17234-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220503132207.17234-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0337.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::13) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d493a38e-8de6-4ab7-a9ef-08da2da8884e
X-MS-TrafficTypeDiagnostic: VI1PR04MB5437:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <VI1PR04MB54374EEAEC74ECEF0551AF04B3C39@VI1PR04MB5437.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q6/goCuOXLBGJE4xI9cnuLVbnU7uK3VKQx8/d04qTCC62JOqpYdNPb+52+pWQBOipselsPPIjc+xHk/FKvsuqCEzcymZ9m5mCZ5tjnE+nxjG/GFxTwIs5RmVecjJy74TzT0+a9ZsBXuiQMucoojzlKroFvM763LWfrZoQD1bkk3V55kifqIEt8F/Ez5UvYKkadFazg0TljMkRV4MMtID+fnOAwbqjhri9AiypnbvyvHHqW/5KXuhCMl0q7aXw1w8WwvVH3DJUkigdMX0STl9Yy6vGIHGMQhHCK85Zvd0zHGt4FbBqiHOr4Pw6oCazKAuxJ0mgUGmH9+O5dC5O6zl9mD1b8glBlAdxwwiBYhO9ysgeB3mVsWjmf7F1zM2RxN52dzMMR0Ssa5gbC2sJSCprrRsqC2aAOGgS5Lf645VU6Eyl9dSKQquHsf4yaZxszFcFx+Hc6gXDLRnqx7EnE/gznOJlXKei1zgEuVbCJX+pAIG8dPy3UWGbEsnBQUzeqNcimVajwyG7cNuot7MZdHRgTuc1/EM50CaM8KV/5+Mo5RkDd2sB0dNnaRTQd3nd68psAeOmZomeshxRW/hN917cqGuJMszTLSm02VV/QH9Z2Yaxd3w3KvoJvc5j9YZcHiyD7L58SilxC+xXdLStKwVnR/yozUtjoKmRoYPNbVtUQpF1UiV/1uGGIhPp9DGtllbtUwyZU6DojpKMnoYrGZ8mcal9mG9WCCWsauOWFsRWfKfptPL6gK5PevhmFT9yxVg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8616.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(7416002)(53546011)(6862004)(66556008)(66476007)(508600001)(4326008)(66946007)(8936002)(8676002)(31686004)(37006003)(54906003)(6506007)(316002)(38100700002)(2906002)(6486002)(6636002)(26005)(83380400001)(6512007)(2616005)(36756003)(86362001)(186003)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1Z6S2RLYmZscWpIYTV3SzlMZ0RDVTl1R3VKTlA3cEUvQ2pYQkJuS3k3SzBm?=
 =?utf-8?B?endydmJ2Zm5sRnNSbnhYL282dU5ZV200czdBVjJBcUJkY29vd1ZQSG5TMUE0?=
 =?utf-8?B?T3M2OWx5ZXpEREtrTEtqSkFhc0pyK1NNcktVZ0JLbTBqalI2enYvQSszNkNm?=
 =?utf-8?B?UzNwd00wM0xJQ0FQQXhhOFowZmljTXE4MjBaRTJ2WW1XV29NUTN4c3IwcWd6?=
 =?utf-8?B?MXJYdEFtZTN3UExRTHFzRnl5TUtIcnYvUjd3czYvejVvTFhRay9xK3I3QkM3?=
 =?utf-8?B?Q042WWlSc2toUUJNSmp0YTRpZ2NNVFdVc0tXQ0YyaFdSNkNLSHdpUzFDTVdC?=
 =?utf-8?B?RDdGZjA5TG1hK2JBRWd2NFBXVWJjc1dxVStBRDkwcVlnQzE2YzZvSVZvTTY4?=
 =?utf-8?B?QWFmYTdVbHM4UzBSenFiTjBQSnBJZFZyMW14WDdkMkdoUDFtS3JINFZWN3lP?=
 =?utf-8?B?ODhVc2ltLzlwaHhQTDRDa01LTzNPYUNtK3NFZG9TWEtMcjRRK0hkV1h0Tkhr?=
 =?utf-8?B?THN4NUYrM3EyYmt3RFRicExRRVRlQzNjR29zbC94VHRXZGFIaUlLZzBKb0lk?=
 =?utf-8?B?ZGw2akpJRFB2YlZsajd6M0pjM3ZSdmJtWkt6RExGMi9adjh5SHNIU3NkbkNG?=
 =?utf-8?B?c09SZ3g0ZGdwdEI0YlRHbG9hNnJhM1VveHpvVjFXT05YSFJWc1BhZkNCaUFV?=
 =?utf-8?B?TUNtc3dTS2FBMkU0OEtHdnVGbHdIRTBVOWpoeVN6QjEvZlgwSzhJTnp6NEdk?=
 =?utf-8?B?T3k0bVh0aW5TVzZ3OFVsZWt2VXIxejROQWo5cXpVVEQ4bU5tNHhPcDBOcmk5?=
 =?utf-8?B?ZlJKamJoUlpmb0psSEZmTmY2ekdhYzV0NG5qMmJwY3R6M0pnWUIwM0tGVVJl?=
 =?utf-8?B?RU5mYmROeXp1dnlXUVpCeGppWTcxQWpGYUdWd1dhczJQSllSNTR4ZlU1RmlN?=
 =?utf-8?B?Rjh0ZklkZTJXT0hNUUFPWXVZWDRJR1lBb2x2YWlKZUNZRTF6dkt1emlCcmcy?=
 =?utf-8?B?bmltenQyMXFTQ29rc09vZnRsdFRvWG11U1lWZDBoNU1RUVBBMC9BMmlhRWh0?=
 =?utf-8?B?M0lQU2k5b0U2RmF4bEx1Z3pxVGd0WnQwTmJ3OXFFbEdML0V2akQ4dUs0cW05?=
 =?utf-8?B?WWtGcXE0NGdCbjVtV3NUNHBEZG80ZlZUeFQ5dC9odXo2bmZ3K0ZobUhFeEN1?=
 =?utf-8?B?Vjl0cnVyL0xNRFVudTFWbkNUY2c0REUydVF0SS8wTFN5cXAwVGlMazRBUyt3?=
 =?utf-8?B?Z05lUDVxRU14dGZoZDJ3RG5sdmpLWUYremlWeFNNZ2IwRWtsRFlRREs0WmJD?=
 =?utf-8?B?a3NMSkM4elIxSjMzdlBpb3lBU3VmazVDc3pLQTU2SkZCaGhUYXEzWjYrdUFr?=
 =?utf-8?B?ei9yaUFpc0ErKzR3L0FGUERyVlNybzRrQ3RFNWpkVFdYSXhScjJxWURpZ3Jv?=
 =?utf-8?B?U1lxWC80azJpU1E3KzQ0L1BSazVCWDgrWlpTM01rMDV5R3Eyd3JBQmlTazVm?=
 =?utf-8?B?S3p6TzluYlhETTFRN1ZDU0JqcTc3L3NtYktNbW9jZmNFUDJPN3BtY1YxVkNW?=
 =?utf-8?B?Tkh5aW1yM1JaWGp4cUVLanFvMERhd1NHL2NhSHhTWmlJMzIwUCs3clBWUlRa?=
 =?utf-8?B?aEorUlNqbkZ1S3JCZ0xOc0haK0hPSitmRzhHTVpBQ3RlcE9wYU5UWnQ5Wkha?=
 =?utf-8?B?K05WRys3VzhRQUxHU1RTaVFzWkRPSElzSmZLOGlrYXVuWWtVNXExL1BVVks1?=
 =?utf-8?B?emZSdG1jUHlMeUFyeHBzUHlDcllHV3loMzJiS0tzOWZKbmRLVjZYNU5uUVkr?=
 =?utf-8?B?V2hTQ0c3T1loVzRGbFlJa3Z4L2ZlMWRnQVhpc1VrYmNkMm15Z08vYjYrREFy?=
 =?utf-8?B?cGU5U0lacTJlbElxSXM5K3JjSnQwdzk4Ri9HbGJDYTJlbmI3clI0Y3N4UVQr?=
 =?utf-8?B?MS9waUJpRTQ3ZVBWcWhqcld0UDJ2bmtlOGYvK2lEcmhzUEtIM091RzZzWHd6?=
 =?utf-8?B?a1BTNDZWemdNTU1jZnNDMzVncmgyU3l2MGRUN1YyM1Y1NGZNK2I1VkU5YkxI?=
 =?utf-8?B?c29DRWdYZXUwYmpTWlA3V0pqL081bHJlbGZDSXVGUDFlajZZL2VJSjNtcWY0?=
 =?utf-8?B?UHM3SDFPUHVCMlllcmdBMXFUMDlVTFc2dml6S2l4RmpZQVpzL3VoZE9lNHBO?=
 =?utf-8?B?RFRGNHF0YmJhclZSWUlISmdXQno5QmNpSWVNNUpzcWNNM3c3bHY3QVVhUlJj?=
 =?utf-8?B?WGhSeitqYTBiREJmWUFJaThMSkFIcVFBdzdqQ0lEWStEUmpKTVpVT0tobEIr?=
 =?utf-8?B?b1JHd1JiMktNVEhVdkJtRW9ZQjA3RklUeGdqUmpkWEJDZlpXTUxRUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d493a38e-8de6-4ab7-a9ef-08da2da8884e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 08:31:49.2208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AhtRaIIfvZAc7TwDIZ0GnLdy5KNKjJI1rFZ3z2ZgAfSMQzvSpvcQBWpZmqGIssObKPMWhzvHPKsiXLbV90Ay3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5437
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
 Peter Zijlstra <peterz@infradead.org>, intel-gfx@lists.freedesktop.org,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, dri-devel@lists.freedesktop.org,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03.05.2022 15:22, Juergen Gross wrote:
> Some drivers are using pat_enabled() in order to test availability of
> special caching modes (WC and UC-). This will lead to false negatives
> in case the system was booted e.g. with the "nopat" variant and the
> BIOS did setup the PAT MSR supporting the queried mode, or if the
> system is running as a Xen PV guest.

While, as per my earlier patch, I agree with the Xen PV case, I'm not
convinced "nopat" is supposed to honor firmware-provided settings. In
fact in my patch I did arrange for "nopat" to also take effect under
Xen PV.

> Add test functions for those caching modes instead and use them at the
> appropriate places.
> 
> For symmetry reasons export the already existing x86_has_pat_wp() for
> modules, too.
> 
> Fixes: bdd8b6c98239 ("drm/i915: replace X86_FEATURE_PAT with pat_enabled()")
> Fixes: ae749c7ab475 ("PCI: Add arch_can_pci_mmap_wc() macro")
> Signed-off-by: Juergen Gross <jgross@suse.com>

I think this wants a Reported-by as well.

> --- a/arch/x86/include/asm/pci.h
> +++ b/arch/x86/include/asm/pci.h
> @@ -94,7 +94,7 @@ int pcibios_set_irq_routing(struct pci_dev *dev, int pin, int irq);
>  
>  
>  #define HAVE_PCI_MMAP
> -#define arch_can_pci_mmap_wc()	pat_enabled()
> +#define arch_can_pci_mmap_wc()	x86_has_pat_wc()

Besides this and ...

> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -76,7 +76,7 @@ i915_gem_mmap_ioctl(struct drm_device *dev, void *data,
>  	if (args->flags & ~(I915_MMAP_WC))
>  		return -EINVAL;
>  
> -	if (args->flags & I915_MMAP_WC && !pat_enabled())
> +	if (args->flags & I915_MMAP_WC && !x86_has_pat_wc())
>  		return -ENODEV;
>  
>  	obj = i915_gem_object_lookup(file, args->handle);
> @@ -757,7 +757,7 @@ i915_gem_dumb_mmap_offset(struct drm_file *file,
>  
>  	if (HAS_LMEM(to_i915(dev)))
>  		mmap_type = I915_MMAP_TYPE_FIXED;
> -	else if (pat_enabled())
> +	else if (x86_has_pat_wc())
>  		mmap_type = I915_MMAP_TYPE_WC;
>  	else if (!i915_ggtt_has_aperture(to_gt(i915)->ggtt))
>  		return -ENODEV;
> @@ -813,7 +813,7 @@ i915_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>  		break;
>  
>  	case I915_MMAP_OFFSET_WC:
> -		if (!pat_enabled())
> +		if (!x86_has_pat_wc())
>  			return -ENODEV;
>  		type = I915_MMAP_TYPE_WC;
>  		break;
> @@ -823,7 +823,7 @@ i915_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>  		break;
>  
>  	case I915_MMAP_OFFSET_UC:
> -		if (!pat_enabled())
> +		if (!x86_has_pat_uc_minus())
>  			return -ENODEV;
>  		type = I915_MMAP_TYPE_UC;
>  		break;

... these uses there are several more. You say nothing on why those want
leaving unaltered. When preparing my earlier patch I did inspect them
and came to the conclusion that these all would also better observe the
adjusted behavior (or else I couldn't have left pat_enabled() as the only
predicate). In fact, as said in the description of my earlier patch, in
my debugging I did find the use in i915_gem_object_pin_map() to be the
problematic one, which you leave alone.

Jan

