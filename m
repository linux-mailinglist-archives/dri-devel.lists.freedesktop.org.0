Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60290BC7498
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 05:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5887910E8F8;
	Thu,  9 Oct 2025 03:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PHzFCtd1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9CE10E8F8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 03:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759980244; x=1791516244;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Nh/jeiOFHVqglsIJvqhSRI/vca8RQQYHyaa2Yj0XE34=;
 b=PHzFCtd16O3nVcfS8XcaWT7sbYr1GCsIYX8aZQwCF8Wl4AbOVJV5Rx29
 z5FQgrDel4OB9nODtonVZrb4o9ijTqEaQ5Ka1426uWZAOAW60pEDGQBUd
 vWVhFlbq2wKHkOrDMi0WUIZzq0Fhgo5l6KRxbUBh0xKWoC2B9PoobI3Tb
 q9Q5eiNHHGnykbb3bI3945CUjXozMtIjoTB2ESsdCTNdNJhxC75Ehadv3
 KC5uZwGbdU0EUyyp8ORnr/1GBhTdLAOTgOiHWzbIgFLZr+/cjfQNpw2f0
 4hMbK4JNkFVZN22Egf9iK9CKAo5PWvtyg+rxow8N8yqscVQDNZxUy/ygU Q==;
X-CSE-ConnectionGUID: h+p4CS4gQZOAOTc7CXHKSw==
X-CSE-MsgGUID: rTzrda/xSwqRgDX5fEmlPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="73610837"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="73610837"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 20:24:03 -0700
X-CSE-ConnectionGUID: 4De1y/N8RYWaMLqbbfj21g==
X-CSE-MsgGUID: qz/Xs9YNR6+QLLenkPS2CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="180532999"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 20:24:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 20:24:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 20:24:01 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.5) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 20:24:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFznMbcMeu1spM5XyaRWlJb41g1o+nClYGQoVsUsHd93rF4tijnAGX7kb3adwuUpNVZ5Y8nAwgHgtHU3h+TDqhNsAasJNciQU/K61ZJ5FaVTos3XCUvI72aV0D6JdjlGP8DHJvUqONTDLU64yOWwNblNdFkiynB2ejP0WTigQXXtQJUtySaY2zYCMukqLIc8pjylcl3tdmZuXRtYGgkIzXfxr9lpc8AXlr+RDRUMinwIpdj8/UJiFdzJkknsCECTRK4lG0kXmA+XFhg/k+ceiwSW9jLgULpD3rYpUNctJqDkGsIYhg4xd4ZSBKyXOwc0oYSq0PL37FR4Qdioc2ToYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJecF/9+n83n/fcyHZ2sLMybs0WL95JKSCTfeg5cbcw=;
 b=OoPs55zXUWDfmLlVHc20Vz+7Y7lgLxrD7fwGwjHf3AhxFn+JTfLxDez9YUDsa3YS5rr3kLRYyUohswjeRz7/z2E01E0Q9F/BEIlYD9N/6jChwivQ5nVzMIOkg6kk2SyTTtjcylt9FRo8RQ/5pjnnnMmQPWuCRrsI09mmEO9FH+VLRvIX+WRHE2BF/CBMcJsbberTauXD9dpzYFgeKnWlnTBRqgAZErG7j4GI9tj3xQZQrHYt9cBKsVwgTQ9r/NmHx1vRMBakqUSKY052snr6E7X9rgFDgcZtwbF33SGecRMzDrmUH3xq90VN6It2nYpAekGiXr3hpVwfanGqv+0ZwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DS0PR11MB6350.namprd11.prod.outlook.com (2603:10b6:8:cd::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.20; Thu, 9 Oct 2025 03:23:55 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 03:23:55 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "airlied@redhat.com"
 <airlied@redhat.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
CC: "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/virtgpu: Use vblank timer
Thread-Topic: [PATCH] drm/virtgpu: Use vblank timer
Thread-Index: AQHcOFTh4O7Et3uiykydidDxo4mQL7S4trEQ
Date: Thu, 9 Oct 2025 03:23:55 +0000
Message-ID: <IA0PR11MB7185D91EB0CD01FD63D21AA7F8EEA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20251008130701.246988-1-tzimmermann@suse.de>
In-Reply-To: <20251008130701.246988-1-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DS0PR11MB6350:EE_
x-ms-office365-filtering-correlation-id: a3f8f88c-9d10-4e7d-99f4-08de06e346f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?o5UldtN/H3iHJtfXYm7BkBLqDWEGw2Dptkezs4OTrYeXty/xHHUQ7lZU8kRT?=
 =?us-ascii?Q?C3oTnCbYflr9Qy0fYKlRByKZlNoIPsWG3D5mO+4Pbqk5H5zOI5RLiQ7Ds+5i?=
 =?us-ascii?Q?wzvmBcp9WVdN4SHbyoL3I/L4VPe7uj52nX8HR4CzxGJSQaSIY2KSdv4FFgl0?=
 =?us-ascii?Q?wyjiUYTggLbvpBKLW+I8RsaxWojpjlZ3szV65xGO9TeIeXZ22MxMffvuSdhe?=
 =?us-ascii?Q?eY/0IWUXhcj9iCd6tCL3sQ+AwVXBSH8ErCMGKSUqjv1kDkkclq69Zqb/7EnM?=
 =?us-ascii?Q?2pJ93yWLx4hKVZ60h99yErxM/vZvn9MmkdZzZnJ5cHY/EyFRYwuar9A2LH9i?=
 =?us-ascii?Q?kSj6nyMwKT6qCAVQ1CaAaNtMAQtUin1IZLOqUvktPkub5MbJA2iNirrVsM2Y?=
 =?us-ascii?Q?WXgXsuesZ1t+uE0TaNmQ4aAA1csr0f7jg7Q8XN3MJsUaCV2TMdmAgintnIht?=
 =?us-ascii?Q?iiAYcS37XGr4mj+2gdXJTwkNWQhRp6MX5bjot+sd6/FEO7sBjLTUPdzQZy0/?=
 =?us-ascii?Q?neiJqxQhnvVahBli/S7gNtMPAVFr4Gsm/aO6fB7/W/iV2o4LtZtNQ7nRGpW+?=
 =?us-ascii?Q?Q2U9w0Cbji3sYsFu7l8FB2Ejy9oLsHBjDXJhZ7miicH8hDJRctHNRhOuS4yI?=
 =?us-ascii?Q?XFGzeS5LgqHercI8ucEvZMd4NPc8xneHHRIVzWwHNSBXbSLR16bBdaPYUNhG?=
 =?us-ascii?Q?kFoUoVxm0SYMoQCrTuNX4SD8LVHp/QQijQO0qYq4wnEka055bvqRG8eD1bLR?=
 =?us-ascii?Q?GObm7JdPN0PorjdzYLCoeAEiV8Hg12b1DAO9F30M1KMULXDFiOUIFfYeJ+LD?=
 =?us-ascii?Q?A8nxIPp2zughe6LpiWvYrVpaa9/Pg/u5aEoeaJWYM5H/z3qZvTiLF/AKQDZJ?=
 =?us-ascii?Q?GFfW4bujU/w4tGlUUAe/FUA7H1ysdlRi4oX91m4YBh2211cZehuBBXpAhVRi?=
 =?us-ascii?Q?Jc8gv7PS/lCpt/IsN3bQk6nLL/hr7E2kOsBNevdOpUGYwreulMJq9IdD9EwE?=
 =?us-ascii?Q?3w577kipF8V3XBOTJX1HVjMbw8UIpGfFiKCZoFBig27tZ7N/3HDymbjikvpQ?=
 =?us-ascii?Q?Zm0rEgIkrTFCNCccQH5L7I6VInFBjKSUkNZXXSDt1uRLzKryrS+M3OIgSBu1?=
 =?us-ascii?Q?U5kTqxsKDhBbt2oiMTLj33b4yGlsH6/QzOwKgqKxvs2W9TzHK7NLP6jkqsO4?=
 =?us-ascii?Q?XrqQ0FQfOW9XJ0l1d6lQva5JutO/ogRRKbUKZG3myTYNHVNx1ouoW056QgEk?=
 =?us-ascii?Q?A2U8dPAlqQ//2H4yw0fRsnEXZhmYIVZYTmXG8YFVLq8Lg8wYhLJO7LBy+DWh?=
 =?us-ascii?Q?H1zTkf7JbbkTV3AG8HpcxWv0q0s8+8uMC9z6LZKdGx0ZrY6rFYL9nyHZw8JC?=
 =?us-ascii?Q?8RdA9LHNkJBhClL7Nk5VJZOdyPnISTI12oxl/XrhULusfsSFeR1hIEb6Sikh?=
 =?us-ascii?Q?cwImTNIPpFNgUzXZK/umLrMoUZywJ4V7rogyU01R9iu542TuqpIH4w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jXER8E1rzGhdgjr5k0WE9O/PRuxdKmfkSXJ0aOTBrhs97ZfA0QivLcbimfSQ?=
 =?us-ascii?Q?w/kQsFOrzjQcS9Q4i3+WUss6QMgwgh2vHd1tSbCis8r9RC5JcoeCZuYPZ9ji?=
 =?us-ascii?Q?MhWiZ02Dlm1vk+6ODNUkY8/QrgZOIDwayXu2ZJ3SU0pnJ9Ep9WKiRuwmdGC3?=
 =?us-ascii?Q?bQfOF1Uy8sRKw7CVtoDxIdqZIfu5bNTkVyIquqfIBOpK2kWpuXXVDS4ErN3H?=
 =?us-ascii?Q?gW19n+I5j7bwgquVKs5QAz3GgCNMKkykmAh8a0d7bJjGZpii+E0Nlfn7tric?=
 =?us-ascii?Q?MMGzYN/FTKvMZ1oTKRER4nn4Fgj/cCgW+BRGHOdB7D0rYCaaSgDMonlPTV0S?=
 =?us-ascii?Q?1em+o5/0vprMHr5i6Sp/shMzLQkzGtHcFHw0qpEfElVZoAgE0oLBU19QQINr?=
 =?us-ascii?Q?0F5x2wsyedQMuCEQVyYv5d4/ixA/OFdL8a0XmjqEGOW0Cz9IaDsjyZy9rP0x?=
 =?us-ascii?Q?Cn0EqHh9shz7WyKCzh9Xbr7G0aDRTJJyfgPrnedadur1Ydl1AHQNQ0lLO/gX?=
 =?us-ascii?Q?0ggPii6xHIj+Pq9K9c1wIhdeuHFIjOrYtL397n/Hji/Vtx4RV0lr+zto85Ns?=
 =?us-ascii?Q?EqG0/0YpzaataTcMVXkwh4KK5ytm6IIJIKpRQzUcO0jjwRKvqlYLd2K5wAXY?=
 =?us-ascii?Q?pfp8ma7hMmKLFL/4Opnk53WKScH5+oRzMJj3haC+9wSEIkTyaTwu/Kpe7vhZ?=
 =?us-ascii?Q?4IVdbcH8EbPPbAbEy17VLI6l7h+4lMUqpLMMFW7b3EHNCtZjIeuRO6zKFfl1?=
 =?us-ascii?Q?wKOqWTogKvDur9nvZ751x8HpViyIlHzU7JX5O+SXho2gOmpPVirVf9LBYVhJ?=
 =?us-ascii?Q?ozf2+J/6AB4mwWUzxeu1kolAPfe6gxZGooU2AyyenGyDYCgpO3VKsxls+RKp?=
 =?us-ascii?Q?wraA2i/5MSU1ZvrjV0AvFDYJ38dwv44brAFQZuGuZoKY5QD02D4MNwx0UYFg?=
 =?us-ascii?Q?mTLujQNEpoYmNony5hIz/gx9OhDSm0I/oQeJOOgpNYLxHWoVKC8GQEsdS3Ey?=
 =?us-ascii?Q?FDD4tPrQ5RRyLG5SWp7ZkiY5S3nPkKrp8aV56+YNoGoe/2kQ32QFppdPqUDW?=
 =?us-ascii?Q?nQPKx64xxwui2LM4naPJ392qJSxgIPrCiBdg7wJ0feZMjG08vKEiL4GhQrDg?=
 =?us-ascii?Q?jvtgD7mShwk27va2cEJ3JCkLX5ivxrkpMvMuY2GXD/vXxElyAHZVlbdmUDxo?=
 =?us-ascii?Q?T5HQVNC1Hy1GGO2pWpw7pA6Idjf7PpAcITdRaLZwaxpIlpWCZbQ/l+TpdL+C?=
 =?us-ascii?Q?jjadLG8pGNKdURSlDEAZSAvanEGoGM4lNltDw943XTAAj/Vb71SpXd/kEHXg?=
 =?us-ascii?Q?sycRutnZmkjC6XnoP9g0VugCw9Q5CeXOkkymgbRo76N0T91OyssjrPiv0GBP?=
 =?us-ascii?Q?EGBDSYn3KIFGAv3UzzP9bE+jZRzcajI3GzuTO23EhiGabvag20nJduHRtPGR?=
 =?us-ascii?Q?E8cJRhuFgn3nSBtf8dH31vUoEqGexrcegE0faHKVrksKUDUQkV3puMDP0tsr?=
 =?us-ascii?Q?R+0MlvyTiHBGCW95cIU6amH5z3yfpprr5MEg1IuJnHN/3jsJAGLeFugDoPtg?=
 =?us-ascii?Q?CGTQExh9K9CQzTSLE2E1X7GG9s4ZXKkQyQhO57it?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f8f88c-9d10-4e7d-99f4-08de06e346f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2025 03:23:55.1105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HZqDgEqxrY4viOtwVPDdG1RRL7/eWxEBj2ZU1NKjqVbPo7zr0dvYHbqO3Xgu2F2pm9LqRN+3+Y2NybrAlEdD/xJ2X0BRF2WBIJWccooJwtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6350
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

Hi Thomas,

> Subject: [PATCH] drm/virtgpu: Use vblank timer
>=20
> Use a vblank timer to simulate the vblank interrupt. The DRM vblank
> helpers provide an implementation on top of Linux' hrtimer. Virtgpu
> enables and disables the timer as part of the CRTC. The atomic_flush
> callback sets up the event. Like vblank interrupts, the vblank timer
> fires at the rate of the display refresh.
>=20
> Most userspace limits its page flip rate according to the DRM vblank
> event. Virtgpu's virtual hardware does not provide vblank interrupts, so
> DRM sends each event ASAP. With the fast access times of virtual display
> memory, the event rate is much higher than the display mode's refresh
> rate; creating the next page flip almost immediately. This leads to
> excessive CPU overhead from even small display updates, such as moving
> the mouse pointer.
>=20
> This problem affects virtgpu and all other virtual displays. See [1] for
> a discussion in the context of hypervdrm.
When running Virtio-gpu with some of the UIs (gtk, spice, etc) in Qemu, the
Guest display updates are synchronized with a timer (or repaint callback in
the case of Gtk) the UI layer provides particularly when blob=3Dtrue. In ot=
her
words, the Guest's atomic commit does not complete until the Host signals
(via a fence) that the update (or flush) is done.

This is because when blob=3Dtrue, the Guest's FB is accessed by the Host wi=
thout
making any copies. So, to avoid tearing, the Guest needs to be prevented fr=
om
accessing its FB until the Host is done. Therefore, I think for virtio-gpu,=
 the virtual
vblank timer can only be helpful when blob=3Dfalse as this is the only case=
 where
Guest's display updates are unbounded (and Host makes a copy of the Guest's=
 FB).

