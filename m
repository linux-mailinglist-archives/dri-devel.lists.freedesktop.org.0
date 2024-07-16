Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1475C932636
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 14:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA4410E68E;
	Tue, 16 Jul 2024 12:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RsmT0H7B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DD810E68E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 12:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721131682; x=1752667682;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wo7IWJIK+aGfFljnHCB/OBW5YEXl7gJ8SPBXELRqIdk=;
 b=RsmT0H7B85cUCIIoTaiIGeMsnfDvyIlakXDIKKAxq55MwJUqXUZ9rmwc
 rm+bg+Pdo1NKT/r5tuB9LAELxpL1JzErskDxBaIgkU+Bkc6HQDZXx2C5f
 rsxeNrO043hLW5me8rKGbgYn/BKHhef+8+IMvmZsQa4ezzIe3rdYzu5C0
 EWQfeLYW+pyQH46vnhF7WLbwCru0+TTUntIJGMANzLJlbaCau5GIm4B1Y
 EB3Ug27DgvTwMeXsCUqt/rq/cxXDfO5JpuzTr8NvihAl7wApYhD74CUUy
 GKOof8/BfUJRev9KKfPEqzTxqVPElxbqIza8eObh14CfRCdOOoipzpZHk A==;
X-CSE-ConnectionGUID: 5XII9tFZR/+f9asOFAgnJQ==
X-CSE-MsgGUID: nLIu+ROKTrmh4N6RHgCDpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="29154325"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="29154325"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 05:08:02 -0700
X-CSE-ConnectionGUID: V/5fQVieSiCw/wlC8+XPVQ==
X-CSE-MsgGUID: nEn21DYqRbGVVwoIxQBb+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="49927611"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 05:08:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 05:08:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 05:08:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 05:08:00 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 05:08:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+7DkTtuSgoxqEnrsuTAHuRLQ/U8c2GUe6qFb/zfIntaCKH1M4z3KQm3Fe+J29sl+AsCZ5gW01v4X61n9wKFPzOsR08m6WNzPgaw8C+iae4q6UiEaHq1K+3ty2mSByB+/yeniU9IWaR7/HW/ennLJnWEDm72cfUC3vH0NCKqWkSymetEnZKDGGeYJ6fsC1AZitn7uvTj63cEv0EV68x6ZtilOvOfUovzbUO2HoZtsjoM8fZuSzBJghrxiAJyMzDPm/DIE043IrL45c5UObWSLhoG7GgW5cVM7RCbRPyrfMweFi5DrqVXdNqZiIW4whfUV6MSB23TpXsBEPcccK6ZVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCjQ1oyGNu3uallsAyAjbnF1+tIuWfelo3Zn8pvXAmk=;
 b=GaXBIpGPnoP7ohhX6fPGdZxp1oYz6m+g4hKtApiMPLRz+o+vpDtxrg5yQQ0G1eO0h2Qe/vAOWYBo5ogmAk7kwTMZNrhIGPmVqNeHj9+p5Itc7mY+9J8S+z541tD0PzEzlx4yrLypQ82vTqkatR+dm89ZUrIhDk/pYWtQBBeNbFIcfDIIDsrKEkrdJ8jvrf2eBq3FKOlXG4BXiJ69Ib5GIS9o0jjzaldcr4Zkcq89i7cEokhFq31gyd6ldd46c9pFn78yq5VszE9O15lgdfER4Y+zqM9Go7TClG09zF/A7yma0HFwbxumjgY0S/cD1CuE6MV2FGUsLjh0986zgmHz8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SJ0PR11MB7153.namprd11.prod.outlook.com (2603:10b6:a03:48d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 12:07:58 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%4]) with mapi id 15.20.7762.025; Tue, 16 Jul 2024
 12:07:58 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Dave Airlie <airlied@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/test: fix the gem shmem test to map the sg table.
Thread-Topic: [PATCH] drm/test: fix the gem shmem test to map the sg table.
Thread-Index: AQHa1pIcWxzPMC9o0U6MGDw/I2fIYrH38XEAgAEn+ICAACpWUA==
Date: Tue, 16 Jul 2024 12:07:58 +0000
Message-ID: <IA1PR11MB641851E1818CA9716761286FC1A22@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20240715083551.777807-1-airlied@gmail.com>
 <IA1PR11MB6418165B122159BCF7E37CBFC1A12@IA1PR11MB6418.namprd11.prod.outlook.com>
 <ZpY-gzNHgJXhrcwx@phenom.ffwll.local>
