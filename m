Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7827E9092A8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 21:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DB810EE38;
	Fri, 14 Jun 2024 19:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y1PIMXdb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C6710E1DD;
 Fri, 14 Jun 2024 19:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718391691; x=1749927691;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MiB0Se7Y7dPePCQA6MrPmqXRG2frfi/YZvDbbns5tB8=;
 b=Y1PIMXdbFM+nS6SyYqmUqkS1yB7TPBc3G2h9lK5cFOK62Ue50u1vxov/
 79ncvo9Bf4bQo42IsT7OpBum62dfc5/36GcQXjw6w6wsBN/QCBtk/eHVN
 causv1WC2OgJvYZGxuJf06otM/ViO/7/m+orzP+e8P4y54YkwEYrMnVQD
 f7O47SfvExRoJKbawTiEJgm+I8072KgLhodgbSHmcJrRBk0BOdfCgNih3
 5/1bbjcqpyKWC/cEBq4xkwK4zkrTKfoP1pDmBSoSUWn1npuYI0JXu2BtO
 GyJeyqXvBFzJRVtjOS7E90y5EpQ8rf+vk1OdE7WUpXaY9BQm+OjxebWZ8 g==;
X-CSE-ConnectionGUID: nILRtfReQhCRlsWvDy0iRQ==
X-CSE-MsgGUID: f+EZrKQdTpqtcWhVu5OB2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="37818852"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="37818852"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 12:00:59 -0700
X-CSE-ConnectionGUID: N5eQA/sYRVGtjbpTITYN8w==
X-CSE-MsgGUID: YMYH6ubmRPOWzXGf0/qUmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="40694139"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jun 2024 12:00:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 12:00:57 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 12:00:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 12:00:57 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 12:00:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W15JrLhDRy9riOXKHVdoAfesOzroHgGqL5+hWhnInlrYCttBA6CDxTccCxBfzp+sYaMfp2ZldzGC8L49gZqCeIKuBhLIYAI16lOh8NfDYu6cnR8ICOwI47D1ERZ4QcvbgU+QQ226G8OB1VBrHtZAz5tOCHnmIZszCbazk1pbk7n1UBbBk3uftCDkWXIlxUVGF20qTEcxobnmN5Z1A0uEzr83opbxQUOf2QjaPMBmrQMhPMIUNLWFeP9uQiHXxKQhUtDA5SkumJb0MIxZgqr780YpOquwd+UCueonkTUA/gaUVE644GMl3bnr437jMteC/95Om7/bp1iBTy2o24ldYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oy6z+WdgHQ5+5+EGV9x5UP1EKVPAG1fpeQFKy8Xh3yk=;
 b=ePxdd1JjAzuD0KofSWFC8mQrqFX3V/UMf42w7V1x2QdU7zzvTkkRJfrR4pavrgRbYrbh9BfkvNxrHoXwutNqpKZ8eHK3FZvQC8TMoRA89nn2WXczPx5rDlzn6Yd08FHacKR+tiaVK5mKSuMn+YVAYD4ws+bWtRiSS/dit28dqcMOo6Hajqu//ecSDmGZNv23ycON4nDBVovoVUXUg4Thb5PiOCiWWKSrKG5+iRGxZx5qt7zS+y+ThkHrI2/5tlEKKXPyORgBsA2XoP4b6tfUhT5WdvjcWbRfeixCz/1dvRBk7MVMbt8aAIyQS3EL8nT9oHue1xzTdNjvRI9UIqI9ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.26; Fri, 14 Jun
 2024 19:00:55 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 19:00:55 +0000
