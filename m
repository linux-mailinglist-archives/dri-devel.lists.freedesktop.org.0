Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B9D9F37A1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 18:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A46B610E1CE;
	Mon, 16 Dec 2024 17:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S+2/Pv9U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814C210E724
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 17:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734370524; x=1765906524;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IFjzVAkSoAIRWOlxigfmX5D/BWOMZ+mNeeTRuQYB/UE=;
 b=S+2/Pv9UNi2NjHucSbnTFon3z7BKcsp2S4nwbIl8yjwu92BrPkWuw5E6
 ym7G7SwW8aSpwpmy14FVxUIlQMZad1kppKlnVQi9zu/oAwcQ8/oNVG7VP
 UDtsYSrYTZNTdeXWDvTr0dgVLKD0Ly8b8LJOv7eHbfJVwjZ8mPKW/a1z9
 KShK3VdJeNOLBxa59Nnv6U+tUcGus/+fP/Lv5SlMGA0c/yokzE/lW1iQU
 ApQQWUvID/BCdhQZk5Bo5kari7DfddKw1zGFfqbQlq81DyT1q/xSdVkxZ
 uy8XQF6rqo72CYXgKK5Fu9w889/Ctsl1DmDgd+RSBp8XrtL3x8K2WOuLJ A==;
X-CSE-ConnectionGUID: osP2WJwbRRCtLs2vFOgvQw==
X-CSE-MsgGUID: Fh5uaQ7lQxqlXXiG/xT/ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="52180084"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; d="scan'208";a="52180084"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 09:35:24 -0800
X-CSE-ConnectionGUID: O5qOfO+0QESq7u6LocYu7A==
X-CSE-MsgGUID: tp2VlcRmR02eubmICprn4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; d="scan'208";a="128070821"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Dec 2024 09:35:22 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 16 Dec 2024 09:35:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 16 Dec 2024 09:35:21 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 16 Dec 2024 09:35:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eNqSGPMCbJ+BqSGqYb3TmKh7OfLftZhpmv3jb98Q+YmRfdaG1FrL08S6v2fw74+af9KLSUWqok6ueXMQnhyjqOIdWpwUIMDBGKqTRcT9Zt4+QefUfOCeqtBGiCLTEzfsJqZfBf3VyaAGIjQr9EM/D3bY6Yd/vK36IGUptDp0cYI4tbtreDroDzMZiCStZMqd5wQ1dN/yUIoihCSDGwEJNIQVWNtSYz/at+IRgsZN3neWX9tQ20nTzoNirS63BG8T0NgCr3m4KchMrqRLrrCV1X7aHEdFXvN/ApepD91Ie1yiD5GefS0RBQqSiSy+YqscYCCziGgpfLRuqsjzvAsv2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFjzVAkSoAIRWOlxigfmX5D/BWOMZ+mNeeTRuQYB/UE=;
 b=yTQfL8oEIKY8pDf26jwGDz14nIT0OTG5LImMh0M0TVNa4zzilk4baRE3o2jqRNgZwW5vhSOqtnpRHRhRkfX69QbDrQulPtBCBCFk5b+SmarrxTuI1jB2axrKAupZ0LWO8KvXPVmMpQwBhSj1w9k4X3Q1OfLyk/9cEtoqeP236bsGikBtHBokVbIXMIpkBvkUtJMMe/XrwC1jeF43JUJSr6FrHgWB87nrQNGIFpCAO3vnqL1XBcQSrkaG4kTa2CJZHGV4m0SmzOysJconYgFo9L5Ucm+Owa2557kUu/txu/rPwniD9KsPi8ULoHNvN2jAaC4i4Hg6Ih/YrsrFyplczg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SN7PR11MB8264.namprd11.prod.outlook.com (2603:10b6:806:26c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Mon, 16 Dec
 2024 17:34:51 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 17:34:50 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Wei Lin Guay <wguay@fb.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>
CC: "jgg@nvidia.com" <jgg@nvidia.com>, "dagmoxnes@meta.com"
 <dagmoxnes@meta.com>, "kbusch@kernel.org" <kbusch@kernel.org>,
 "nviljoen@meta.com" <nviljoen@meta.com>, Wei Lin Guay <wguay@meta.com>, "Oded
 Gabbay" <ogabbay@kernel.org>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, "Leon
 Romanovsky" <leon@kernel.org>, Maor Gottlieb <maorg@nvidia.com>
Subject: RE: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Thread-Topic: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Thread-Index: AQHbT6PDX5zn/QnJaEWuVZ9mA55H2rLpHa5A
Date: Mon, 16 Dec 2024 17:34:50 +0000
Message-ID: <IA0PR11MB7185FDD56CFDD0A2B8D21468F83B2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20241216095920.237117-1-wguay@fb.com>
In-Reply-To: <20241216095920.237117-1-wguay@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SN7PR11MB8264:EE_
x-ms-office365-filtering-correlation-id: 4811e28d-570c-4022-4246-08dd1df7f1ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?M1gyOHA5UmNyM2FXTlVkeXl4ZXovaGNXUStqTXRUOWNWVVJrK3dvN3FJcEEv?=
 =?utf-8?B?cmtML3dTdEhzUWUwWmIwTE1sS0lyYWVRZjcxY3c2QWp4QlY3cnFIZVRZOXJr?=
 =?utf-8?B?ZUxKTHZJRlZzcUViS2E2dTdSMTJQd0pSOTVSUU5xUzREZzZxYTNFVUJoUHpK?=
 =?utf-8?B?MUhxd3NtUFRvRXhSRlF6M1dsVGp0SFM1RGp1dVJ5VnVMb1ZrZThBU1kxdDc3?=
 =?utf-8?B?VHR5UVlmbFRMNWUzSFVWczVhanhRaEtIbDJhcnhMUTJubEJSbDVMWEIzSTV5?=
 =?utf-8?B?RE5JeVNkOHhpYkhYeVd6UHVBZHQrV01KZGl1YXJJQ1NjcFAzd1pnNVFJcVBN?=
 =?utf-8?B?YzFRQ1ltY0F0SG9kbzh2RnpSZGhIdFY0Y3RWQUtjNVFxeWlIbGdwK2RaVHZD?=
 =?utf-8?B?dmRIOXRSN1Q3dC9BaFNMZFJWMmFjSklRK01ZWGJTM2VmazhHMitsUGJka25k?=
 =?utf-8?B?Szd6bit4eEZnaXV3VlVadEp5WWFyTGdSSUx0em8zRUhEaG1OVFprelBSYXdJ?=
 =?utf-8?B?K3Fjd255dVltMTdmeER0NWRwdE5uOE51WVdTMm95cHRUaEVQRXBpTEFRVFhK?=
 =?utf-8?B?aU1STisyT1IxdCs0VmpobDV4TGVXQW1DaHcvdTY1RDhJWEovblpYTjBSQmNG?=
 =?utf-8?B?TDd3VjN3QVQ0MkV6OCtXK29pbUEyZThiZGxmc2I2clAvcjVkcm9BUUVYNE15?=
 =?utf-8?B?SSsySDVTSzgvdm5GSG5vb3huN0YveHVEbitXT090S1FSNWxUUkUrb3IwM3FH?=
 =?utf-8?B?R2pWSUg1QTBUdVZpdUh3UzZuK05Tbk5keHgwYmU4WG8zRWltd0xieGM0WXlU?=
 =?utf-8?B?M2tkZnFXV3FXdFVwZHBjTitwM0JQNUo1Q3M3aUVsVFRzVjdzQ01IUHNhOW5t?=
 =?utf-8?B?SlVxTVlTUWVkUjRQTnUzL1hrWVBBUjdOeUNhSEZxUDFvUDhiRGhWejlFR0xB?=
 =?utf-8?B?b3JFeXF6Ymw2TG5jSlZTL3psTmxGZGV2dWRqSHZNakdpdEluUmhHZVRYR0w0?=
 =?utf-8?B?OWtoRnNiL2pMYUpodU03UzVDaVR5NVRXMCsvQ3RvUGpiNFFMLzdRT1ZYc09W?=
 =?utf-8?B?VnpYSjRIaXNjOVZnZ3F3MGppd3lzVEFxSTRJWk9jcEQybytyRXBlTWJMZW5m?=
 =?utf-8?B?S2ZpbUR5WXVVUmV1cTlVTWQ3bSt2SGZPckdnWjRXd3U5OHpram1Ocyt2c3Bz?=
 =?utf-8?B?WlJ5TDZyWjFqV3MxL3FnS21kKzgzZnJyblAwVzhXc1BIN2VDSnhhOVZIUWxz?=
 =?utf-8?B?Ny9GcFg1MkdMSU9NRjVIcHBvTGI1dHJ1a1lxaHFBNEFlcGhsamhCNUtVOUlv?=
 =?utf-8?B?cytXeXlIb01va3EwMlZ4d08yY08wUURYdGRIbElMalhVREJyaTdycDNrbWRs?=
 =?utf-8?B?S2E2NkxHN3N0aFc0bG5xVkYwMG5Pd1dHZk16ckRZWmRpdm9nU0d6Z29uZW4w?=
 =?utf-8?B?TDZ5WVltYmxxd20zcjU0MVNXUER2UnF0Z25FNUpPUkFMLzVXU1ZDNm4vR2ll?=
 =?utf-8?B?WGtwZ0Fxb2o2SVlBdnZvQ2VZY2tuOS9TM3YyTUxxVy9JOStDZDZrS0gvbWVN?=
 =?utf-8?B?WWJuVlZBWlc4UVN6dEpuMmJBZG9BTGtIREQzVVFpRUMydjBrNTZhbDFWTCsr?=
 =?utf-8?B?cExuZVpWZ0V5UGVXQzdEVTlVQjRIOTdJT0NaTllKVnYvWWJJYTJ2UFljMU15?=
 =?utf-8?B?OXluRlR6VlR0NzZncTNONXhGeFFHQlpqWmRQQnJVQW1QYmxDelZxVUpBNHVa?=
 =?utf-8?B?STNUSWtBT0tSNDZ0cGlOcElaRWZVQXFydEp3K0lvbFAwcHZta2xYMHNnWWcr?=
 =?utf-8?B?UkRJaFE3dmIrVVhRSDFtcFBkeGNaYlNLQ051d3lwOURLL0tFdmRNSmFLRVcz?=
 =?utf-8?B?VGZLVG5HU3Y2aHpQQWlLa2lMVFFEOHJmT3hVdlN5WU84b1dEeVNHZVZlY081?=
 =?utf-8?Q?5U5Gq75KPgdrDtpYy0plgh4pbRo63bON?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VkNHblF1eHl3MHdyUzhBNHZ6Y2xmZHFrZGdCczVjRXM2Z3QxWHJqbk5FQ0d6?=
 =?utf-8?B?ZGt1RHVwL2phRnRsVDFwVDNoN2N0MzdDUm4xbnpKYjQxQ2VnMjJXVnFoNjVl?=
 =?utf-8?B?WGRBczVibEFBeFd3ekk4OVJ6K21MZ1Y0anFETnRjVVBSenRXMkJManhoTXpE?=
 =?utf-8?B?dDBEc09ZdnVXbFBBTEhJYWhOb1Zkb29QSzNyWUJkVGRDTlBCc3pucUxvODJk?=
 =?utf-8?B?VmhicGxiaWF0UjRGSm9yWHZTM1lSYVhsMWYxNEUxbmNUUklhQm55Z2UxelJ2?=
 =?utf-8?B?Qk9HZTNkWGhXQTZuMkFyNmFoeWpPVjFBQzd4Q3NxOCt1bHZ5clU5QkpaRUtD?=
 =?utf-8?B?VnZWek5SYTlpaUZKVGdZOUdFQ00zNGZIKzBpVzRlTWZENFlGVW1rSnJKak84?=
 =?utf-8?B?MUJYM0xzY0gzNmVEN1RjR2JmSkQ3b1FFeXhGbjRERVM0dHNMaEI2Wi9xQTFU?=
 =?utf-8?B?cmt0Zk93RkNTcTh3aVB3bWpteFE3NkFsc3FGRER5Mjc2NDM1QVlneDR4SFQv?=
 =?utf-8?B?WG9CUnhESEp4bWcvZGx0QUdoWEZ4WUovZTFNN1BWSW51UVlCT1h0YTdvM1l2?=
 =?utf-8?B?RTlmVXBjcE9VOThDelVkQjl1MWFRTVBzem0rOGVWdkJ6VHZORVo1WVFVY0ZC?=
 =?utf-8?B?T2tzOGhJb01VOEZzSVBYQ01PU0JtUmlrT21sNzN5ZG0zQWpGMWd5cW1MTW1h?=
 =?utf-8?B?a2NFZU9pQzZHM2NlQmF5aDZiMnQ1TjFHZjIwRCtBWWNoNnNkR2o4YVlodDJ2?=
 =?utf-8?B?RGtONGhCeVIvcXc2SnRoNW1waEFoTEw3Z0NjcXM2RUxsbHV0eVY2Wk5GczlE?=
 =?utf-8?B?S2hnMmx1K1Y4a25SeWdlZzNDK2F2bGdnb0dsUk1hcVFQZlB2ZWh2R3hEYmNZ?=
 =?utf-8?B?L1lHUVZwK1BaMWpyOWV1RGd6V20zbU1RdHM4SHdVY1k5bi8wQkxDK0dTMUtn?=
 =?utf-8?B?dkc2aEJFdlFpN1llTUFDRjl0RHd3eE4yY2RrK3pQNHZVVEYxL0dkcThOZjRz?=
 =?utf-8?B?eGI0WEUyY2NITEJ0K29UNWpidFVHRmtJaHgrLzArcjZvS0hsR0hWYmw0QTJo?=
 =?utf-8?B?MmZpOWVSeHNNdFNmMU5pWENaSmNhcjN4bjRyLzBKblFJMGNDMkVrbjc0Vjg2?=
 =?utf-8?B?UzB5OUtjenc0ZXdtS1JLY0U2QTNBWGFqY0ZkYzE2TG5BejdibG5BR2M5Y04x?=
 =?utf-8?B?NWcwU05zRzF2Q2p3TkxsU1pGT2xPUGJCYUdWT05zdTdpa1kyZUUvZVJZLzhO?=
 =?utf-8?B?QVVsRmF5T0FCWXg3a3k1dnVGNm5vM2ErSkxGTUhCUXpHMXptUFl0R2ZuRjdi?=
 =?utf-8?B?NXNCTndrSWJjM3BrbzhpRkpyMU93WnVpMkZ1ckpuS1o5RVJOVFBGUnVnQldn?=
 =?utf-8?B?a09SbGdVeXBOSjNWNEZXZStldERqaUloL3pJdDd3Q3dsT2d5cjB6ZmU4UzNh?=
 =?utf-8?B?dmhRWE1haUVBc3NHT1VZMFlrTE5NbThhdmlXa2g4Y0dSYkpidkxUbkI0UmZq?=
 =?utf-8?B?MEJEcERSZTdpaVUrYzRIWXBVWmFYV053b25tOTVLWjhkQmpQM3RMR1ZSdlVE?=
 =?utf-8?B?WVFxVk02V2FnMnV3QXN2b3V5cEtON1FJVENKUitRdUFFOWpTUEFLb0ZjUFdW?=
 =?utf-8?B?VWVTRlVoVW0zM1dZeCtjT0NxSHJkNzVOdEg1L0RMNTBJMnI0TzY2SEZZTVR2?=
 =?utf-8?B?aWZ3RmlBYlVqN2g3UzMxaFVsTUloT25Bb2pobXVhMURiWEhMbTRrai8zTmhT?=
 =?utf-8?B?b0FPanBXSXh6VDZBY3hPekdGNXRvWUY1ZER3bHpkQVJuaFF3aXJ0UXcrR1F1?=
 =?utf-8?B?L092REhTY1ZCcDFzUklMbDk4akJKYVV6SzdldlhjOXBJeUUzY1dhc0lQUlFY?=
 =?utf-8?B?Nk1wdHFjMlRUVlo3cWdPV05uZDNPcG51Z2dlL01wU1BjQmNtaHpPWDRlek1p?=
 =?utf-8?B?Z2RYeVluQ01yVTJDUzFvRUhuODJramxXNGNTWjBzNk8zK21YZk9Rb1Zoc2Nk?=
 =?utf-8?B?M1JnakJqdy84V2Z5MG5jbllqdFROdVA4cm9TMUpjQTg5NENiMjFCL2RkVGl6?=
 =?utf-8?B?U2U3WDhOT2UzaTNxWUc2QVF3c2lRYk5vUE9KeEhWaTRBTEhoS2ZwWkVib0tw?=
 =?utf-8?Q?y4imavIG8RpYqZrvw1tcXObl5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4811e28d-570c-4022-4246-08dd1df7f1ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2024 17:34:50.8678 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M7lSVb1etNZGLDgP23oL+zVeAepSOGFjnGML1hXd18/JIg7GQy1XBrM051vnkDk1j/tCxXH4ANkYKtWcrhygIB1Werlp5B3BmJOeuwKMuMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8264
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

SGkgV2VpIExpbiwNCg0KPiBTdWJqZWN0OiBbUEFUQ0ggMC80XSBjb3Zlci1sZXR0ZXI6IEFsbG93
IE1NSU8gcmVnaW9ucyB0byBiZSBleHBvcnRlZA0KPiB0aHJvdWdoIGRtYWJ1Zg0KPiANCj4gRnJv
bTogV2VpIExpbiBHdWF5IDx3Z3VheUBtZXRhLmNvbT4NCj4gDQo+IFRoaXMgaXMgYW5vdGhlciBh
dHRlbXB0IHRvIHJldml2ZSB0aGUgcGF0Y2hlcyBwb3N0ZWQgYnkgSmFzb24NCj4gR3VudGhvcnBl
IGFuZCBWaXZlayBLYXNpcmVkZHksIGF0DQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cHJvamVjdC9saW51eC1tZWRpYS9jb3Zlci8wLXYyLQ0KPiA0NzI2MTViMzg3N2UrMjhmNy12Zmlv
X2RtYV9idWZfamdnQG52aWRpYS5jb20vDQo+IGh0dHBzOi8vbHduLm5ldC9BcnRpY2xlcy85NzA3
NTEvDQp2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsLzIwMjQwNjI0MDY1NTUy
LjE1NzI1ODAtMS12aXZlay5rYXNpcmVkZHlAaW50ZWwuY29tLw0KYWRkcmVzc2VzIHJldmlldyBj
b21tZW50cyBmcm9tIEFsZXggYW5kIEphc29uIGFuZCBhbHNvIGluY2x1ZGVzIHRoZSBhYmlsaXR5
DQp0byBjcmVhdGUgdGhlIGRtYWJ1ZiBmcm9tIG11bHRpcGxlIHJhbmdlcy4gVGhpcyBpcyByZWFs
bHkgbmVlZGVkIHRvIGZ1dHVyZS1wcm9vZg0KdGhlIGZlYXR1cmUuDQoNCkFsc28sIG15IHVuZGVy
c3RhbmRpbmcgaXMgdGhhdCB0aGlzIHBhdGNoc2V0IGNhbm5vdCBwcm9jZWVkIHVudGlsIExlb24n
cyBzZXJpZXMgaXMgbWVyZ2VkOg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcva3ZtL2NvdmVyLjE3
MzMzOTg5MTMuZ2l0Lmxlb25Aa2VybmVsLm9yZy8NCg0KDQpUaGFua3MsDQpWaXZlaw0KDQo+IA0K
PiBJbiBhZGRpdGlvbiB0byB0aGUgaW5pdGlhbCBwcm9wb3NhbCBieSBKYXNvbiwgYW5vdGhlciBw
cm9taXNpbmcNCj4gYXBwbGljYXRpb24gaXMgZXhwb3NpbmcgbWVtb3J5IGZyb20gYW4gQUkgYWNj
ZWxlcmF0b3IgKGJvdW5kIHRvIFZGSU8pDQo+IHRvIGFuIFJETUEgZGV2aWNlLiBUaGlzIHdvdWxk
IGFsbG93IHRoZSBSRE1BIGRldmljZSB0byBkaXJlY3RseSBhY2Nlc3MNCj4gdGhlIGFjY2VsZXJh
dG9yJ3MgbWVtb3J5LCB0aGVyZWJ5IGZhY2lsaXRhdGluZyBkaXJlY3QgZGF0YQ0KPiB0cmFuc2Fj
dGlvbnMgYmV0d2VlbiB0aGUgUkRNQSBkZXZpY2UgYW5kIHRoZSBhY2NlbGVyYXRvci4NCj4gDQo+
IEJlbG93IGlzIGZyb20gdGhlIHRleHQvbW90aXZhdGlvbiBmcm9tIHRoZSBvcmdpbmFsIGNvdmVy
IGxldHRlci4NCj4gDQo+IGRtYS1idWYgaGFzIGJlY29tZSBhIHdheSB0byBzYWZlbHkgYWNxdWly
ZSBhIGhhbmRsZSB0byBub24tc3RydWN0IHBhZ2UNCj4gbWVtb3J5IHRoYXQgY2FuIHN0aWxsIGhh
dmUgbGlmZXRpbWUgY29udHJvbGxlZCBieSB0aGUgZXhwb3J0ZXIuIE5vdGFibHkNCj4gUkRNQSBj
YW4gbm93IGltcG9ydCBkbWEtYnVmIEZEcyBhbmQgYnVpbGQgdGhlbSBpbnRvIE1ScyB3aGljaCBh
bGxvd3MNCj4gZm9yDQo+IFBDSSBQMlAgb3BlcmF0aW9ucy4gRXh0ZW5kIHRoaXMgdG8gYWxsb3cg
dmZpby1wY2kgdG8gZXhwb3J0IE1NSU8gbWVtb3J5DQo+IGZyb20gUENJIGRldmljZSBCQVJzLg0K
PiANCj4gVGhpcyBzZXJpZXMgc3VwcG9ydHMgYSB1c2UgY2FzZSBmb3IgU1BESyB3aGVyZSBhIE5W
TWUgZGV2aWNlIHdpbGwgYmUgb3duZWQNCj4gYnkgU1BESyB0aHJvdWdoIFZGSU8gYnV0IGludGVy
YWN0aW5nIHdpdGggYSBSRE1BIGRldmljZS4gVGhlIFJETUEgZGV2aWNlDQo+IG1heSBkaXJlY3Rs
eSBhY2Nlc3MgdGhlIE5WTWUgQ01CIG9yIGRpcmVjdGx5IG1hbmlwdWxhdGUgdGhlIE5WTWUgZGV2
aWNlJ3MNCj4gZG9vcmJlbGwgdXNpbmcgUENJIFAyUC4NCj4gDQo+IEhvd2V2ZXIsIGFzIGEgZ2Vu
ZXJhbCBtZWNoYW5pc20sIGl0IGNhbiBzdXBwb3J0IG1hbnkgb3RoZXIgc2NlbmFyaW9zIHdpdGgN
Cj4gVkZJTy4gSSBpbWFnaW5lIHRoaXMgZG1hYnVmIGFwcHJvYWNoIHRvIGJlIHVzYWJsZSBieSBp
b21tdWZkIGFzIHdlbGwgZm9yDQo+IGdlbmVyaWMgYW5kIHNhZmUgUDJQIG1hcHBpbmdzLg0KPiAN
Cj4gVGhpcyBzZXJpZXMgZ29lcyBhZnRlciB0aGUgIkJyZWFrIHVwIGlvY3RsIGRpc3BhdGNoIGZ1
bmN0aW9ucyB0byBvbmUNCj4gZnVuY3Rpb24gcGVyIGlvY3RsIiBzZXJpZXMuDQo+IA0KPiB2MjoN
Cj4gIC0gTmFtZSB0aGUgbmV3IGZpbGUgZG1hX2J1Zi5jDQo+ICAtIFJlc3RvcmUgb3JpZ19uZW50
cyBiZWZvcmUgZnJlZWluZw0KPiAgLSBGaXggcmV2ZXJzZWQgbG9naWMgYXJvdW5kIHByaXYtPnJl
dm9rZWQNCj4gIC0gU2V0IHByaXYtPmluZGV4DQo+ICAtIFJlYmFzZWQgb24gdjIgIkJyZWFrIHVw
IGlvY3RsIGRpc3BhdGNoIGZ1bmN0aW9ucyINCj4gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMC12MS05ZTZlMTczOWVkOTUrNWZhLQ0KPiB2ZmlvX2RtYV9idWZfamdnQG52aWRpYS5jb20N
Cj4gQ2M6IGxpbnV4LXJkbWFAdmdlci5rZXJuZWwub3JnDQo+IENjOiBPZGVkIEdhYmJheSA8b2dh
YmJheUBrZXJuZWwub3JnPg0KPiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPg0KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4N
Cj4gQ2M6IExlb24gUm9tYW5vdnNreSA8bGVvbkBrZXJuZWwub3JnPg0KPiBDYzogTWFvciBHb3R0
bGllYiA8bWFvcmdAbnZpZGlhLmNvbT4NCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4gU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbnZpZGlhLmNvbT4N
Cj4gDQo+IEphc29uIEd1bnRob3JwZSAoMyk6DQo+ICAgdmZpbzogQWRkIHZmaW9fZGV2aWNlX2dl
dCgpDQo+ICAgZG1hLWJ1ZjogQWRkIGRtYV9idWZfdHJ5X2dldCgpDQo+ICAgdmZpby9wY2k6IEFs
bG93IE1NSU8gcmVnaW9ucyB0byBiZSBleHBvcnRlZCB0aHJvdWdoIGRtYS1idWYNCj4gDQo+IFdl
aSBMaW4gR3VheSAoMSk6DQo+ICAgdmZpby9wY2k6IEFsbG93IGV4cG9ydCBkbWFidWYgd2l0aG91
dCBtb3ZlX25vdGlmeSBmcm9tIGltcG9ydGVyDQo+IA0KPiAgZHJpdmVycy92ZmlvL3BjaS9NYWtl
ZmlsZSAgICAgICAgICB8ICAgMSArDQo+ICBkcml2ZXJzL3ZmaW8vcGNpL2RtYV9idWYuYyAgICAg
ICAgIHwgMjkxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICBkcml2ZXJzL3ZmaW8v
cGNpL3ZmaW9fcGNpX2NvbmZpZy5jIHwgICA4ICstDQo+ICBkcml2ZXJzL3ZmaW8vcGNpL3ZmaW9f
cGNpX2NvcmUuYyAgIHwgIDQ0ICsrKystDQo+ICBkcml2ZXJzL3ZmaW8vcGNpL3ZmaW9fcGNpX3By
aXYuaCAgIHwgIDMwICsrKw0KPiAgZHJpdmVycy92ZmlvL3ZmaW9fbWFpbi5jICAgICAgICAgICB8
ICAgMSArDQo+ICBpbmNsdWRlL2xpbnV4L2RtYS1idWYuaCAgICAgICAgICAgIHwgIDEzICsrDQo+
ICBpbmNsdWRlL2xpbnV4L3ZmaW8uaCAgICAgICAgICAgICAgIHwgICA2ICsNCj4gIGluY2x1ZGUv
bGludXgvdmZpb19wY2lfY29yZS5oICAgICAgfCAgIDEgKw0KPiAgaW5jbHVkZS91YXBpL2xpbnV4
L3ZmaW8uaCAgICAgICAgICB8ICAxOCArKw0KPiAgMTAgZmlsZXMgY2hhbmdlZCwgNDA1IGluc2Vy
dGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92
ZmlvL3BjaS9kbWFfYnVmLmMNCj4gDQo+IC0tDQo+IDIuNDMuNQ0K