In-Reply-To: <ZpY-gzNHgJXhrcwx@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SJ0PR11MB7153:EE_
x-ms-office365-filtering-correlation-id: cdade3f9-ca47-4077-01ce-08dca58feea0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Pm2TqhyJfrFp4jUUtFNuS1fbBqGACuIhnCmuazYG306v9JNMifd83+VUFJ3w?=
 =?us-ascii?Q?jUAmQFjeT9p0N+64d8AKBttNL8RXqZjLqmm8N08ho/NN2UuxR3DOUFKtvad8?=
 =?us-ascii?Q?FedVNCzFYxZtDFBpghE2pp034I1vB2+tZr7FwPD+oU4YV1QpHY2elVXabLFw?=
 =?us-ascii?Q?+aJPVwmXgHaLDTTpUfuhC80VM89aZerQ+Nu8lgyrwxUh4zfaoj8MQ2fSo7oe?=
 =?us-ascii?Q?7Eg7VL1rFI9H8wacZaL/YGdQqyV+NKyAqrVNpQAOW+RRNKX+x8FLT6fb5+Bb?=
 =?us-ascii?Q?jep6rd8hJx6FDVBa0ltET7MYTKVblSfgwQvGKSbMALP3guFiEU180Lrodp3K?=
 =?us-ascii?Q?SwUyn9IHZ3gV1KZSaDES8IynmndTVcF/YsD+fvfLYeK1LKG1u4g9uvUit+Cc?=
 =?us-ascii?Q?CQRXVm6EsoCfDzkQ7UpThFTLRqkTb49RiphgIcmrFutCxwrIfKnXd+zA573K?=
 =?us-ascii?Q?qCwwdBiy1AcEjXAaDH14dIZlgFon4Xh/3S7SR3aQUJgsCiOrr9M16L9kn1K3?=
 =?us-ascii?Q?pisOW8SdemoYVg5Zo+q9iGYUtxF2nutxKGhIZ/l6YzXcApQMe+IqOVs88jV+?=
 =?us-ascii?Q?RuVkf9UcYBm9HhIg8q/O7/ZoYiqxAiY/yIpbsyaUE6tXPFguE5arGAhcMr5b?=
 =?us-ascii?Q?tWYiIvG5tEownxTzyIIAdY0ZO5vU2GzQUiHQRv8q6jYNQlvP1NXM8wqPxQq3?=
 =?us-ascii?Q?47TM0R1cqGrkiZ+jkVt4RAWl3qHzsk/eOXthDEvLn/mrWUSxKaVBOqf5oiKD?=
 =?us-ascii?Q?WL/VgPh3GW7iiqVqZM2fUYF56u2DWtZlkvo8TZs0AGwcr8BcM08YQNBXliOr?=
 =?us-ascii?Q?INfEjxtsZcxUECpY/dH80PnqrlQzcV+Pg7Zzx1saOpfPDEfzh7pEIwvFYiv0?=
 =?us-ascii?Q?QFyKwuEjNYr0KAn6Z52L+DZMrdXgiPXtFJW03HE+MokdytRUV0ODcb444rSB?=
 =?us-ascii?Q?Xr8S1Qiu7qRq/2oJMzm/7wLig7m1WeQcV3FHbPUKnLX1WGuufB6NZCcnbOHr?=
 =?us-ascii?Q?KqRkoT50iJSflK1O2lfhfkVNCa/LbJzzWYHiFrde9oUHvuie5BBU9+sfN7ur?=
 =?us-ascii?Q?/xyhXryuBnocAlKW1G7fxgxKWRDigg+T2Jqw3fwsrpre1UgcdsWUFxFjzFEg?=
 =?us-ascii?Q?8ptu0txmEn6occCrYtdkWwEpyWEGEySUNmxZczw58mn+kPNDNbDV0dSg+YPx?=
 =?us-ascii?Q?COjt0UavcHH/4iVwGOApHU1BHGkaW5IpR0NvysXvvVkJm+LelsQ4L7nZ0RGi?=
 =?us-ascii?Q?hG8GGgojGs8kmjh2qYrLXkT3DH0DuUlhqdR69fOwLfn02VHIPLBYgmK/UsHQ?=
 =?us-ascii?Q?hzHHIl7BT71OmNN+d5vwa0g9/hG/1A9UnqXO7NuoUzr88A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vHVT64sDtJ/G9nn8voTnEbEEM7GKOc14jUE8yXaNzPGJ3STqOvTYxx8g3F3H?=
 =?us-ascii?Q?0hiIcvQj/+zQAO4ikTE8EWHNnreIJUYaH/YoOvYwxIgPbMT4FWqA8wNnWnoW?=
 =?us-ascii?Q?mo4B+1aP4u57ojPm54YBsYNfwu+Cm4T9Bv5ZVolGaLge+s48RlcaGffbwx2d?=
 =?us-ascii?Q?eJOaxWYWQ4+6TYaxHtJXlbRwI0b5M0CKCrVgJxUqHhAt18Ff97cg5e199n3O?=
 =?us-ascii?Q?dbod0cbCQi+oqC90wweoRlX+hWg5+l4hsKtXr29E81Jfs53sHZRWbT5bosAK?=
 =?us-ascii?Q?Zc9Qmf/2yB9aR3N4FY7L6Xr8gMW1VadNX28MUT+ErR//GrKgfqM7qckCruMB?=
 =?us-ascii?Q?EP/hVv0uVG7IW/JtKU39C6o6nN8C3SSjrx7ITox8XfsxzH5nPZi5S+gO+AbA?=
 =?us-ascii?Q?4PX7n18Cgul8LWFv1pTrP/uwhv4u8GMFpX8ZKMWsRnBLFnW0KVnXYHBU+8t8?=
 =?us-ascii?Q?q2wer+XleZZ6aFFlJ8vY9S8R+H5rqbetfvfp2QsNk6zUGhkQAxIgz/V4in9i?=
 =?us-ascii?Q?4IFi0xDx3+vigGKRq5Fi4tokXUEzvIpshb0eEoK3WS7EBxX6F9uRWCcmdGxE?=
 =?us-ascii?Q?uqO17SYmjatKr1czZk0W6W6D/+M1aJCngkDqrjXQc1alfGCYW0WnP+d+513/?=
 =?us-ascii?Q?RydRHzz5X9CyTpIm74hxOZfqweSUBTWLF2zhz04Dq3UZjJZE9SLYSpxTeQmq?=
 =?us-ascii?Q?aJtgZQwwW84YAMpbj8hUp7f3U+2ArGe7RZm3T12DGRa/V71cedJwG8nYqq5F?=
 =?us-ascii?Q?rnSFEYBmoUZO5OBZHkCsLL+7NGNuvjmjjwSVmLKlcpcYOMAYIxmY3F3qreDC?=
 =?us-ascii?Q?DknyLxPKLYDR0actuj+xMKG8LtQVueyZi9MGhhayUqrfaXLNz3V/WBpKkDxH?=
 =?us-ascii?Q?LboH++tEb22KSk0q1c/xwpH5or/a5+ptlRMJR4zab4Bdoww8ECP1to7qYULC?=
 =?us-ascii?Q?SbmT+pGf7c5zCXKfA0eBATsa3lDDgitQVn/GEaR4ds2uL1S1jBpk4a/kDY/Z?=
 =?us-ascii?Q?2hCrXjpJsBzSStkiPQ2NuYKuIzhLcb4yNKa5QieYP6PJ6PnBrLGCYgTKvcf3?=
 =?us-ascii?Q?0oNqOITBK4r40Nr/ozjFvtmzInJbTdswPzrI6xblclYUWvrBN68MeTWTdg9e?=
 =?us-ascii?Q?p67ffRAzipKkMnzlPpHm7sGqkKul0DPL9R3h6olpX6wwwls7Cm+PpJTwZiV7?=
 =?us-ascii?Q?gQPtiVvkitiH26M/X7pQvgxDJ7nhd3xFKxcKP5+0CJqloqOkycNYuneQQ9kS?=
 =?us-ascii?Q?wXyemeUrYGiHkacaa+IlA7hf5dvp2vtoU+r+R+4pZu5UD7uDpzx0uJSisQ7v?=
 =?us-ascii?Q?cLjtV7JuHX/OHp3phUd9LOpe5ZQTwzVpZG9LiAcUwhUbRpZ0/641f+TzyCt7?=
 =?us-ascii?Q?TgqRKbm6GfJIbo1ReSHyx6fs0IrS+7ZRJPFwiKjCUNSQ+kRlLp13EhmmIZO2?=
 =?us-ascii?Q?wmQl3SVGsgbdZSYfqWVbBKGNawmVRyIb3WB/dzYlvn+av66fHlGkKEIwJJoc?=
 =?us-ascii?Q?EDGEFQ3edsvXVPCrFStc3pxWwhq+4C+NeTiViB4Ai/MgHyV51p8U5VHdVMPs?=
 =?us-ascii?Q?T/DnPSCKrBY5yFMvR0hz/kQ+sSiPhTLnAmhFmWZk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdade3f9-ca47-4077-01ce-08dca58feea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2024 12:07:58.1803 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CZ9rRHyW1rILb5ohxJpsi6AdX8lQUJT+RnY+ZxCpzZ4WhezAjmZ8BVQkY1FKSCK1vkhoocI6aOPkeROmausgMUf7qnWe7ODBZQTKh/cU0Ow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7153
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