I am not sure how this would affect virgl use-cases but Dmitry can help exp=
lain if
the vblank timer would be useful there or not.

Thanks,
Vivek

>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://lore.kernel.org/dri-
> devel/SN6PR02MB415702B00D6D52B0EE962C98D46CA@SN6PR02MB4157.n
> amprd02.prod.outlook.com/ # [1]
> ---
>  drivers/gpu/drm/virtio/virtgpu_display.c | 29 ++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c
> b/drivers/gpu/drm/virtio/virtgpu_display.c
> index c3315935d8bc..ee134e46eeba 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> @@ -32,6 +32,8 @@
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> +#include <drm/drm_vblank.h>
> +#include <drm/drm_vblank_helper.h>
>=20
>  #include "virtgpu_drv.h"
>=20
> @@ -55,6 +57,7 @@ static const struct drm_crtc_funcs virtio_gpu_crtc_func=
s
> =3D {
>  	.reset                  =3D drm_atomic_helper_crtc_reset,
>  	.atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_state,
>  	.atomic_destroy_state   =3D drm_atomic_helper_crtc_destroy_state,
> +	DRM_CRTC_VBLANK_TIMER_FUNCS,
>  };
>=20
>  static const struct drm_framebuffer_funcs virtio_gpu_fb_funcs =3D {
> @@ -99,6 +102,7 @@ static void virtio_gpu_crtc_mode_set_nofb(struct
> drm_crtc *crtc)
>  static void virtio_gpu_crtc_atomic_enable(struct drm_crtc *crtc,
>  					  struct drm_atomic_state *state)
>  {
> +	drm_crtc_vblank_on(crtc);
>  }
>=20
>  static void virtio_gpu_crtc_atomic_disable(struct drm_crtc *crtc,
> @@ -108,6 +112,8 @@ static void virtio_gpu_crtc_atomic_disable(struct
> drm_crtc *crtc,
>  	struct virtio_gpu_device *vgdev =3D dev->dev_private;
>  	struct virtio_gpu_output *output =3D
> drm_crtc_to_virtio_gpu_output(crtc);
>=20
> +	drm_crtc_vblank_off(crtc);
> +
>  	virtio_gpu_cmd_set_scanout(vgdev, output->index, 0, 0, 0, 0, 0);
>  	virtio_gpu_notify(vgdev);
>  }
> @@ -121,9 +127,10 @@ static int virtio_gpu_crtc_atomic_check(struct
> drm_crtc *crtc,
>  static void virtio_gpu_crtc_atomic_flush(struct drm_crtc *crtc,
>  					 struct drm_atomic_state *state)
>  {
> -	struct drm_crtc_state *crtc_state =3D
> drm_atomic_get_new_crtc_state(state,
> -									  crtc);
> +	struct drm_device *dev =3D crtc->dev;
> +	struct drm_crtc_state *crtc_state =3D
> drm_atomic_get_new_crtc_state(state, crtc);
>  	struct virtio_gpu_output *output =3D
> drm_crtc_to_virtio_gpu_output(crtc);
> +	struct drm_pending_vblank_event *event;
>=20
>  	/*
>  	 * virtio-gpu can't do modeset and plane update operations
> @@ -133,6 +140,20 @@ static void virtio_gpu_crtc_atomic_flush(struct
> drm_crtc *crtc,
>  	 */
>  	if (drm_atomic_crtc_needs_modeset(crtc_state))
>  		output->needs_modeset =3D true;
> +
> +	spin_lock_irq(&dev->event_lock);
> +
> +	event =3D crtc_state->event;
> +	crtc_state->event =3D NULL;
> +
> +	if (event) {
> +		if (drm_crtc_vblank_get(crtc) =3D=3D 0)
> +			drm_crtc_arm_vblank_event(crtc, event);
> +		else
> +			drm_crtc_send_vblank_event(crtc, event);
> +	}
> +
> +	spin_unlock_irq(&dev->event_lock);
>  }
>=20
>  static const struct drm_crtc_helper_funcs virtio_gpu_crtc_helper_funcs =
=3D {
> @@ -356,6 +377,10 @@ int virtio_gpu_modeset_init(struct virtio_gpu_device
> *vgdev)
>  	for (i =3D 0 ; i < vgdev->num_scanouts; ++i)
>  		vgdev_output_init(vgdev, i);
>=20
> +	ret =3D drm_vblank_init(vgdev->ddev, vgdev->num_scanouts);
> +	if (ret)
> +		return ret;
> +
>  	drm_mode_config_reset(vgdev->ddev);
>  	return 0;
>  }
> --
> 2.51.0
>=20

