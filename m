Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2010BD3A7D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 16:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D153010E002;
	Mon, 13 Oct 2025 14:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gYlSz4em";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3716F10E002
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 14:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760366903; x=1791902903;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=pRXBfxQNCV7PWP8KJn6060ktq+fp7VgD99Xsxu3tRmA=;
 b=gYlSz4emnB/WiZewQPtD5VBmkw8AoTtAlsCFIm/4BF9FuppJaZk3DHr7
 5ZkfJPSDui1YAN5lJBWA5TynE1Q312wfs75281BNGt2XKvyuEB1vRy//f
 mrEuhso/jKp6nITDqehNIUffP9zkEA5YWtXO9ZUYo+2tqEbWHrsO5vz3A
 U8Ogy9iCAJj8hsLlTP8XB4QSMqs3LdMQSU7HpLX2OKqPoJtHK/7fuf36i
 GYFZzisblbsEl0pfNUfWtgg080GNOTCvOvY1Ij0/RvHSy8qAkyi+larps
 16dGb5GqIBbCD3yvFH8IkLjSgZ4ayfpWAe7dbVhsuoyJG6lyeQeA0vMkC g==;
X-CSE-ConnectionGUID: JM06ncgIQPiTjXrYJx4qUQ==
X-CSE-MsgGUID: GXbSRVMdSpa7Uk93/L2iHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73611409"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="73611409"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 07:48:22 -0700
X-CSE-ConnectionGUID: rfnEYyawQgigAHoAYTxRnQ==
X-CSE-MsgGUID: b7ol/VN3SgW5wAJRySkovQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="185875986"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 07:48:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 07:48:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 07:48:21 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.66) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 07:48:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0q8Rn6bw99uhsGwWrRdN05bC2FanXSAF4HQ2yPvc5sw3ebO+xr/46ON6BR9vkMulCNd/SUUZPLgN5CX8oIGzX0yKAIATM6BGNrec6jLJdMQrZphhF2XwF280NL/6RgFD5zWU3YO0TZ3afB6O0wPe0+GTiVjS2wL1/R/b6RaKJgQvn+6VJDR2fCIEcBt5Ep/rH+XPLTLcVJMvpvsp1LoElYAVz1TILBs/EJtwGuImrIHUe0JXuVjAS67frnk4+lH9CTeWVeHZObcp5DrgOIkz5VhMpOv2FiAXVEyqg4MImJ18L3bqtAxrVz+PD+xLdHGjdPjZyTw86Ffl1Ox04fD4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRXBfxQNCV7PWP8KJn6060ktq+fp7VgD99Xsxu3tRmA=;
 b=dtJRcIznU0ZRTOLgRYj4TpClK2KpCspLLQs9JDnzluRQerg3Fz2lx9FW8gxkvufANfDuNwb0xMSms+YUIYxTJbrOhZ/IQmmh4UA0n4KWMN1FY+nMBeFbsK202KBW8rXgBFrehWqnVpnl/+9O/zKjDk5oXYqxDd2Vihhh1TpiilQZfq0fWMcMrDF9NSvFoTx4MWYioF06HSD6tjx/IQ4+tB9R+4/6nf54SH11b8Y3qxB+kHubsph89iCZSmiYuT8/FfpzW1ZbO4cK8Msv3RgAdHU0HOKkbpXoaHH6S9FqdTljUdMVxMyTRvdVWujnpPtlLmotS+bJMUWGrQRtPo1sSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 14:48:18 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%2]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 14:48:18 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>
Subject: RE: [PATCH 2/2] dma-buf: improve sg_table debugging hack
Thread-Topic: [PATCH 2/2] dma-buf: improve sg_table debugging hack
Thread-Index: AQHcNsfJ8efePPkuakeFR9ObMuWRLbTAMWaA
Date: Mon, 13 Oct 2025 14:48:18 +0000
Message-ID: <IA1PR11MB64187AF0DC0A4A63D9930F54C1EAA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20251006134713.1846-1-christian.koenig@amd.com>
 <20251006134713.1846-2-christian.koenig@amd.com>