>-----Original Message-----
>From: Daniel Vetter <daniel.vetter@ffwll.ch>
>Sent: Tuesday, July 16, 2024 5:34 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: Dave Airlie <airlied@gmail.com>; dri-devel@lists.freedesktop.org
>Subject: Re: [PATCH] drm/test: fix the gem shmem test to map the sg table.
>
>On Mon, Jul 15, 2024 at 04:07:57PM +0000, Ruhl, Michael J wrote:
>> >-----Original Message-----
>> >From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Dave
>> >Airlie
>> >Sent: Monday, July 15, 2024 4:36 AM
>> >To: dri-devel@lists.freedesktop.org
>> >Subject: [PATCH] drm/test: fix the gem shmem test to map the sg table.
>> >
>> >From: Dave Airlie <airlied@redhat.com>
>> >
>> >The test here creates an sg table, but never maps it, when
>> >we get to drm_gem_shmem_free, the helper tries to unmap and this
>> >causes warnings on some platforms and debug kernels.
>>
>> This looks pretty straightforward...
>>
>> However, should drm_gem_shmem_free() really give an error if the mapping
>> didn't happen?
>>
>> I.e. just because you have an sgt pointer, should you also have a mappin=
g?
>
>Yes, I think only allocating an sgt but not setting it up is a bug. So the
>fix looks correct, and isn't just papering over noise.

