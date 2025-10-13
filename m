Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9DABD474B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 17:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF0210E3A6;
	Mon, 13 Oct 2025 15:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5Nev7cF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07BB10E3A6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 15:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760370318; x=1791906318;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=swaHFmtqnz1PEY9EpCymeqZEDQXYJifjr304jpP5dl4=;
 b=d5Nev7cFTJnzV3nAkva07QbZEgIYApAolc7vLcFcbgczLJhsOGI1xlLa
 P2Sr9QrRKwLPSKjqdJYCg0qE6ZWyvjJYwOCfaY/TRGf9WAVguPynd8lun
 YYy1/OWJgFWC+1rBq55xebF7+fBpSBfR+Bz8hCZA5HNpfbIDJW6eOFw4H
 cznQ/pkmfO5Fjk7Yi9eylI+CpazW29etldCrsyTinM7kC8ysrtuzmN4JP
 lCLy2ITVnExQNoshI1NmcY6YQQSUctgUi9NJoQ3SX2vTk2PPmJo3oJNff
 joWOP3ELq/Tvz3WSSonH1DxTcjxADvuqMLTk8gNftpbmPCA9P1LimiDKp w==;
X-CSE-ConnectionGUID: pTqnYLsORcq15jI4vwgrkQ==
X-CSE-MsgGUID: LvKbAO08TxuqzWUlWLD7YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62608019"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="62608019"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 08:45:17 -0700
X-CSE-ConnectionGUID: Po+wlkCSThCS/SsM7yQDtA==
X-CSE-MsgGUID: YpXYEePITaGFdT+B5WH55Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="186036752"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 08:45:17 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 08:45:16 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 08:45:16 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.14) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 08:45:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNgENCRV7i4UbRb0Mavapm9iKKk0MMGcQOMPX3/OTa9Oscm5saXojfDUrHBKxZyoeisGYopFBdxPwNfTP36TKib77LzjuXRi1M69Q2KbGMJxWeIl+/q10SKG96lFmVCeCY7vuEAhv37PeQqi5uy18fyWzNMmniKnrL2pot2xAzDLE0i8wPyjRwVXfxRAWI5tegO6nq3CRvxQv3Y8yDgnrnLOKItviedCT76p4lOPkHaYiH4WGeMEyyfxLPyxP6MNdW14uM6aeNfgY7vgdZTgKg6mj/HkeNBcRjUW+t0BKliYCb471pgp3cuJ7Ck1lXgMPBdkngMPp6SfE83M1SjjLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swaHFmtqnz1PEY9EpCymeqZEDQXYJifjr304jpP5dl4=;
 b=N+RXMnDckjL7JD/tmRtEfDgRTroGZMY8yoa0M/5UyihFYQiVGnQqudy1jiZK6LhwL9Dsg68Ah5xduhhcI+69n5Jo2U8c/fZxkdKK/IzSzxz1uClo2PX9sgqgr7sGCRhEgU+hTUCDd9Hq7gg6d9v6VwmXXQUF8k9convgTntcyk4msAmaiprnAl9Tuu1dsg3utGIBnvRtWjIg4RTORTXUOx13O96C4MzMUccJUTlGmrX9CTGeeyCee5UzSwWDmKe6pr2sWR7ktqLTaRmFPfdqfR+IYGA7G0pQalGJmju7K11ELAQMep8P7O7uRZ0IinKTSBXPRxYKGIdI93KBVuPLpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by LV8PR11MB8772.namprd11.prod.outlook.com (2603:10b6:408:200::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 15:45:14 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%2]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 15:45:13 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>
Subject: RE: [PATCH 2/2] dma-buf: improve sg_table debugging hack
Thread-Topic: [PATCH 2/2] dma-buf: improve sg_table debugging hack
Thread-Index: AQHcNsfJ8efePPkuakeFR9ObMuWRLbTAMWaAgAAFzgCAAAWa8A==
Date: Mon, 13 Oct 2025 15:45:13 +0000
Message-ID: <IA1PR11MB641876E4CD41BC7B4463B482C1EAA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20251006134713.1846-1-christian.koenig@amd.com>
 <20251006134713.1846-2-christian.koenig@amd.com>
 <IA1PR11MB64187AF0DC0A4A63D9930F54C1EAA@IA1PR11MB6418.namprd11.prod.outlook.com>
 <bbabd9fe-5a79-482c-b277-5547797c240c@amd.com>