In-Reply-To: <20251006134713.1846-2-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|MW4PR11MB6911:EE_
x-ms-office365-filtering-correlation-id: 9c76ad72-20e5-4064-d8df-08de0a678c15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?elYrMFZEb2lGRjJKZnExbkFzNU95NTBXUC9LbnU0ZFBlZ25zMmpzMDd5UHBR?=
 =?utf-8?B?M1poVnhlbzU5emFlb1diM1FtbUtXVjg3ZGlGdUVNSWtDWlJ3dlZKRzV0c05F?=
 =?utf-8?B?dTJvemZndmpoWlZxT1pxRkJTS0wyWXBVUi9jUmdCc3BKbFBOc01HTCtMNDdm?=
 =?utf-8?B?M2o0K3lvYllBTkdvK2M3bzZIZzlSaHUrRUwycGQwL1BhaUhuU2Yyc2hoM01P?=
 =?utf-8?B?UzNsT1NLVFpMQ2ZhdXliVzdJM2dpTzVsekUxVFZxb3ZEYmcrQkZ6THFXRHNK?=
 =?utf-8?B?ZG80dm5pWkYwQVFSbFdJN2ZFY3dPYlVQeTdXMk9oWlExQXl6MnJlcE1mRVgx?=
 =?utf-8?B?N0R4U0xxM092WDEzM3huMXZ5R2VqYStGb3d2c0NWdHNoQ3I4RndmNVZENXRL?=
 =?utf-8?B?SnBKZ3JJMHpRbktKeG80c0k1YzBHUGhCNlBRbWJtNzlMM2d3R0MrdC9WaHRi?=
 =?utf-8?B?YklFQ2s0VHNoMTgzRGxYSXdEU21Tb09CVUJDZWZaQzdKZS9SN3dBRzcySlBv?=
 =?utf-8?B?aWVzWkxTTzBtWDQrQlV4UkhuYi9WSTkxZ1pEd3FyVWg5OXVpb2pnVW5WRHQr?=
 =?utf-8?B?SW1lT2xVOXc0S3VtUWVkSkh6bmFBUmt4bE1jTjM5QXlDTm5kSStGWDEzam5V?=
 =?utf-8?B?aGZHaHl4NnhBMHlsMVdpbWc1RWdYbkdrREdTcG9VQkNpVjU2YnFvdHd0WWlN?=
 =?utf-8?B?NElhcGwrTkE0UUhqcENnRTRvWDV1RFBzb2txR0wxUWQ5aUwvbElaQlRGT0c0?=
 =?utf-8?B?RWhzWEJCaCtDK0xEQ0Q1bldDc1RyT1k2bkFwVjF2Q0F2Q3U4QXIxRDJReW1v?=
 =?utf-8?B?K05RVDhSdUJ4MDh2OEpVenpIMW9mOGt0UHEwQjAyUXYxSTJ5Y1Q2RFF0dFRn?=
 =?utf-8?B?ZysrOVlrcHJwb0drSXpOd3VoOEJSWE53UlBoL2hBTHpuVS85SEdaWGRndUNl?=
 =?utf-8?B?OTZqVVVON2szMi9pWFpBalNVWmhrQnZKbFFoQ0xDNnI4RzAvRGJjRCtlMWFw?=
 =?utf-8?B?eUZVWmRpdGU0b0YzRDErdEREbCsyNkxReXRoZWtGUmFtRDlHZTRPdytpSXJ3?=
 =?utf-8?B?SEU0QlQxOEtRTFFZRUhSWXY3eFkrVHFCZU40MXA1bXcyRnN1dWh2Y1M3NXpD?=
 =?utf-8?B?TW5DN1paTzBzaHJOUWxxS3BuQVdLWWM3aVpxVkF5eG9vZG9yTEd3WC9OQVk2?=
 =?utf-8?B?WFZXQTFORzZaeHlwWW9WbXlQblF5VVFqZmRqSFdieTMzSTc2THY0V24xZ3Vh?=
 =?utf-8?B?dHk1RENQV2Uyb21wL2dNZ2c1MzAwL0JSZndWd1QvLzMvMXZNYmZlQmNuMUdG?=
 =?utf-8?B?VGtpVjFBNy9Bbyt4dUtpVEs1MFJpa0E3emRYQzdOK3FWU0hORUR4OEFKM1Bp?=
 =?utf-8?B?VzJveHd2SkFldzRkRnYvbUUvZmNDRkhNdXFjZDNoNFdWaWFYNlNXT3JnOHdy?=
 =?utf-8?B?Y0VMbWdsWGhoQmlVbUJWYy9lZUhQWWk0RGRidHF5WTZpbVV3VVVKZ2xIMnZ5?=
 =?utf-8?B?RlZPYmZKNTh5TXRBb29xQTNsb0xIY3UyNG9sdDNzaC9xc2F6V0p0d0R4YVg5?=
 =?utf-8?B?R2pGemtzTVlXQWJMTG5aWVlEVzRyZ1J0UWx3OVdYcytYYmg0Si9yc1hYcWFS?=
 =?utf-8?B?MTlrczFKTzZOZUxVOWVZRHBHZ202d0ZpT2JKMW1makVCV0RaOGdYSUJ2OGc1?=
 =?utf-8?B?MXZHcnhuWE56VXpBWEQySUFMa2c1NHBmV3E2RUZsYnBDTDNtWmxRQ2o4NUJS?=
 =?utf-8?B?cU1PRzZiQjZRV1hlVTNwdHRwb2k5M01ILzR0TWUramkxUzE1ZzdIYUVOWDV0?=
 =?utf-8?B?Vk9iV3BQYVN2QzUvUy9KcWEyTHlzelkrMmNZc25vNHNPNXZzSDUyN3ZvRWJp?=
 =?utf-8?B?Y3J1OUQrb3pTQVdjamV6NlBvNXRkYTBwNjBhUHI1bkFhYm4xQWNxc0Z2TEpB?=
 =?utf-8?B?STUyMGFXUXNVWHJhQTJ6VG1PM1NXREZyR0t1WU1iR09OTlgxUGh1Z0ZIUUZH?=
 =?utf-8?B?OEZYK3VKbVFjTEFmTlRFc3ltVGhlNk1FSEpVc2tqZGk3SEZRQjRtdXVJSkFC?=
 =?utf-8?Q?/b6o9X?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUo1eTRONEVqeUJsYUhnMGE3bjMvMC9TSDMxNSt3L2p0TkZpNUs5ZzUyZHBl?=
 =?utf-8?B?aEdwa3ZsMlVadjhDSk45WlBWQlZjVXlmWDFtS0QrdE9kTmc1WEhZeEZkdUEv?=
 =?utf-8?B?VkhjVnZXN0hUTFFaQWd0bEhzcDhYUEdBR0NYZXduL1hscGcyTEFjQ2F3R2Ju?=
 =?utf-8?B?ZWRRYWlDWlJadi8yeTloTTRRVVU4VXZ2bisxbGFoU3ZrNUdDSE9MclhGZWM5?=
 =?utf-8?B?aTFjTWRpcVBHQU9xbUVlaEpTUXZzMzc2bEkyUkJqdUQ5RjFUcEwySHZ2Ynd0?=
 =?utf-8?B?aEFVRC85Snh4ZkFvSjhKcVFIT1piQXpoN2tIQ01OR2k5ZXFQKzF0eGExUUFh?=
 =?utf-8?B?czk2bDc1Tlovbm1MNUJHMnlPbG1qM0pVUjJLMXB5dVN0T2k2NDJyVWN6WUpS?=
 =?utf-8?B?am9TeitreUF6SE9JTlVONFlKQ3hwSUc5bDk0OExqbTFSaWp4dmY4eTA2NzFT?=
 =?utf-8?B?dFdTN2hEUFE3MCtUYXdXZGdmbHdnQlpxUWtWakNLTUVnOXpqV1dQdnJ0UnFG?=
 =?utf-8?B?YnBWemxCc0l5UVdGaURKbWtqUERUWXBnb2FIOFRmTHVlTFBVRnRJbytQdTFy?=
 =?utf-8?B?Y2tqVXQwck0rVWJXbVEzSGVrNUE2TlJWNGJ6dHF2ZU40WGZteWUzS3lidU10?=
 =?utf-8?B?cHBQbysyRHNZQlpIWVNKa1RaY0tZa1JqbnJydEVHd0ZTNW9CRDNSWnBMY2lU?=
 =?utf-8?B?cEoxTURKM3JHc3RIVVh5K1VaOCtUQmNiMmhMOFZrQit3ZWF6OWZ4eURrUGY1?=
 =?utf-8?B?UnJhOWRGOFpINldkWm1PdmwvUWwwY3VnaFMvSExVYjN5UStkVzJTVklFNjNL?=
 =?utf-8?B?MmIwWVBROC92VmIvc3dZeHlmaURJSlB2STJYTld4NTFnRzE0MXVvQ0M2UFZz?=
 =?utf-8?B?UGRaN1BBcnEwSkpiZGhSR1V2NzNES0hzTjJPa2VHSWpUMWc2OFF5cXZiRXly?=
 =?utf-8?B?bUN3Vk9Sd29MckYvTW5WeWU0YjlPTFg1SUExRTJ5K0cyNUZBU085Y3BqVzNL?=
 =?utf-8?B?bTUyS3MrTkRsTXh3UnI2dUpnNDl4N1BBTEhkMXE3azhCYnU5Z0JlVGpYRUhQ?=
 =?utf-8?B?eWlHM0JrTERkc2NCQkswbmNZSUhsVSt2c21aRmRpcG5NU1BBbUgyQVRuNURQ?=
 =?utf-8?B?Nmt2dTVBbHlhM0Q5TFdCRUtVblhIZm44M2d0Y01TQmJEMTdtVzN1R2Z3OVBY?=
 =?utf-8?B?bWtveVdsV2Q0RCs0clo2VXN2QVppL3VSWWJEYUZoWU1janByeVc1UTBXcHNI?=
 =?utf-8?B?dWFpcUpuNjJwTGUvYTVXVHFIWnRVdTlTMy9EdWdNamRrVjA1Nit1KytpUlhX?=
 =?utf-8?B?b1ZQbU0rTEtPRkFOYmVFY0ljbys2cXBZZUh6dU5STUNmNUlyS3JaOGdwY3ZT?=
 =?utf-8?B?OFpOWUY4bHd1cjJQa2xDdHV5TGpvRm11RVhNL09ibDR6RlhzeHlINXNWbUVx?=
 =?utf-8?B?QzVGTXhSOTI4NzJMaFY5TFAvZ0VRTEFXbk84M0lOcHpieitQMisvd29DWHFN?=
 =?utf-8?B?RVpDeVZpY1l4VUQ2WTgyb3ROMHJpQmRxZ2JDS3VhL1JYL25mMUhxWWJhbmcw?=
 =?utf-8?B?VFFwOTNtOTJFcVpFK0REcTdndVNiZmRqSG5hdTNJd1dIeFd4amZ3R2tvQTY4?=
 =?utf-8?B?L1dSYm9RazVTSHVYQWdWUkdZY1o0S0crcXJnclZFdm1JU2x1MkNZdGpkSFJW?=
 =?utf-8?B?WXRMSk1uWFEreXBvMVRIUTZuMy9zbjZVNlN5RlBURGVSUkNSd1ZCWkUxNTVI?=
 =?utf-8?B?cnpyblB5SFZURE1oTmlPT2NGbUhUbXdBa0dKV3ZoNGF5bDEyZExJWUpQWmpw?=
 =?utf-8?B?Rm0xWkE3TDAzUGRGZkFhc2VrRmtNT05FSTFqZkRyb2NMcU1PQTJmb0dGRXpi?=
 =?utf-8?B?U2RxdDJab3VidFdsZytNanBsZWhYdUk0UzFpWXJRWmhnbHJCb09QUHQwMVN3?=
 =?utf-8?B?MWVpTWVENWNINDgvV1Y4L3I4ekVLdmptdUxRYlVWZWpVbXd1N0xHQzJ3Ui9U?=
 =?utf-8?B?UnVKbmd6TGl0K21hTzBEOEt6dzl1UmNMMzVUeVlnajRPdnVKRjEvZjJhcmZP?=
 =?utf-8?B?ZkJmZGM5RnhTdmNXTkRTbHBwejhPTEVuL3RORGV0ejdFdlUvanVFYXRiOVpE?=
 =?utf-8?Q?FQzZd98shxD2d3I2r7wix1rjl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c76ad72-20e5-4064-d8df-08de0a678c15
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 14:48:18.0921 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IPnQ+2bW/EMQlP01hYaVpvR4vgA8DSDtbgpekJwDqiGU+gbglIgVoWWYzxCIbnZBq66UXmn8HAD1+grZwX0ji5JUqXflEoqQh2jnnDjCnQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
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

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPkNocmlzdGlhbiBL
w7ZuaWcNCj5TZW50OiBNb25kYXksIE9jdG9iZXIgNiwgMjAyNSA5OjQ3IEFNDQo+VG86IHN1bWl0
LnNlbXdhbEBsaW5hcm8ub3JnOyBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGRyaS0NCj5k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9y
ZzsNCj5zaW1vbmEudmV0dGVyQGZmd2xsLmNoDQo+U3ViamVjdDogW1BBVENIIDIvMl0gZG1hLWJ1
ZjogaW1wcm92ZSBzZ190YWJsZSBkZWJ1Z2dpbmcgaGFjaw0KPg0KPkluc3RlYWQgb2YganVzdCBt
YW5nbGluZyB0aGUgcGFnZSBsaW5rIGNyZWF0ZSBhIGNvcHkgb2YgdGhlIHNnX3RhYmxlDQo+YnV0
IG9ubHkgY29weSBvdmVyIHRoZSBETUEgYWRkcmVzc2VzIGFuZCBub3QgdGhlIHBhZ2VzLg0KDQpU
aGlzIG1hZGUgdGhlIGlzc3VlIG9idmlvdXMuICBJZiBJIGFidXNlIHRoaXMgbm93IGhvdyB3aWxs
IEkga25vdyBJIGFtIGRvaW5nDQp0aGUgd3JvbmcgdGhpbmc/DQoNCj5TdGlsbCBxdWl0ZSBhIGhh
Y2sgYnV0IHRoaXMgYXQgbGVhc3QgYWxsb3dzIHRoZSBleHBvcnRlciB0byBwcm9wZXJseQ0KPmtl
ZXBzIGl0J3Mgc2dfdGFibGUgaW50YWN0Lg0KPg0KPlRoaXMgaXMgaW1wb3J0YW50IGZvciBleGFt
cGxlIGZvciB0aGUgc3lzdGVtIERNQS1oZWFwIHdoaWNoIG5lZWRzIGl0J3MNCj5zZ190YWJsZSB0
byBzeW5jIENQVSB3cml0ZXMgd2l0aCBkZXZpY2UgYWNjZXNzZXMuDQoNClNvIHRoZSBtYW5nbGlu
ZyBhY3R1YWxseSBicmVha3MgYSB1c2FnZT8gIEkgdGhvdWdodCB0aGF0IHRoZSB1c2FnZSB3YXMg
aW5jb3JyZWN0Li4uaXMNCnRoZSBkbWEtaGVhcCB1c2luZyB0aGlzIGluY29ycmVjdGx5Pw0KDQo+
U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
Pg0KPi0tLQ0KPiBkcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIHwgNjggKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tLS0tDQo+LS0tDQo+IDEgZmlsZSBjaGFuZ2VkLCA1NCBpbnNlcnRp
b25zKCspLCAxNCBkZWxldGlvbnMoLSkNCj4NCj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVm
L2RtYS1idWYuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMNCj5pbmRleCAyMzA1YmIyY2Mx
ZjEuLjFmZTU3ODFkODg2MiAxMDA2NDQNCj4tLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5j
DQo+KysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYw0KPkBAIC04MjgsMjEgKzgyOCw1OSBA
QCB2b2lkIGRtYV9idWZfcHV0KHN0cnVjdCBkbWFfYnVmICpkbWFidWYpDQo+IH0NCj4gRVhQT1JU
X1NZTUJPTF9OU19HUEwoZG1hX2J1Zl9wdXQsICJETUFfQlVGIik7DQo+DQo+LXN0YXRpYyB2b2lk
IG1hbmdsZV9zZ190YWJsZShzdHJ1Y3Qgc2dfdGFibGUgKnNnX3RhYmxlKQ0KPitzdGF0aWMgaW50
IGRtYV9idWZfbWFuZ2xlX3NnX3RhYmxlKHN0cnVjdCBzZ190YWJsZSAqKnNnX3RhYmxlKQ0KPiB7
DQo+LSNpZmRlZiBDT05GSUdfRE1BQlVGX0RFQlVHDQo+LQlpbnQgaTsNCj4tCXN0cnVjdCBzY2F0
dGVybGlzdCAqc2c7DQo+LQ0KPi0JLyogVG8gY2F0Y2ggYWJ1c2Ugb2YgdGhlIHVuZGVybHlpbmcg
c3RydWN0IHBhZ2UgYnkgaW1wb3J0ZXJzIG1peA0KPi0JICogdXAgdGhlIGJpdHMsIGJ1dCB0YWtl
IGNhcmUgdG8gcHJlc2VydmUgdGhlIGxvdyBTR18gYml0cyB0bw0KPi0JICogbm90IGNvcnJ1cHQg
dGhlIHNndC4gVGhlIG1peGluZyBpcyB1bmRvbmUgb24gdW5tYXANCj4tCSAqIGJlZm9yZSBwYXNz
aW5nIHRoZSBzZ3QgYmFjayB0byB0aGUgZXhwb3J0ZXIuDQo+KwlzdHJ1Y3Qgc2dfdGFibGUgKnRv
LCAqZnJvbSA9ICpzZ190YWJsZTsNCj4rCXN0cnVjdCBzY2F0dGVybGlzdCAqdG9fc2csICpmcm9t
X3NnOw0KPisJaW50IGksIHJldDsNCj4rDQo+KwlpZiAoIUlTX0VOQUJMRUQoQ09ORklHX0RNQUJV
Rl9ERUJVRykpDQo+KwkJcmV0dXJuIDA7DQo+Kw0KPisJLyoNCj4rCSAqIFRvIGNhdGNoIGFidXNl
IG9mIHRoZSB1bmRlcmx5aW5nIHN0cnVjdCBwYWdlIGJ5IGltcG9ydGVycyBjb3B5IHRoZQ0KPisJ
ICogc2dfdGFibGUgd2l0aG91dCBjb3B5aW5nIHRoZSBwYWdlX2xpbmsgYW5kIGdpdmUgb25seSB0
aGUgY29weSBiYWNrDQo+dG8NCj4rCSAqIHRoZSBpbXBvcnRlci4NCj4gCSAqLw0KPi0JZm9yX2Vh
Y2hfc2d0YWJsZV9zZyhzZ190YWJsZSwgc2csIGkpDQo+LQkJc2ctPnBhZ2VfbGluayBePSB+MHhm
ZlVMOw0KPi0jZW5kaWYNCj4rCXRvID0ga3phbGxvYyhzaXplb2YoKnRvKSwgR0ZQX0tFUk5FTCk7
DQo+KwlpZiAoIXRvKQ0KPisJCXJldHVybiAtRU5PTUVNOw0KPg0KPisJcmV0ID0gc2dfYWxsb2Nf
dGFibGUodG8sIGZyb20tPm5lbnRzLCBHRlBfS0VSTkVMKTsNCj4rCWlmIChyZXQpDQo+KwkJZ290
byBmcmVlX3RvOw0KPisNCj4rCXRvX3NnID0gdG8tPnNnbDsNCj4rCWZvcl9lYWNoX3NndGFibGVf
ZG1hX3NnKGZyb20sIGZyb21fc2csIGkpIHsNCj4rCQlzZ19zZXRfcGFnZSh0b19zZywgTlVMTCwg
MCwgMCk7DQo+KyAgICAgICAgICAgICAgICBzZ19kbWFfYWRkcmVzcyh0b19zZykgPSBzZ19kbWFf
YWRkcmVzcyhmcm9tX3NnKTsNCj4rICAgICAgICAgICAgICAgIHNnX2RtYV9sZW4odG9fc2cpID0g
c2dfZG1hX2xlbihmcm9tX3NnKTsNCg0KSXMgdGhlIGluZGVudGF0aW9uIGNvcnJlY3QgaGVyZT8N
Cg0KTQ0KDQo+KwkJdG9fc2cgPSBzZ19uZXh0KHRvX3NnKTsNCj4rCX0NCj4rDQo+KwkvKg0KPisJ
ICogU3RvcmUgdGhlIG9yaWdpbmFsIHNnX3RhYmxlIGluIHRoZSBmaXJzdCBwYWdlX2xpbmsgb2Yg
dGhlIGNvcHkgc28NCj4rCSAqIHRoYXQgd2UgY2FuIHJldmVydCBldmVyeXRoaW5nIGJhY2sgYWdh
aW4gb24gdW5tYXAuDQo+KwkgKi8NCj4rCXRvLT5zZ2xbMF0ucGFnZV9saW5rID0gKHVuc2lnbmVk
IGxvbmcpZnJvbTsNCj4rCSpzZ190YWJsZSA9IHRvOw0KPisJcmV0dXJuIDA7DQo+Kw0KPitmcmVl
X3RvOg0KPisJa2ZyZWUodG8pOw0KPisJcmV0dXJuIHJldDsNCj4rfQ0KPisNCj4rc3RhdGljIHZv
aWQgZG1hX2J1Zl9kZW1hbmdsZV9zZ190YWJsZShzdHJ1Y3Qgc2dfdGFibGUgKipzZ190YWJsZSkN
Cj4rew0KPisJc3RydWN0IHNnX3RhYmxlICpjb3B5ID0gKnNnX3RhYmxlOw0KPisNCj4rCWlmICgh
SVNfRU5BQkxFRChDT05GSUdfRE1BQlVGX0RFQlVHKSkNCj4rCQlyZXR1cm47DQo+Kw0KPisJKnNn
X3RhYmxlID0gKHZvaWQgKiljb3B5LT5zZ2xbMF0ucGFnZV9saW5rOw0KPisJc2dfZnJlZV90YWJs
ZShjb3B5KTsNCj4rCWtmcmVlKGNvcHkpOw0KPiB9DQo+DQo+IHN0YXRpYyBpbmxpbmUgYm9vbA0K
PkBAIC0xMTM5LDcgKzExNzcsOSBAQCBzdHJ1Y3Qgc2dfdGFibGUgKmRtYV9idWZfbWFwX2F0dGFj
aG1lbnQoc3RydWN0DQo+ZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gsDQo+IAkJaWYgKHJldCA8
IDApDQo+IAkJCWdvdG8gZXJyb3JfdW5tYXA7DQo+IAl9DQo+LQltYW5nbGVfc2dfdGFibGUoc2df
dGFibGUpOw0KPisJcmV0ID0gZG1hX2J1Zl9tYW5nbGVfc2dfdGFibGUoJnNnX3RhYmxlKTsNCj4r
CWlmIChyZXQpDQo+KwkJZ290byBlcnJvcl91bm1hcDsNCj4NCj4gCWlmIChJU19FTkFCTEVEKENP
TkZJR19ETUFfQVBJX0RFQlVHKSkgew0KPiAJCXN0cnVjdCBzY2F0dGVybGlzdCAqc2c7DQo+QEAg
LTEyMjAsNyArMTI2MCw3IEBAIHZvaWQgZG1hX2J1Zl91bm1hcF9hdHRhY2htZW50KHN0cnVjdA0K
PmRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoLA0KPg0KPiAJZG1hX3Jlc3ZfYXNzZXJ0X2hlbGQo
YXR0YWNoLT5kbWFidWYtPnJlc3YpOw0KPg0KPi0JbWFuZ2xlX3NnX3RhYmxlKHNnX3RhYmxlKTsN
Cj4rCWRtYV9idWZfZGVtYW5nbGVfc2dfdGFibGUoJnNnX3RhYmxlKTsNCj4gCWF0dGFjaC0+ZG1h
YnVmLT5vcHMtPnVubWFwX2RtYV9idWYoYXR0YWNoLCBzZ190YWJsZSwgZGlyZWN0aW9uKTsNCj4N
Cj4gCWlmIChkbWFfYnVmX3Bpbl9vbl9tYXAoYXR0YWNoKSkNCj4tLQ0KPjIuNDMuMA0KDQo=