I guess my concern here is that the mapping could fail.=20

If that happens, what is the error path?

Can I call _shmem_free?

Mike

>> If the errors are really just noise (form the specific platforms), and t=
his patch is
>covering
>> for that, then:
>>
>> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>
>Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
>Cheers, Sima
>>
>> Thanks,
>>
>> Mike
>>
>> >This also sets a 64-bit dma mask, as I see an swiotlb warning if I
>> >stick with the default 32-bit one.
>> >
>> >Fixes: 93032ae634d4 ("drm/test: add a test suite for GEM objects backed=
 by
>> >shmem")
>> >Cc: stable@vger.kernel.org
>> >Signed-off-by: Dave Airlie <airlied@redhat.com>
>> >---
>> > drivers/gpu/drm/tests/drm_gem_shmem_test.c | 11 +++++++++++
>> > 1 file changed, 11 insertions(+)
>> >
>> >diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c
>> >b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
>> >index 91202e40cde9..eb3a7a84be90 100644
>> >--- a/drivers/gpu/drm/tests/drm_gem_shmem_test.c
>> >+++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
>> >@@ -102,6 +102,17 @@ static void
>> >drm_gem_shmem_test_obj_create_private(struct kunit *test)
>> >
>> > 	sg_init_one(sgt->sgl, buf, TEST_SIZE);
>> >
>> >+	/*
>> >+	 * Set the DMA mask to 64-bits and map the sgtables
>> >+	 * otherwise drm_gem_shmem_free will cause a warning
>> >+	 * on debug kernels.
>> >+	 * */
>> >+	ret =3D dma_set_mask(drm_dev->dev, DMA_BIT_MASK(64));
>> >+	KUNIT_ASSERT_EQ(test, ret, 0);
>> >+
>> >+	ret =3D dma_map_sgtable(drm_dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
>> >+	KUNIT_ASSERT_EQ(test, ret, 0);
>> >+
>> > 	/* Init a mock DMA-BUF */
>> > 	buf_mock.size =3D TEST_SIZE;
>> > 	attach_mock.dmabuf =3D &buf_mock;
>> >--
>> >2.45.0
>>
>
>--
>Daniel Vetter
>Software Engineer, Intel Corporation
>http://blog.ffwll.ch