Date: Fri, 14 Jun 2024 15:00:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>, Ville
 =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@intel.com>,
 <naveen1.kumar@intel.com>, <vandita.kulkarni@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <nouveau@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <kernel-dev@igalia.com>, Melissa Wen <mwen@igalia.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>, Simon Ser
 <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>,
 <daniel@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 'Marek
 =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>, Dave Airlie <airlied@gmail.com>, 
 <ville.syrjala@linux.intel.com>, Xaver Hugl <xaver.hugl@gmail.com>, "Joshua
 Ashton" <joshua@froggi.es>, Michel =?iso-8859-1?Q?D=E4nzer?=
 <michel.daenzer@mailbox.org>, Sam Ravnborg <sam@ravnborg.org>, "Boris
 Brezillon" <bbrezillon@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jani Nikula <jani.nikula@linux.intel.com>, Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v6 5/8] drm/i915: Enable async flips on the primary plane
Message-ID: <ZmyTYPTVKM2-iaaN@intel.com>
References: <20240614153535.351689-1-andrealmeid@igalia.com>
 <20240614153535.351689-6-andrealmeid@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240614153535.351689-6-andrealmeid@igalia.com>
X-ClientProxiedBy: SJ0PR05CA0191.namprd05.prod.outlook.com
 (2603:10b6:a03:330::16) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH8PR11MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: 66879827-de10-4ecd-cf14-08dc8ca45170
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|7416011|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?q0RukBeeVCS1I0q1RIGHcSuqouo4brfZnSOhk700Jtn+qr8aeIom0gAqQi?=
 =?iso-8859-1?Q?PQCLeciUUIlssJejEFa2t25S6TTgeFwzZ8fYdyW31N2kxOFC4TxKdrmG6x?=
 =?iso-8859-1?Q?6oEMa9bt8KmymXfc+2NcIibbrq5Kz4406ud3PO99iaQt67bynNLO4AXVNI?=
 =?iso-8859-1?Q?1EHxpALfBmpNUkiHrg7IeK6qyEDqFLB3UtwST8jtXWLdoRhnQh++jI4IKt?=
 =?iso-8859-1?Q?/Z0SjJTD5ESmV7O7Q1jyJTv0rSbopwIKD49GiKZxLeVI55xgjCSpSO127k?=
 =?iso-8859-1?Q?d90JPzXSu0o6ueYxAkKqrWbsfMvBOBZevhWEh6PNN4R8XkcpdViI+oXSPH?=
 =?iso-8859-1?Q?T1yRQKNVsRjiUFs8CS6+Gya73pew+CYEjNTcPEACS72lZUCYcS/qWUA9Zn?=
 =?iso-8859-1?Q?djukBnRpeFtoOjpg+9Cyclytws6f4mJtBMDvaEWnrF6J+yELRUf51Dpiwf?=
 =?iso-8859-1?Q?g7xZ9A//tATJOo7SeH64iTFmtWCWgxCV5KRbsOo7NCP7+WlOZkzoM7NrZP?=
 =?iso-8859-1?Q?oPJpwpoGXI7GXnhyDLxTDTXkmH6IrOc/noxR0X7cJ44pROu5XY6Pw4NNSL?=
 =?iso-8859-1?Q?Xnf3Rju+hSRgIyKarSjBEybEFunEfSTT8B88Q/04kD7XNkSW/yxB7Kk/Fp?=
 =?iso-8859-1?Q?4JIz1eDoxymthgwrBMncyGyl4AnDV0etf9rhAu0lf4N7uv9noZl/C4/6SD?=
 =?iso-8859-1?Q?M1wiHMB99lPdUmicprwVogmD8JZzUJE6HYg/wh+yCiujNXX/CHW3PwvjkM?=
 =?iso-8859-1?Q?iWO/exFWu7tyQW0uIk3lLff3WKg/PvNSrYF7gAHqNBPTDgFs6bmw9z6XAd?=
 =?iso-8859-1?Q?GmxOilSQiQtdEFUcuSEEXR5ReNsTCe5dfbddKty/PkL+ezmzU5hiCZ9Sl/?=
 =?iso-8859-1?Q?awQqXRoFjGeZxguvAXx81Z8xl+qyxdYje4EfJhpk7dMPdggss2qV+s2n5s?=
 =?iso-8859-1?Q?JBYKuv+8veRYf/hgH3rLuWoDF7DPBrUa8AHjHjzoRb8FaJPnrQ4/fFprI/?=
 =?iso-8859-1?Q?g5ALMk1rkvmoK/mVyt1FKKFjfKFsRbz7msNp8oRSoaZInR7kel4btvb6nB?=
 =?iso-8859-1?Q?OxFKhQ1cExulj7WtVKRgGdDMl30h90qrU9wpVdiYt6FVJmNdT0aTSPtkm6?=
 =?iso-8859-1?Q?nPF624ClexjI081OERldHZ/pSzCjaxEdc1dqF38Nqa/F3wlvVMfIkGFFQk?=
 =?iso-8859-1?Q?xsKXCU8H/AbhAfDy1x8yPK3oikYw9kUndQ38Fk5230TEtgr1ts7iwwcc2H?=
 =?iso-8859-1?Q?sFX8lwnEyqHrZB3HEyBk4eUm/Shg8Odg0b7rTWH7y3R0sj5IPBPnkVnqqB?=
 =?iso-8859-1?Q?bnfsbnnqW8I03rjkrZaECOCi2A4imzRA+ubZw4r6fthGt23iJ5pJmyEZWj?=
 =?iso-8859-1?Q?gW0C7XPQw4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(7416011)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?U2vPvixsM3jUid6CxzOmPz8k3DELRHgmFh0C7wTACjF1auKxKvtQ6SDrWr?=
 =?iso-8859-1?Q?hv5JuLGU7I81QzCJBwx7ntbOywxBaEBbXbLABvSntAJarPCGT8aJc9RLTo?=
 =?iso-8859-1?Q?/zauqM2a4XmWkH/WYynAMilYh3tI2udh73f6X8NTuEguojdy+AQeTKMrAl?=
 =?iso-8859-1?Q?hXjyUxlyZAh6fWlJhJr4gCykfE8WYgo/XJ94+E9s/noVnIzWinadv/E2wI?=
 =?iso-8859-1?Q?nlVMOerWm/xhyX5Ij+GNjUo37DAGoH3qvUawKTj5pS+muVXiyJDrcpAW03?=
 =?iso-8859-1?Q?oCb2WelwWWG41Bh5rnbwSbNDKaZ6ogf/gzXuzRRhcochH17d0Wet917IMw?=
 =?iso-8859-1?Q?Q61WV1ATVpVw8+f3mZdobvq1CDOYPnwX/YXjjLJaQbGrdL/ZrwPgyasKKn?=
 =?iso-8859-1?Q?fRNnvgbXaMiD8dUXYxhgYup6bk89QzKAOwCrojLuvZolddrbDOjwWn6Nnw?=
 =?iso-8859-1?Q?IlBFZE6AxhMyThTJwroBfp2B5Gx2iZ/vSeVWDy1ow7O2URaF7EURBAa4wA?=
 =?iso-8859-1?Q?Ij93KuxJm4SxgxrLJcrDWZIUqSPTBd8p60Xkes0G7I9n854RgyRSZs5+p2?=
 =?iso-8859-1?Q?C1OfKoxII0K76F6lOKe5me4P+Th/Jv/MvT1tBPjq2tJ6ka+05082BVGDhv?=
 =?iso-8859-1?Q?bTNlEA/i/Tjpi381C/qQvBaP9llkUqzOjVj21tcvOZg9AFMMqLCL56w8UY?=
 =?iso-8859-1?Q?OsKXW6s58yfDBgOx3B4Sy8KNuyd18gj6YkyhAxA5tiNCLJFYP3GbSj8g2d?=
 =?iso-8859-1?Q?f1A0H37YPCOLRCOi4HBST4jzP2GrHaDYZWCrFni+SgjRYtaboivkveN9Nr?=
 =?iso-8859-1?Q?BIxzQOZXoRZdSfo6ixrCop5WGLE7AxT1estocP5dFccRhOzwOV3kO91jGu?=
 =?iso-8859-1?Q?8pU2ga8JFIYt6P1wEWokbUdvHuILzJzTyqDIocRB06FUfs3Dd56F8VkPrY?=
 =?iso-8859-1?Q?AbNXjYBR0Fgq7Fv0lBNNCC4JpeIK/TG/IcCkklulEnbzVpEbceRjegcwOy?=
 =?iso-8859-1?Q?sBrC7NFv/wO6qLFuT75EVchGtb6j13v8ZYep7UGk1HW8U9Fz/za3Ej1eYk?=
 =?iso-8859-1?Q?BEq69AINU1zQ0EQW3z6wGmsX5ZNMWZ+lRTQh94QRNf2fret3Dl6olpiLfI?=
 =?iso-8859-1?Q?LydA14Ucdv9HWwFcf1Eu7FVhXKgYNir0PRK6JiCUrtempVljspW9a1Aa8X?=
 =?iso-8859-1?Q?lHH7j+0D8QBHBL8JyGUWFpqD/u1+RHjfSxg+B0joOd4lttARXT3gdq8xcw?=
 =?iso-8859-1?Q?l5C25KUqNVXXXtrQBScW1EKaX41ZFxbFovziqKKeKZ0HKD9tkJHUfKLt+W?=
 =?iso-8859-1?Q?4x7PAy6itjXvguGfBmyHn/ubNZerOsGjXZE1YvGy5eeiQozpBiL7AfdzO5?=
 =?iso-8859-1?Q?FXqNOmmbnRsDhPk5hCvJNVQs1FahexCxEoAWT5+KmTX3Jp0qEU1WPenjdc?=
 =?iso-8859-1?Q?4yn4obGVsc9PBnobR6U5TaRiyCnhKk4hUSNWZ2yt27ss8Lru9ydd8QnHMC?=
 =?iso-8859-1?Q?FMQ8Ju3wMs2vXC3QPvkb2sygOpn15eSmgkw5VYME+QQ/PtrZvJHKdzZWpg?=
 =?iso-8859-1?Q?I1GsU/j3hUrapRtjIQcYvmG1S6O8X89wVXva/y7Dy3Zh4ggz6ohbOt6cVV?=
 =?iso-8859-1?Q?I/wyoi10RFrBVHD7azQP+bajtmklx4Jf5c0S1TUMk5JAsu9D2Cu7s+zw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66879827-de10-4ecd-cf14-08dc8ca45170
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 19:00:55.1751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XDeOSjj3qBT7Pz9YOR9rtuEvX9J9Vh/CFhHfdRjn8twBK4p2UqxXYcoN+LTucNSznvpNYTKLWAomZfx2uHwU4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6753
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

On Fri, Jun 14, 2024 at 12:35:32PM -0300, André Almeida wrote:
> This driver can perfom async flips on primary planes, so enable it.
> 

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Naveen Kumar <naveen1.kumar@intel.com>
c: Vandita Kulkarni <vandita.kulkarni@intel.com>

> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>  drivers/gpu/drm/i915/display/i9xx_plane.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
> index 0279c8aabdd1..0142beef20dc 100644
> --- a/drivers/gpu/drm/i915/display/i9xx_plane.c
> +++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
> @@ -931,6 +931,9 @@ intel_primary_plane_create(struct drm_i915_private *dev_priv, enum pipe pipe)
>  
>  	intel_plane_helper_add(plane);
>  
> +	if (plane->async_flip)
> +		plane->base.async_flip = true;

I believe this is not enough and besides this we would also need to have
in the:
skl_universal_plane_create[2447] plane->async_flip = skl_plane_async_flip;

at: drivers/gpu/drm/i915/display/skl_universal_plane.c

> +
>  	return plane;
>  
>  fail:
> -- 
> 2.45.2
> 