In-Reply-To: <bbabd9fe-5a79-482c-b277-5547797c240c@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|LV8PR11MB8772:EE_
x-ms-office365-filtering-correlation-id: 19243b0f-bb88-4776-fcd9-08de0a6f8008
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SEloWFVNbVIybzNqdWdxckwvaUtRY2p4VXdJeWJrV1pxN2grcVJKeElPdG05?=
 =?utf-8?B?K0RjQXkrZmREVWFNdnM2cmVBWlQ4TVpiOFNTQ2dBUG4wRDB1cFBQUUFwVkcx?=
 =?utf-8?B?RUJLaENIQnlQeVNGYkxZRUpGeWZXRjZkblduRmlvMitTQ2tMZEppQWNPSjl1?=
 =?utf-8?B?VDhhZUZ0OW52LzA5MCs3VmYxOXRtVXBkSEJkaVp1TStrVkNEUUExb3JoRlNO?=
 =?utf-8?B?T3FxRVVZZDNjcytwTXlQakRCZitIc1pJeElmTWM1alJyL0R3d3NOWHZtTTQ1?=
 =?utf-8?B?Zk9odmpsdGo1MzZCbWxtakdyYnM5NUdBZmlHV3JIU09XR2NzWGZBWHhVS0Iz?=
 =?utf-8?B?czdEdEpDaUcrQlhvQnh1S0UrbnVaLzJzTEZveGdycS9zZnloQUpOemp5dHhL?=
 =?utf-8?B?czVEend4RHlMS2taZkJ6Q0loUXZKTHBiNWNrOStsbEhRcDJZU1BMYmlVWUFX?=
 =?utf-8?B?RUQ3RmZVV0hXbnZJUUxGbzdsVnJzQk8rdGVoRmJjcGpFMkdVc3JINzBlM0h1?=
 =?utf-8?B?RW5sSVdrU0NDd3NTbXhuVGlrMndHL05YbWlpWnZKU1kxeHhEOHVMbFFNUjJ6?=
 =?utf-8?B?ZS83WFJWeW1VRnRyV2NnWlhobHVGUnpneUIwZXlxTkdvU2ViV1EySnZBbmRW?=
 =?utf-8?B?K01iak4ybUxCZnNyaDB6NXQ3VFk2Wmp1TXl5b3RDazBqSnM3RVV4NHdMU3pQ?=
 =?utf-8?B?eG9vaFpsZ2V5U0I4ZmRMUzczOVBuYzY1Kys5TXkzaUNad2pJdjZyakQvV2Ez?=
 =?utf-8?B?eWpnY2R4SlJMN0hqekVjSERhVXcyZmF1R2ZBbGhZYjZ6R0ZIOGl6dG00eWxs?=
 =?utf-8?B?WXFzTGFDeitZU1pVQVB6Z3V1aG5HQ0p1MG5PNFJMRnpGVnJhcm41OFNvUHBD?=
 =?utf-8?B?ZlVUbHZqK29YWm5aM0lFMXJ1bUdBWXl6Ly9BV2g0SS8zR1RQNjM3b3JLSEFG?=
 =?utf-8?B?S3J6SElRbGw4Vkc2bk9BWXBJMUpHS1k3YjBPNjR2YXNkNnhHUVNQb09DamY5?=
 =?utf-8?B?dXVPeFdtdEhFblUrUkNuSlR2MHJYWmliMXBSZ1RCV05vMFFFZzJQU0JXSTF3?=
 =?utf-8?B?akE2RW5Uekt3WUwvdktZVXB3aTBJb1hvektmaWVaTjJpVlI2WWpuaCtzak82?=
 =?utf-8?B?d2VOTmE0VnFWcDhtaUhwdjZjZW1DWGd6N3ZHSGRmQVVOeEJHQzdyeFdIVm83?=
 =?utf-8?B?NDM1V1FxanN3cHJ4WHd1MTRVZ3djRDhGZ0FWbFNxTFpsRUhCdCsxNWVZREs3?=
 =?utf-8?B?eVQ2b1pTb3lkTGwzYjZRMC9iZERFbFhmRXN2dkhDSzZmdUp6SWQ4K0lzME5P?=
 =?utf-8?B?VEhDS2luOXBRTlNoMmhqRy9rZWROeC9XYlhYb0xJWmhLWHpua1Y5NDMyTTNL?=
 =?utf-8?B?WkNIT09TUFBFUWlacThCYkhhbWlUUmFkYXFWQVYxYmFtRENFOXNCTnVRaTlS?=
 =?utf-8?B?WFJJSWZzQmkwTjh2QVllK1V1aUpqbGNRcFdnQkpzb2RDa2M0cU01UFVUd1lk?=
 =?utf-8?B?QmUxcmZpc2NFeHUzSlFQZnJQS0ErdW83cTc1TnNhQzZ2SHFtcDVrUjMwVm5I?=
 =?utf-8?B?ckFsTUtBdTBxaldjamYwR1c0cHB4WldsODJ0SUdjQ2NlRDc3SXlyMkNaeXJi?=
 =?utf-8?B?TFhsc0RXbTRLcWdDMnBuMncyVW44MzhJY2RlZFJsMW5zTERkd1RSN1NDMzhO?=
 =?utf-8?B?Qm1iUTUyYWdQdVB6UVlJQ3RkdWpRNVJ3UmZxamg1TVdKK0dFMzlPODg3NlAx?=
 =?utf-8?B?UVFzdnhwMW9TRmZCeUR5ZExoK0haYTFFeE9MZG4zb3dWOVdoUEtkTTdNVVdC?=
 =?utf-8?B?VnVkZzBwS3ZtMjgyd3JGNjhyelQwUm10blRTNmpxZmtYeFhYWGs4WnplUFYx?=
 =?utf-8?B?OG9QNHExRWFOaFVoaWdnRGE1ZThkV1UzckhoaCtiSFpUdjc0WXprUytOR2VH?=
 =?utf-8?B?bkhmNExLM3ZTcWF2WFltWFZQZjkzaGdIMWllNWNyNHNvYnRIdm84aDdCSy9B?=
 =?utf-8?B?K2dVcTNIRmo3ZHpIUktzQjQ0T2xiZXBiaVBISVE0VEttRVQyci95RzhyZ29P?=
 =?utf-8?Q?Cvz8OJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L01KdDBZdjI2V3lRbmd5VTU5N0JNR2wwT2FRb3ZhanRxd1RyRGVyRFdOendR?=
 =?utf-8?B?a1pyc21hT2I3QVRlUEtHTWZ4OTE4eEt3WGtpWGlrQWZvOW1hbVF5OXRBUE12?=
 =?utf-8?B?czlNK0cxcmR6RyttTjRDWC9WZUNZdlhpaWlOUldMZzdsNk1SUVdxcXZ1MmFG?=
 =?utf-8?B?L3paTEZZWWY1bTJnWFYxaGxDMUhSU3JZQTROekdNc0laaVVsOWpkZGJxbHFN?=
 =?utf-8?B?NnBsMW12OUU4dU94RDBhaG9ybXdoSWozK1Ard21qQmU4ajc1TU5mR0Rjdk1Z?=
 =?utf-8?B?djI1T0p5SlNXZm1LemtxcEdsMlQvSFVhWTZTSGxydmNFUi9tWG5zUGJvbThT?=
 =?utf-8?B?Z1lUdVZCa21ldGRsYTV0REREQmpKaHJPR3lPSmhqOFliNW91MlIwaG9FTENW?=
 =?utf-8?B?WmZ2TENYNjhRQTczakI3dTRIRElxRHgwMDgyWVpzbnE4Wk1FK3VVNTZOY21w?=
 =?utf-8?B?eG9LV0N1R0dvZENhRGdRclFId2RxbllBamJUSUZiSnVuZVRRUUd2TUhhZnNp?=
 =?utf-8?B?a21mNWw5Zm9XeFZ2VTViZ3AyTEJlMGFtS0l4NXJCdm01UUZLTEhtNjZWU3cr?=
 =?utf-8?B?OEJpV2x1S3hYUEZEc2Z1V1NiWk5jKzFORXJNSkNIOS95eVVpWi93b0prUEs4?=
 =?utf-8?B?bUJyUkxlZ1EvTEpaSW1YWXVlL0RwRXdoYkJEbWp0ajBDNzNXenFMYVJIVlR6?=
 =?utf-8?B?ZGoyTjhJZHNMclVQK005YlhCRnVQM3JZcGcrSWN4emtIaHl4YzBNRDBzNk1u?=
 =?utf-8?B?eDFSb2pYVzhobXEyazhqcncrMlZTbTdOMHVlOWxDUGlhK2xiRmRyR3VRSThL?=
 =?utf-8?B?Mys1Q3VVaGpHV2Zkek51eUNDbzlnZWJKVHNLaHBDU0FWdXVEanVZUHpCK0Fk?=
 =?utf-8?B?aUVPSWY0WnFQTndLN3A0RkUzTFRKeVY1NjlUT1JLNkNkbWhFWERQc0pZQWR4?=
 =?utf-8?B?c0NpTE1JbmNFalNZczRqRHdPcjRDM04vamJhRzJLWE5ONjQyUUtKSHlIZGt1?=
 =?utf-8?B?cmppU1FkT1pMU3BKSmhidFhXUmpIenJwTDc3MVFFblIyWWxHbkZYOS9sb1lk?=
 =?utf-8?B?aksvZHdjUC85ZkwwMHhYbS92bDgwcFNpTTk4cWtDY2l1TlI5OExKSlFDMHJp?=
 =?utf-8?B?Slg5d3hQZjNPNzRCZlNPK2dVcHhzUHFQTUFzZ0paTmhpQitWL1ZBMXpQaTFy?=
 =?utf-8?B?eUM5V1Z0RDJuV2pKNzl2UWwwOE0ydXkyZkNTaUxRM1gwdjU3aU5lSTQ0WEN4?=
 =?utf-8?B?eEo0SDFSNy9INDB6UFdPU0swVVUvZVppTUtwcG5rclJUZDdLWWpYUkFFUnI4?=
 =?utf-8?B?U0x2ZE56c2RPdndnTDRlVFVndmplZmtsd1pFZnExQlZYeWVsMERoM1llVEt6?=
 =?utf-8?B?Qk9RRmg0REV4cHZvZzNZRThjaHZXRTd1UGgzUkN0MUpJbWRET0lYZVA4U3Rk?=
 =?utf-8?B?Sk5KYlZZR1VmVm9RRnp4S2R4NDAyakljUzZxRVlhK2hKb21iaG1XU3QzM2FO?=
 =?utf-8?B?aVB5ZVd4c1g3TEVqWDVDQU9pSU9OMERucFVGR0tYM1Z0bWZrRVE3RXcwd3BY?=
 =?utf-8?B?dkdoUE4vbjljNlM1NkxrakcwalRZS1dvajRiWGJZS3NqRVZMa2VXcFhxdThI?=
 =?utf-8?B?elpCazZBR2NFMWtmSTlmdFduR2dlUVc0c25kWXdGdTl5QUo4bVRGeUlxaTRO?=
 =?utf-8?B?RlhrOEY0T0FtemZLb3ZSQXdEVzJQdXlpdmwvZHBMWmJiVXdBdUZmVGdzeXI1?=
 =?utf-8?B?ejZvNkw0OThpVmNNYnpmL29rbUdhRU5oYUcrZWF0enVJbENVWWlxT0pIUTdZ?=
 =?utf-8?B?UmYrNkZXdytDUlZEejBDZDQ0eUVYbG0xdEVSRjRsbEE4Mzg2dWcrSkQrdVpV?=
 =?utf-8?B?WG9MNGNMUjZza3lUZEE3dkV4S3E1cU5ia3VGby9YN0V0V0VjVStXanZCUVlr?=
 =?utf-8?B?eldVWERZV1pFSU4zWWptQmhBMm00YllWK3VSTGJ2UXRtanZSdjNnL2VMem5W?=
 =?utf-8?B?QURXUmxDdDJsY3lGN2oxaG9JcVJ2N0hLL2VxUXJZaXJ3WWx4RUN2bU5xVFVz?=
 =?utf-8?B?UXRZejdOY1RyYUZSa3VsNmR1MEZVdU0xN2RnWThISDR5b2xDWVRhVzRwU3lp?=
 =?utf-8?Q?qsf85bJwm3eOmC4bMqE6YiFvm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19243b0f-bb88-4776-fcd9-08de0a6f8008
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 15:45:13.8548 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fm7QBKPmc9tUVsoBrN3/w60pliUu8jWpYna+twI7kBs8jUET++oRyK1pIBFz7thjC1dSYhcjqTk38u3gvOYyvedM2uCcpJCBzGfoPCSFI3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8772
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

DQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+U2VudDogTW9uZGF5LCBPY3RvYmVyIDEzLCAyMDI1
IDExOjAyIEFNDQo+VG86IFJ1aGwsIE1pY2hhZWwgSiA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29t
Pjsgc3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc7DQo+bGludXgtbWVkaWFAdmdlci5rZXJuZWwub3Jn
OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW5hcm8tbW0tDQo+c2lnQGxpc3Rz
LmxpbmFyby5vcmc7IHNpbW9uYS52ZXR0ZXJAZmZ3bGwuY2gNCj5TdWJqZWN0OiBSZTogW1BBVENI
IDIvMl0gZG1hLWJ1ZjogaW1wcm92ZSBzZ190YWJsZSBkZWJ1Z2dpbmcgaGFjaw0KPg0KPk9uIDEz
LjEwLjI1IDE2OjQ4LCBSdWhsLCBNaWNoYWVsIEogd3JvdGU6DQo+Pj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4+PiBGcm9tOiBkcmktZGV2ZWwgPGRyaS1kZXZlbC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+Pj4gQ2hyaXN0aWFuIEvDtm5pZw0KPj4+
IFNlbnQ6IE1vbmRheSwgT2N0b2JlciA2LCAyMDI1IDk6NDcgQU0NCj4+PiBUbzogc3VtaXQuc2Vt
d2FsQGxpbmFyby5vcmc7IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgZHJpLQ0KPj4+IGRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3Jn
Ow0KPj4+IHNpbW9uYS52ZXR0ZXJAZmZ3bGwuY2gNCj4+PiBTdWJqZWN0OiBbUEFUQ0ggMi8yXSBk
bWEtYnVmOiBpbXByb3ZlIHNnX3RhYmxlIGRlYnVnZ2luZyBoYWNrDQo+Pj4NCj4+PiBJbnN0ZWFk
IG9mIGp1c3QgbWFuZ2xpbmcgdGhlIHBhZ2UgbGluayBjcmVhdGUgYSBjb3B5IG9mIHRoZSBzZ190
YWJsZQ0KPj4+IGJ1dCBvbmx5IGNvcHkgb3ZlciB0aGUgRE1BIGFkZHJlc3NlcyBhbmQgbm90IHRo
ZSBwYWdlcy4NCj4+DQo+PiBUaGlzIG1hZGUgdGhlIGlzc3VlIG9idmlvdXMuICBJZiBJIGFidXNl
IHRoaXMgbm93IGhvdyB3aWxsIEkga25vdyBJIGFtIGRvaW5nDQo+PiB0aGUgd3JvbmcgdGhpbmc/
DQo+DQo+WW91IGdldCBhIGNyYXNoIHdoZW4geW91IHRyeSB0byB0byBjb252ZXJ0IGEgcGFnZSBs
aW5rIGludG8gYSBzdHJ1Y3QgcGFnZSBwb2ludGVyDQo+YW5kIHRoZW4gYWNjZXNzIGZpZWxkcyBp
biB0aGF0IHN0cnVjdCBwYWdlICh0aGUgcG9pbnRlciBpcyBOVUxMIGZvciBtb3N0IGVudHJpZXMN
Cj5ub3cpLg0KPg0KPj4+IFN0aWxsIHF1aXRlIGEgaGFjayBidXQgdGhpcyBhdCBsZWFzdCBhbGxv
d3MgdGhlIGV4cG9ydGVyIHRvIHByb3Blcmx5DQo+Pj4ga2VlcHMgaXQncyBzZ190YWJsZSBpbnRh
Y3QuDQo+Pj4NCj4+PiBUaGlzIGlzIGltcG9ydGFudCBmb3IgZXhhbXBsZSBmb3IgdGhlIHN5c3Rl
bSBETUEtaGVhcCB3aGljaCBuZWVkcyBpdCdzDQo+Pj4gc2dfdGFibGUgdG8gc3luYyBDUFUgd3Jp
dGVzIHdpdGggZGV2aWNlIGFjY2Vzc2VzLg0KPj4NCj4+IFNvIHRoZSBtYW5nbGluZyBhY3R1YWxs
eSBicmVha3MgYSB1c2FnZT8gIEkgdGhvdWdodCB0aGF0IHRoZSB1c2FnZSB3YXMNCj5pbmNvcnJl
Y3QuLi5pcw0KPj4gdGhlIGRtYS1oZWFwIHVzaW5nIHRoaXMgaW5jb3JyZWN0bHk/DQo+DQo+Tm8s
IGRtYS1oZWFwIGFzIGFuIGV4cG9ydGVyIGlzIHVzaW5nIGl0IHBlcmZlY3RseSBjb3JyZWN0bHku
DQo+DQo+VGhlIHByb2JsZW0gd2FzIChvciByYXRoZXIgaXMpIHRoYXQgc29tZSBpbXBvcnRlcnMg
dHVybmVkIHRoZSBwYWdlIGxpbmsgaW50byBhDQo+c3RydWN0IHBhZ2UgYWdhaW4gYW5kIHRoZW4g
dHJpZWQgdG8gbW9kaWZ5IHRoYXQgc3RydWN0IHBhZ2UsIGUuZy4gZ3JhYmJpbmcNCj5yZWZlcmVu
Y2VzIHRvIGl0IG9yIHNpbWlsYXIuDQo+DQo+VGhhdCB0dXJuZWQgaW50byB0b25zIG9mIHByb2Js
ZW1zIHdoZW4gdGhlIGV4cG9ydGVyIHVzZWQgZGV2aWNlIHByaXZhdGUgcGFnZXMNCj5hbmQgZGlk
bid0IGV4cGVjdCB0aGF0IHNvbWVib2R5IG1lc3Npbmcgd2l0aCBpdC4NCj4NCj5UaGUgb25seSBw
cm9wZXJ0eSBpbXBvcnRlcnMgYXJlIGFsbG93ZWQgdG8gYWNjZXNzIGluIHRoZSBzZ190YWJsZXMg
dGhleSBnZXQNCj5mcm9tIGRtYV9idWYgYXJlIHRoZSBETUEtYWRkcmVzc2VzLg0KPg0KPlRoaXMg
cGF0Y2ggaGVyZSBpcyBhIGZpcnN0IHN0ZXAgdG8gcmVwbGFjZSB1c2luZyBzZ190YWJsZXMgd2l0
aCBzb21ldGhpbmcgZWxzZSBsaWtlDQo+eGFycmF5IG9mIERNQS1hZGRyZXNzZXMgb3Igc2ltaWxh
ci4NCg0KT2sgZ290IGl0Lg0KDQpTb21lIGZ1cnRoZXIgY29tbWVudHMgYmVsb3cuLi4NCg0KPlJl
Z2FyZHMsDQo+Q2hyaXN0aWFuLg0KPg0KPj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+Pj4gLS0tDQo+Pj4gZHJpdmVycy9k
bWEtYnVmL2RtYS1idWYuYyB8IDY4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQ0K
Pi0tLQ0KPj4+IC0tLQ0KPj4+IDEgZmlsZSBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspLCAxNCBk
ZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1
Zi5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYw0KPj4+IGluZGV4IDIzMDViYjJjYzFmMS4u
MWZlNTc4MWQ4ODYyIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMN
Cj4+PiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jDQo+Pj4gQEAgLTgyOCwyMSArODI4
LDU5IEBAIHZvaWQgZG1hX2J1Zl9wdXQoc3RydWN0IGRtYV9idWYgKmRtYWJ1ZikNCj4+PiB9DQo+
Pj4gRVhQT1JUX1NZTUJPTF9OU19HUEwoZG1hX2J1Zl9wdXQsICJETUFfQlVGIik7DQo+Pj4NCj4+
PiAtc3RhdGljIHZvaWQgbWFuZ2xlX3NnX3RhYmxlKHN0cnVjdCBzZ190YWJsZSAqc2dfdGFibGUp
DQo+Pj4gK3N0YXRpYyBpbnQgZG1hX2J1Zl9tYW5nbGVfc2dfdGFibGUoc3RydWN0IHNnX3RhYmxl
ICoqc2dfdGFibGUpDQo+Pj4gew0KPj4+IC0jaWZkZWYgQ09ORklHX0RNQUJVRl9ERUJVRw0KPj4+
IC0JaW50IGk7DQo+Pj4gLQlzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnOw0KPj4+IC0NCj4+PiAtCS8q
IFRvIGNhdGNoIGFidXNlIG9mIHRoZSB1bmRlcmx5aW5nIHN0cnVjdCBwYWdlIGJ5IGltcG9ydGVy
cyBtaXgNCj4+PiAtCSAqIHVwIHRoZSBiaXRzLCBidXQgdGFrZSBjYXJlIHRvIHByZXNlcnZlIHRo
ZSBsb3cgU0dfIGJpdHMgdG8NCj4+PiAtCSAqIG5vdCBjb3JydXB0IHRoZSBzZ3QuIFRoZSBtaXhp
bmcgaXMgdW5kb25lIG9uIHVubWFwDQo+Pj4gLQkgKiBiZWZvcmUgcGFzc2luZyB0aGUgc2d0IGJh
Y2sgdG8gdGhlIGV4cG9ydGVyLg0KPj4+ICsJc3RydWN0IHNnX3RhYmxlICp0bywgKmZyb20gPSAq
c2dfdGFibGU7DQo+Pj4gKwlzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnRvX3NnLCAqZnJvbV9zZzsNCj4+
PiArCWludCBpLCByZXQ7DQo+Pj4gKw0KPj4+ICsJaWYgKCFJU19FTkFCTEVEKENPTkZJR19ETUFC
VUZfREVCVUcpKQ0KPj4+ICsJCXJldHVybiAwOw0KPj4+ICsNCj4+PiArCS8qDQo+Pj4gKwkgKiBU
byBjYXRjaCBhYnVzZSBvZiB0aGUgdW5kZXJseWluZyBzdHJ1Y3QgcGFnZSBieSBpbXBvcnRlcnMg
Y29weSB0aGUNCj4+PiArCSAqIHNnX3RhYmxlIHdpdGhvdXQgY29weWluZyB0aGUgcGFnZV9saW5r
IGFuZCBnaXZlIG9ubHkgdGhlIGNvcHkgYmFjaw0KPj4+IHRvDQo+Pj4gKwkgKiB0aGUgaW1wb3J0
ZXIuDQo+Pj4gCSAqLw0KPj4+IC0JZm9yX2VhY2hfc2d0YWJsZV9zZyhzZ190YWJsZSwgc2csIGkp
DQo+Pj4gLQkJc2ctPnBhZ2VfbGluayBePSB+MHhmZlVMOw0KPj4+IC0jZW5kaWYNCj4+PiArCXRv
ID0ga3phbGxvYyhzaXplb2YoKnRvKSwgR0ZQX0tFUk5FTCk7DQo+Pj4gKwlpZiAoIXRvKQ0KPj4+
ICsJCXJldHVybiAtRU5PTUVNOw0KPj4+DQo+Pj4gKwlyZXQgPSBzZ19hbGxvY190YWJsZSh0bywg
ZnJvbS0+bmVudHMsIEdGUF9LRVJORUwpOw0KPj4+ICsJaWYgKHJldCkNCj4+PiArCQlnb3RvIGZy
ZWVfdG87DQo+Pj4gKw0KPj4+ICsJdG9fc2cgPSB0by0+c2dsOw0KPj4+ICsJZm9yX2VhY2hfc2d0
YWJsZV9kbWFfc2coZnJvbSwgZnJvbV9zZywgaSkgew0KPj4+ICsJCXNnX3NldF9wYWdlKHRvX3Nn
LCBOVUxMLCAwLCAwKTsNCj4+PiArICAgICAgICAgICAgICAgIHNnX2RtYV9hZGRyZXNzKHRvX3Nn
KSA9IHNnX2RtYV9hZGRyZXNzKGZyb21fc2cpOw0KPj4+ICsgICAgICAgICAgICAgICAgc2dfZG1h
X2xlbih0b19zZykgPSBzZ19kbWFfbGVuKGZyb21fc2cpOw0KPj4NCj4+IElzIHRoZSBpbmRlbnRh
dGlvbiBjb3JyZWN0IGhlcmU/DQo+Pg0KPj4gTQ0KPj4NCj4+PiArCQl0b19zZyA9IHNnX25leHQo
dG9fc2cpOw0KPj4+ICsJfQ0KPj4+ICsNCj4+PiArCS8qDQo+Pj4gKwkgKiBTdG9yZSB0aGUgb3Jp
Z2luYWwgc2dfdGFibGUgaW4gdGhlIGZpcnN0IHBhZ2VfbGluayBvZiB0aGUgY29weSBzbw0KPj4+
ICsJICogdGhhdCB3ZSBjYW4gcmV2ZXJ0IGV2ZXJ5dGhpbmcgYmFjayBhZ2FpbiBvbiB1bm1hcC4N
Cj4+PiArCSAqLw0KPj4+ICsJdG8tPnNnbFswXS5wYWdlX2xpbmsgPSAodW5zaWduZWQgbG9uZylm
cm9tOw0KDQpJZiB0aGUgY29uY2VybiBpcyB0aGUgaW1wb3J0ZXIgdG91Y2hpbmcgdGhlIHRhYmxl
IHdoZW4gaXQgc2hvdWxkbid0Li4ud2h5IGlzIHRoaXMgb2s/DQoNCkkgdW5kZXJzdGFuZCB0aGF0
IHlvdSBhcmUgb25seSBjb3B5aW5nIHRoZSBkbWEgaW5mby4uLmJ1dCBpZiBJIGRvIHNvbWV0aGlu
ZyBsaWtlIGZvcl9lYWNoX3NnKCkuLi4gd2lsbA0KdGhhdCB0YWtlIG1lIHRvIHRoZSBvcmlnaW5h
bD8NCg0KSSBraW5kYSB0aGluayB0aGF0IGtlZXBpbmcgdGhpcyBpbmZvIGluYWNjZXNzaWJsZSB0
byB0aGUgaW1wb3J0ZXIgd291bGQgbWFrZSBtb3JlIHNlbnNlPyAgKGhvd2V2ZXIgSSBzZWUNCnRo
ZSBwcm9ibGVtIHRoYXQgd2UgY2FuJ3QgbWFrZSBpdCBwYXJ0IG9mIHRoZSBkbWEtYnVmIHN0cnVj
dCBiZWNhdXNlIHRoZXJlIGNvdWxkIGJlIG11bHRpcGxlIGltcG9ydGVycy4uLikNCg0KSG1tLiAg
WW91IGRvIHNheSB0aGF0IHRoaXMgaXMgInN0aWxsIGEgaGFjayIuLi4gc28gZG9pbmcgdGhpcyBp
cyBmb3IgdGhlIGRlYnVnIHB1cnBvc2VzIGFuZCB3aWxsIGdvIGF3YXkgd2l0aCB0aGUNCmZ1dHVy
ZSBzdGVwcz8NCg0KSWYgdGhhdCBpcyB0aGUgcGxhbiwgKGFuZCB3aXRoIHRoZSBpbmRlbnRhdGlv
biBpc3N1ZSBmaXhlZCk6DQoNClJldmlld2VkLWJ5OiBNaWNoYWVsIEouIFJ1aGwgPG1pY2hhZWwu
ai5ydWhsQGludGVsLmNvbT4NCg0KTWlrZQ0KDQo+Pj4gKwkqc2dfdGFibGUgPSB0bzsNCj4+PiAr
CXJldHVybiAwOw0KPj4+ICsNCj4+PiArZnJlZV90bzoNCj4+PiArCWtmcmVlKHRvKTsNCj4+PiAr
CXJldHVybiByZXQ7DQo+Pj4gK30NCj4+PiArDQo+Pj4gK3N0YXRpYyB2b2lkIGRtYV9idWZfZGVt
YW5nbGVfc2dfdGFibGUoc3RydWN0IHNnX3RhYmxlICoqc2dfdGFibGUpDQo+Pj4gK3sNCj4+PiAr
CXN0cnVjdCBzZ190YWJsZSAqY29weSA9ICpzZ190YWJsZTsNCj4+PiArDQo+Pj4gKwlpZiAoIUlT
X0VOQUJMRUQoQ09ORklHX0RNQUJVRl9ERUJVRykpDQo+Pj4gKwkJcmV0dXJuOw0KPj4+ICsNCj4+
PiArCSpzZ190YWJsZSA9ICh2b2lkICopY29weS0+c2dsWzBdLnBhZ2VfbGluazsNCj4+PiArCXNn
X2ZyZWVfdGFibGUoY29weSk7DQo+Pj4gKwlrZnJlZShjb3B5KTsNCj4+PiB9DQo+Pj4NCj4+PiBz
dGF0aWMgaW5saW5lIGJvb2wNCj4+PiBAQCAtMTEzOSw3ICsxMTc3LDkgQEAgc3RydWN0IHNnX3Rh
YmxlDQo+KmRtYV9idWZfbWFwX2F0dGFjaG1lbnQoc3RydWN0DQo+Pj4gZG1hX2J1Zl9hdHRhY2ht
ZW50ICphdHRhY2gsDQo+Pj4gCQlpZiAocmV0IDwgMCkNCj4+PiAJCQlnb3RvIGVycm9yX3VubWFw
Ow0KPj4+IAl9DQo+Pj4gLQltYW5nbGVfc2dfdGFibGUoc2dfdGFibGUpOw0KPj4+ICsJcmV0ID0g
ZG1hX2J1Zl9tYW5nbGVfc2dfdGFibGUoJnNnX3RhYmxlKTsNCj4+PiArCWlmIChyZXQpDQo+Pj4g
KwkJZ290byBlcnJvcl91bm1hcDsNCj4+Pg0KPj4+IAlpZiAoSVNfRU5BQkxFRChDT05GSUdfRE1B
X0FQSV9ERUJVRykpIHsNCj4+PiAJCXN0cnVjdCBzY2F0dGVybGlzdCAqc2c7DQo+Pj4gQEAgLTEy
MjAsNyArMTI2MCw3IEBAIHZvaWQgZG1hX2J1Zl91bm1hcF9hdHRhY2htZW50KHN0cnVjdA0KPj4+
IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoLA0KPj4+DQo+Pj4gCWRtYV9yZXN2X2Fzc2VydF9o
ZWxkKGF0dGFjaC0+ZG1hYnVmLT5yZXN2KTsNCj4+Pg0KPj4+IC0JbWFuZ2xlX3NnX3RhYmxlKHNn
X3RhYmxlKTsNCj4+PiArCWRtYV9idWZfZGVtYW5nbGVfc2dfdGFibGUoJnNnX3RhYmxlKTsNCj4+
PiAJYXR0YWNoLT5kbWFidWYtPm9wcy0+dW5tYXBfZG1hX2J1ZihhdHRhY2gsIHNnX3RhYmxlLCBk
aXJlY3Rpb24pOw0KPj4+DQo+Pj4gCWlmIChkbWFfYnVmX3Bpbl9vbl9tYXAoYXR0YWNoKSkNCj4+
PiAtLQ0KPj4+IDIuNDMuMA0KPj4NCg0K
