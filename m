Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D733CBC602E
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 18:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B9110E13C;
	Wed,  8 Oct 2025 16:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LBPAlrJ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A981A10E13C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 16:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759940666; x=1791476666;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3m3muzRZG73wYOVItqTEiwG2K9WdEHq9EqETgZQM7xI=;
 b=LBPAlrJ76dIfV02XummlU7ArYXh9NmZL5/gsoAS5V21LO2ZCcauimsHD
 rsIGD0b8X8UoaJMgzav7kJomfVxB7ay2LaxHHEK8nfxqGWRN4FhO+eyf3
 XbcF2NEk7oSLzrRIjPuXKXCi0wE4JHIqdivxssvBYUy6cfvmDzI7siJaK
 hngxx9D8jhY8m15uD7fUDswcjbvOm+pBknXzLviSXk4+GKdYSybfhJxvz
 u/u/++XNh7apFvEVZRZKgtB3aBnrXn9dz74FaIdT7rgs91wI0XMAaAXEW
 rEXoUR1nQKMymJjtJ4LevxF77MaHqaNjaEI/j6B2QmKV/Ub4W/J+qoRvs w==;
X-CSE-ConnectionGUID: +rLbhzqATvSlTcFK4XuEEw==
X-CSE-MsgGUID: cSDjh6LBS7CfkGB4e00RDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62084069"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62084069"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 09:24:25 -0700
X-CSE-ConnectionGUID: 0A6CCKd2SgKtDg2UVWdPag==
X-CSE-MsgGUID: SsfaJLQ4T3+jQIfCmZ9zqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="184858897"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 09:24:25 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 09:24:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 09:24:24 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.1) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 09:24:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsZSWP22wbDlkWdN50EeAf/p3W56De84PQ5HaJUiGjVDifffSkOFvZgUAXb6BuTqDRSjvcDLa+3qtDDJmYfLd/A1XUEhjpe7luO+vIJnsc6oeItkNypk8WufRS3sysLY4khj4KaSHZVow+f3t3WlAjpBHnTLX8jWvJpUwI2YzPKbtrps1ILZ8yg8KvJ9ko8qoGwJhCSjiJudEGXJ3SkU05z0d+E/TCuHPHGb9l4cdjL6ybiN+tvo75CGgqM0I4CnEp+hx0V2hJxK+AXywZ/rd7NIkHuJ7MLk0NYY+4+MBf/k/bR2+8I4KCKjcLAXWfB0KZ99kLOo0VJ7WMnwIrjljg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/xReDsi2eFx+SnyjkzR3pBqxkHJHv1xjhTEDpyT5/4=;
 b=G7awjnQ6bAY23aeb85+QLytQL1tTqpnkccWF0IhFwfW6KuCNOmDSVsThhdSrTG4EGsn8jhtX9NpkC0bje0FaWt2Bkbvbd1zzqByhbkyNFXW05q7tjlSg4uZyM1MyhK8MQpNHAj7O68hSM1Z6aa7mXf4L1tOwVI3P0ZKvNcPWtFWIhS0lLCK0fdA13lOoNwKMFY113FOSpU02lf7K9BYR69XvXyGQDnMP6G7LYeXFuxTINjnWPHjIjqP/uUEjch11mtAkIppk6bOFqWAfAWNWRDLSMmhJwndxaVGnAWOXs/KeQNrjTVijkJbu2mzcE8kVXYek4foDIjxvaKnVfmC3zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by MW3PR11MB4764.namprd11.prod.outlook.com (2603:10b6:303:5a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 16:24:21 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 16:24:21 +0000
Date: Wed, 8 Oct 2025 19:24:15 +0300
From: Imre Deak <imre.deak@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 05/16] drm/dp_mst: Switch private_obj initialization to
 reset
Message-ID: <aOaQLx-7EpsHRwkH@ideak-desk>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
 <20251008-drm-private-obj-reset-v1-5-805ab43ae65a@kernel.org>
 <aOZv88NgbjmT49N1@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aOZv88NgbjmT49N1@intel.com>
X-ClientProxiedBy: DU7P189CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::16) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|MW3PR11MB4764:EE_
X-MS-Office365-Filtering-Correlation-Id: 2db4071b-b711-4f2e-e2d1-08de068722e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?4hv7dNnhNt4WQwhGAb/WLrOKWA6Wbyoq0luqO7awkTwJsFxBxzFFaCkhTT?=
 =?iso-8859-1?Q?9weILIhZ8Jq5NmBGuI6TFImpySb/+CkwjLYGmtu2yHSLIRncAJDZWlRvQ8?=
 =?iso-8859-1?Q?FXxtvYWqJjZsOYmYt1HIe5i7dobX2P7U6uCBPSiBxzzMoWSajEwZzKFVRG?=
 =?iso-8859-1?Q?3YTW1W3oOSVoiSlIftg9dgRpLuPpxsO4UTyDlbdkAOkls/3vti6hYULk5t?=
 =?iso-8859-1?Q?ziXsW7njOF8TXejj/xr5y8guK55fwfjziBYKmYLEnhG3q00sQcxs2lT8xf?=
 =?iso-8859-1?Q?ZoPS/Z1J+Vawy2tESro1mjeKsHADEKWJ5zPSYwIErWFLx7yMVs8G0IfwaJ?=
 =?iso-8859-1?Q?GoCC1bULXUicWOYxoQz6JIuPoaX1wjWZXye/FtzXKY9ovFv+TmjRRznZWC?=
 =?iso-8859-1?Q?tHVaNCFPXtMyhu2nZVfSrHg8VC/s+ku/jYX90pC68Wg8t9QdgXSbNk7jpA?=
 =?iso-8859-1?Q?PACnZw/R89JQo0rojnp5GD6H+ogjFqBqCS/1cCPv4cCAFS+uTWYgTlLLuC?=
 =?iso-8859-1?Q?vYsUnrjzBMxXvFgcjuCWISDmwNob2DFcumnS5e46E4WK/vovZ18P1lhdsr?=
 =?iso-8859-1?Q?2YwUgE4/kUdBwRPvymecG2oqvZra+H8xcST2by0MukD02xzyDomIOzaZUS?=
 =?iso-8859-1?Q?ISDBVwyEr5gP1+g4xV7ihpxnmfnEYIrMwXAfqplW6TL2ILYQbxsrGB9a4J?=
 =?iso-8859-1?Q?sZvyY6+uO+UK2DsNvtBD3x0gESJBQLgEOAQgBGZVXuyP93bmo4M/udGdBB?=
 =?iso-8859-1?Q?l9DNPaIh+QPYGIp2ISfloyw+SuRn9/gEbtyNmXne9x6kzMNGkc56W/tTef?=
 =?iso-8859-1?Q?k94POghnUlfuh1dSVhtKcXZPNsgO48+FXWyouwN70GR+VokvnTYpcHm5RJ?=
 =?iso-8859-1?Q?SgolbABEzYKoBkhknbadP6R26Gzu72jxwJSC/DxuUZP8nbC2V+uIIr7mlj?=
 =?iso-8859-1?Q?8zhBzVEvT0+QRlnvKIyDt3fwLHGRI5zQIUw4YdZcgETyDNCM9ShwIvpH2e?=
 =?iso-8859-1?Q?38VGoG8YJuTt/JVPcqx+nVAdHY5+moxf5BOXq5A2PYusQOBh5HQL6S5EF/?=
 =?iso-8859-1?Q?BYAZ66EwPSR2SVgSdoB8H7iwXr5BOsRwTj84Umo2TiWK7Ob96dXBCFUwYv?=
 =?iso-8859-1?Q?ZDxVQlm6WyxeoNBXoBqtowK/bx3zWU65juACV8PXVGjWoUrlBfPUh5d5pP?=
 =?iso-8859-1?Q?TRTWkYsOW0d752qHcqLCxgFcyy0tx2q4MIFRiBTzkHE9XZVVSSPWiEwwoQ?=
 =?iso-8859-1?Q?+m8jebctCWoSBgOPXswCkcHxEFy3+fIuPzcZEI5OuH3TLJmnkdCWiJSjKH?=
 =?iso-8859-1?Q?8GTKDJeOrQYo/8L2rQQ7828ZcculUWtfLj6JDxRugoJG3Yemy6c5AJzCCO?=
 =?iso-8859-1?Q?KIqVvvm3Z8+joVEGR+ayzP3Dqv/OUbSCBmS+BUkM1JI0WRzlPFXCdw1ngg?=
 =?iso-8859-1?Q?gDvdmU1fO0E+rn578G69Ex1IS6RnPS3WiioOWQw8g6kkY9rgXC8ZBhpVoi?=
 =?iso-8859-1?Q?EMQFU35OiEMtMnw+X1fZKc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xDRL0hkbbAzxx73aWMK6DohMYbZ1ZxzGpmZN/aF9FJgBXy0G3OcB9/ma6E?=
 =?iso-8859-1?Q?qVFnBXC9YqO0rE1iZgstbAoUgSfNbe91bb8zvQ6mJ2HgkvVRLLvY715OGw?=
 =?iso-8859-1?Q?h4tXxeZEBAe5faAJIpUcL8lXxpgpTTWQCLCVWSWRVGFm/L2gBoY9PXm0ZE?=
 =?iso-8859-1?Q?bOxTYw1BT8A8W4jk07oOfpfeirendvJIKn9yCwBUbU16hyDUb/pDot+tSN?=
 =?iso-8859-1?Q?u8RD8k6mdg3zRFqgBoK980jPT33JMISOZMwnsALR9H3lq341kMK5HTS44O?=
 =?iso-8859-1?Q?dpp+BO9DWN71PTHGMbNVYeXLQbKL2v2AoH0Z9F4f7yCvotwN8oCYW6+huW?=
 =?iso-8859-1?Q?Ujy13rrHPcdgGfYwGH/epXBhRxswzM9dSYWJylrOvyvaYvN3BSW3V/POAD?=
 =?iso-8859-1?Q?AgHeq+J/qo6fCZHL8+fSglEKS1NDwwAFNwz8UlSpnAYABYTQD9wc/l9TQ3?=
 =?iso-8859-1?Q?jndM9QhUgyyBR3fSuQg2WFHJJxsknS+UNkXEZUoenv46XZ7jzMz7jHB9sK?=
 =?iso-8859-1?Q?SmccyhCm0Lar+1tXU98yS/LabdaNEknXQpl6geY9XIdgDXIcdfiJBxzfFQ?=
 =?iso-8859-1?Q?iESiEflj7Uz5SGfN9loAg9xzUirtAH2GBcDY3hBUeFW7gUbN7PT2OD3Nlf?=
 =?iso-8859-1?Q?bhCGgHhYa/0kbrbEAyAUO3rX6qIitjrfHq7N/dE/0RtN65nEVPQskCVfcr?=
 =?iso-8859-1?Q?f0L5D4Pw2oi7OgEPPjn2Mft1gDXzgo30QZluLsmS8N/C2E4DD9u3bz3Mtb?=
 =?iso-8859-1?Q?/wFlIvFqOUaP+4sJ9jMV6mvIr7O3icww52YMN58lMYM2iqHkZfUe37S9fw?=
 =?iso-8859-1?Q?/L5KXp86fVijZmNIfqr8llXtHJy3GPLEx+XOhXpW6v9Izq9mNDBz8vIc4M?=
 =?iso-8859-1?Q?XxKeAPo7FWmWN85CP3KZzKoyCP/JYaPPJXARISoZWNzytBxBwHsoLvZ8S9?=
 =?iso-8859-1?Q?OUhim1PSbDS9kgSq57Bq0MrDzFttghOROVXYt3lzjoode0Jvflhb/RldMN?=
 =?iso-8859-1?Q?l1ctS/wIl4XqXqIwnlOu3YZg/7+QzyfKQX4DlZjmzSfYwbFi8xquEgsEis?=
 =?iso-8859-1?Q?zXKTOQWYj2iiMSf8RSe2XVtRAmGTIJPIKlk4/14m2We41M7reGrSL8QxKA?=
 =?iso-8859-1?Q?o7QARpEPAsYFFO3XJq/tSpFgKnBl8RswfYWfOuXKhCI+PFZjrF2L9Ne7xO?=
 =?iso-8859-1?Q?UzGwfmrLoK8pD2pIY4EYA0BOZLXZ6MuRsT96gL2nLsQbKHG6a0bXBOzIcj?=
 =?iso-8859-1?Q?qyujAYC4qBGTw9V2J/UjxG/mn+O0NQopUzJyOFYFzMTPInmOrftdHcWrBs?=
 =?iso-8859-1?Q?UO91OamODl4rgcyfnmdnV4ClNwCko/j6FiTcad5mYXFfEVVZUn1ijAUs7O?=
 =?iso-8859-1?Q?K3BZElIqbNMEcibcQj0zSPixOGpXqjka6nKF2Zqiiy5bYnXQyDqmyfaRkt?=
 =?iso-8859-1?Q?4HP7WvBzRplnX/ZdJ6Rj7QqgrhRt8u1PofLyGCLXE1FOlTDTSUlvMvWCPk?=
 =?iso-8859-1?Q?VmFKlM+JkZnpfoKgtFtMJjx1vQ/O5VDryTziKCmQGTlHaYso+HW/bBjIC4?=
 =?iso-8859-1?Q?dJuH0c6UnFxFzz36mCDlhIWq9JS4QgLFL46LS2CM5Ht/wkpM1JSdA8VmM8?=
 =?iso-8859-1?Q?xk47hjIg6zr6tzJVz8OFV9G6XEzFqiBRBRA6MiflH9qJq0OwMOaHYxTnDc?=
 =?iso-8859-1?Q?p9ZWtHY+Mc8m4gYpSr7qdK42koaXkBOOIYhitMoD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db4071b-b711-4f2e-e2d1-08de068722e8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 16:24:21.1110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFtXr5si4O5RUnA8R+oO8q5f5ktkpkQida2X4Y10eq4Cma5PrNmjGA2Pj3LIxQgPyb+sCNGRJU3UDVWImQ7/Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4764
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 08, 2025 at 05:06:43PM +0300, Ville Syrjälä wrote:
> On Wed, Oct 08, 2025 at 02:04:03PM +0200, Maxime Ripard wrote:
> > The DP MST implementation relies on a drm_private_obj, that is
> > initialized by allocating and initializing a state, and then passing it
> > to drm_private_obj_init.
> > 
> > Since we're gradually moving away from that pattern to the more
> > established one relying on a reset implementation, let's migrate this
> > instance to the new pattern.
> > 
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 39 ++++++++++++++++++---------
> >  1 file changed, 26 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > index 64e5c176d5cce9df9314f77a0b4c97662c30c070..255fbdcea9f0b6376d15439e3da1dc02be472a20 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -5181,10 +5181,34 @@ static void drm_dp_mst_destroy_state(struct drm_private_obj *obj,
> >  
> >  	kfree(mst_state->commit_deps);
> >  	kfree(mst_state);
> >  }
> >  
> > +static void drm_dp_mst_reset(struct drm_private_obj *obj)
> > +{
> > +	struct drm_dp_mst_topology_mgr *mgr =
> > +		to_dp_mst_topology_mgr(obj);
> > +	struct drm_dp_mst_topology_state *mst_state;
> > +
> > +	if (obj->state) {
> > +		drm_dp_mst_destroy_state(obj, obj->state);
> > +		obj->state = NULL;
> 
> I'm not a big fan of this "free+reallocate without any way to handle
> failures" pattern.
> 
> Currently i915 does not do any of this, and so there are no unhandled
> points of failure. But the mst and tunneling changes here force it
> on i915 as well.
> 
> I think for the common things it would be nicer to just implement
> the reset as just that "a reset of the current state", and leave
> the "let's play fast and loose with kmalloc() failures" to the
> drivers that want it.
> 
> That said I haven't even thought through whether this mst and
> tunneling state reset might have some undesired side effects
> since we previously did none of it. I suspect it should be fine,
> but at least the mst code does some questionable things with
> the state so not 100% sure.
> 
> Imre, do you recall if we might somehow depend on preserving
> the state across drm_mode_config_reset()?

Yes, the stream payload info in the MST state and the stream BW info in
the tunnel state is computed for the active streams (i.e. CRTCs) before
suspend and this info is reused after resume. These active streams must
be restored to their pre-suspend state after resume, which will need the
above payload/BW info.

The restore should happen without recomputing the state for CRTCs, so
the payload/BW info should be also preserved across suspend/resume.

crtc/plane/connector objects which have the reset semantic added now in
this patch for private objects do preserve their state across
suspend/resume, see drm_atomic_helper_duplicate_state() and
drm_atomic_helper_commit_duplicated_state().

> > +	}
> > +
> > +	mst_state = kzalloc(sizeof(*mst_state), GFP_KERNEL);
> > +	if (!mst_state)
> > +		return;
> > +
> > +	__drm_atomic_helper_private_obj_reset(obj, &mst_state->base);
> > +
> > +	mst_state->total_avail_slots = 63;
> > +	mst_state->start_slot = 1;
> > +
> > +	mst_state->mgr = mgr;
> > +	INIT_LIST_HEAD(&mst_state->payloads);
> > +}
> > +
> >  static bool drm_dp_mst_port_downstream_of_branch(struct drm_dp_mst_port *port,
> >  						 struct drm_dp_mst_branch *branch)
> >  {
> >  	while (port->parent) {
> >  		if (port->parent == branch)
> > @@ -5619,10 +5643,11 @@ int drm_dp_mst_atomic_check(struct drm_atomic_state *state)
> >  EXPORT_SYMBOL(drm_dp_mst_atomic_check);
> >  
> >  const struct drm_private_state_funcs drm_dp_mst_topology_state_funcs = {
> >  	.atomic_duplicate_state = drm_dp_mst_duplicate_state,
> >  	.atomic_destroy_state = drm_dp_mst_destroy_state,
> > +	.reset = drm_dp_mst_reset,
> >  };
> >  EXPORT_SYMBOL(drm_dp_mst_topology_state_funcs);
> >  
> >  /**
> >   * drm_atomic_get_mst_topology_state: get MST topology state
> > @@ -5705,12 +5730,10 @@ EXPORT_SYMBOL(drm_atomic_get_new_mst_topology_state);
> >  int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
> >  				 struct drm_device *dev, struct drm_dp_aux *aux,
> >  				 int max_dpcd_transaction_bytes, int max_payloads,
> >  				 int conn_base_id)
> >  {
> > -	struct drm_dp_mst_topology_state *mst_state;
> > -
> >  	mutex_init(&mgr->lock);
> >  	mutex_init(&mgr->qlock);
> >  	mutex_init(&mgr->delayed_destroy_lock);
> >  	mutex_init(&mgr->up_req_lock);
> >  	mutex_init(&mgr->probe_lock);
> > @@ -5740,22 +5763,12 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
> >  	mgr->aux = aux;
> >  	mgr->max_dpcd_transaction_bytes = max_dpcd_transaction_bytes;
> >  	mgr->max_payloads = max_payloads;
> >  	mgr->conn_base_id = conn_base_id;
> >  
> > -	mst_state = kzalloc(sizeof(*mst_state), GFP_KERNEL);
> > -	if (mst_state == NULL)
> > -		return -ENOMEM;
> > -
> > -	mst_state->total_avail_slots = 63;
> > -	mst_state->start_slot = 1;
> > -
> > -	mst_state->mgr = mgr;
> > -	INIT_LIST_HEAD(&mst_state->payloads);
> > -
> >  	drm_atomic_private_obj_init(dev, &mgr->base,
> > -				    &mst_state->base,
> > +				    NULL,
> >  				    &drm_dp_mst_topology_state_funcs);
> >  
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL(drm_dp_mst_topology_mgr_init);
> > 
> > -- 
> > 2.51.0
> 
> -- 
> Ville Syrjälä
> Intel
