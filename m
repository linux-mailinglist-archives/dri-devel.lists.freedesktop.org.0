Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B31F383A624
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 10:59:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC5F10F6AD;
	Wed, 24 Jan 2024 09:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBCB10F6B9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 09:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1706090372; x=1737626372;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=eDHCqpnalzsn7Pgl/inq/kCeKF+dyyKcc0+BaFgJBmk=;
 b=yLCzB42n+vj5W2bkTtMrNTi3mzD22Ke416KGNyc/NJ+C52B/YmQgdoq7
 NdXC9lT8WKzJihTg9bp4ufrYjbRJpAwz5H0asaLHNiHpS6FwhOmImSK/a
 qdmnJ8s1wzEWawTQfusqCR0lMN0gbPByQDssP2P1wlPs13DyC+PthhwEK
 6C3xet/T91Jd82gmazJjcuyr3jnuXO5wSqRuNN9VTo+RTqZCWmmDd23Ba
 3Gd7LfF/Ye7gjKf2B7uXWyx54IUVDm4Df2NeYeonEg2THWo0eoTMFHHIp
 VaexOj3vJVm3gWK8bYjo949mBIVMHjnSMx3gspj08QG85ZsCc2tBVP9Qp g==;
X-CSE-ConnectionGUID: cojQwK14R4mmQ77dAkzMOg==
X-CSE-MsgGUID: SG37yC98TNiPy8d3QFBE1g==
X-IronPort-AV: E=Sophos;i="6.05,216,1701154800"; d="scan'208";a="245937421"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Jan 2024 02:59:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 02:58:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 02:58:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ar1TkVoI+nDe02LIP+wJeaTi2Qax7U1Yn8iZZ4MZMqgfm/oDGD04FXLMErMd0JCV3h6ww7aI02GdD+cEAz+fomQHTakDn3gtn7OFAlSG24Mo11cooBZP3QygPvOf5jdv+ndmwC4R/W+dzjzgBJ44RnAR6DU1PXeE7oDVEjWZGOaC7Ugtd9EMhwBR8F1wryoVzdUqnBdPyySG1ysBpnkZbOLM0hlZbipOT+ZcZsuBT13Wo4T4FftPVEq9EwhUb97EpJGWw/bzE3iWLje6NYuOrmCfX7MmUESG6EdnpN/7IYAN1Jq9heZJUi7QykPxzaXaytlfJInKLPmvR3ez8/EQbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDHCqpnalzsn7Pgl/inq/kCeKF+dyyKcc0+BaFgJBmk=;
 b=SoEN/UoMRvRs5Jbx/Qw7QS62pmsi7+VK2LmETmwNCG9ztxHOHxurVfxeTwu6k/YTq0wG6dVcq6lxlyyMHxmcLcwyWHi3QRhnqNv8CZMk/kNKMcw19LXgbgw17slORnwQ6MsbIul6OKOZq6OVfou/XI3dcaN9m5jtrUdLjuJfQn4DLQELgGF0J7m+WV5mSc/h3piWh6QbhrpGehK88UFqklPZDYBAXVBKMRE54JnvITA/0btLETdp/nAOu3/o3CrCI1FxacuhrvR7plANmKr4FqeK0WhLUxZs7Cxy646WoTK/Rou/kZR6bhCrlKObpByYmVk9UPsaGa6U830igdGIgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDHCqpnalzsn7Pgl/inq/kCeKF+dyyKcc0+BaFgJBmk=;
 b=0NYM/q/KHyzTTcv7bQ4c243Ro8gjyByERB5aR21EelXQPLJNUzIaNVFN3PtYGWl/QouM68WBtlMNBg5nmbXOqGpLTzpSpXRCO4RqtcCza78YzeXK6u+mKat6w7j19ERXbVir3OJjBuTVSAaIeP9Mw0PdaDTiCAfw/0ewoMTLbV1Fz6WcLdm1+ktJhHZez40KyDtI1qmorOp4wXYhjFCys3RdMtI6MhZ4U9MWJ+EsnILpaZth09xUqWzAGCmIt/stZ6bl58bmjyBIqTOEpZtI+QDIOdpidQlDEdpgKn5q5tUIcnrI7yVGtMqI7AT+16bqNxSapKUX63RvzDaPLk6kag==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by SA2PR11MB5001.namprd11.prod.outlook.com (2603:10b6:806:118::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 09:58:47 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 09:58:47 +0000
From: <Dharma.B@microchip.com>
To: <robh@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: atmel, hlcdc: convert pwm bindings to
 json-schema
Thread-Topic: [PATCH v3 2/3] dt-bindings: atmel, hlcdc: convert pwm bindings to
 json-schema
Thread-Index: AQHaSfB3xKaoSF1iTEm2rEaqjzNrorDhjEEAgAc3tIA=
Date: Wed, 24 Jan 2024 09:58:46 +0000
Message-ID: <58641356-8039-47c4-9e5c-36c6c76877cd@microchip.com>
References: <20240118092612.117491-1-dharma.b@microchip.com>
 <20240118092612.117491-3-dharma.b@microchip.com>
 <20240119194534.GA938671-robh@kernel.org>
In-Reply-To: <20240119194534.GA938671-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|SA2PR11MB5001:EE_
x-ms-office365-filtering-correlation-id: c2b292ae-e8db-4f0a-5476-08dc1cc30ea9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MW3/DKW70AwRfp/uRP5irY7UrNf9gfEAYU64xAboDBKqhq6X2W4e1oLXUnge7VQ8A+vF4C23tGO4gwUKqI8iibX3EZs6ATwai8okn2wzn91GSQWy2GhKElm74fiS01SOtjzobDCssqtECF8ypruYBuajimsRdE/7vU5I6nMJXPTWH+3gDdfhnDFP9AmM0KwzIPOTCam3/TfmP9u1hLU1pJXVWuaSNO9AKrwmYSmm9yAkY8pejzDeVz4EcrkXyfRUdNApXoyBmdCtl46/ruOXETFjlO1Y7TwSng1NDsbOqPNdSoCbLmGvoA7TRTLLAySsH4VklANPjZN/y7NhOQlj3NUPKFtz0fqCrc6CwyPvnEnsBT9KBZ8Gdxygv0qc+zwxCDxorqORCpvqUw9EbUICgwe1oJZTV/Ogqoy6a3nh7DQdya8OMS+cU8nRx7WkjIPsevL4UH8BXTi3JNFElR19B291EhfApDL4DRXo9f3TeqUIUw62RIeyrskxpwp8mgvaQ1vvcQK3SxY24v6JApVBKiIEG5TO8mLxMUIn49il2ge5o0gyqmFl7ibjJy5w3qiW3QgZYkKhzNHT0BkJbYeKbG4N7xfb0yzg3N/gzSptCoAU42x25zKMicXVt2sUWgm8+HiFFgbb11rHa8JdJ4ROlm1Jeyhb6rdzdUei5GZoGkmA1lubDSfHQTBBNz419SP2hIszm5BNb6bWFacsVAaBs16yHwLqAdGmBmPUgB7zYhs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(376002)(39860400002)(136003)(230273577357003)(230173577357003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(26005)(107886003)(71200400001)(2616005)(6512007)(53546011)(5660300002)(6506007)(66556008)(8936002)(7416002)(8676002)(2906002)(4326008)(76116006)(966005)(478600001)(41300700001)(6486002)(66476007)(316002)(38100700002)(66446008)(54906003)(38070700009)(6916009)(64756008)(91956017)(83380400001)(66946007)(31686004)(122000001)(36756003)(31696002)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SG1keU8ra3o2U1JodVUwc0Q3bDlpeGhKOFUvQk9YK05GVDFXSzNZbVQ0NmFS?=
 =?utf-8?B?WkowZHFaQ29KVUlSSHNDMVFoLzNQd2I1aDdjQ1V2VVZ0b1dCQjN1Q0thMU1x?=
 =?utf-8?B?em14Sk16RVFHdVNlNjdsQVpWaS84L25vK1Z4K3R2ZmkwejRydEp4bGtaT2xU?=
 =?utf-8?B?OC8rQk1lR2xsTjJDZ0o5NFhVRE11N2VlMzNEL2Z4bllNRlNYN3FhSjJWanNW?=
 =?utf-8?B?Z3paOTFXQnhpamxMVW9KNmZkOFRkUGFha1ZRMUNRYXF5ZjdKRmI3Y1Nxc3Rt?=
 =?utf-8?B?SzI5TjJUWk50WW9EMU5peWp4MEkwUENPamFXTTRYaEt4RGlZU1BDRG9HNE1H?=
 =?utf-8?B?aXZjRnZnQ2JVMjU1MlJaSzJtUHZWd2xqSW00UFNrVTlEL1ZqZ1grQ3pETDdD?=
 =?utf-8?B?K0FPRDNGNEFucGZRdk5zY2tYNjZjaDJjenB1ODFwRnRBNEs5alhSM3dvRytm?=
 =?utf-8?B?WldZVUxNNWs5NGllVUcyVmRjQzRyWGxsZllWN294R0RXWHQyRGZqSlgrUWFU?=
 =?utf-8?B?Qk9uRG9Od0xuTkRsbzBCOWNMVWZZeEw2c1FUSkVMRWY3VTlybFdqcXo5UkFE?=
 =?utf-8?B?a1didEkvWEtXdisxL3pPRVZEY3Yxb3Y0czNZWFoxcUNWTy9sL2hKR3R1dUI3?=
 =?utf-8?B?a085d3VrM0oyM1NvR2g5U2tzZ25lUVJiWlFpRVo2TVRSY2FLSytVS0xqZlo1?=
 =?utf-8?B?cmthcHdpK3BWdFhtelUyejEyMDU0Wll1OUtkQkMrMHdyUmRWcXJLTWVJeXpP?=
 =?utf-8?B?Y2pHRytPUHQzcUNKSWI2SVFSdXh4UmozSkpnbU1EQzluOUpLMUxQU1NnODJC?=
 =?utf-8?B?R0xYRGRqY1kvcThQb3ZVcW5wS3NzVVQxUmFvRXdWbzVPTC9kMHFtbU1CNlFG?=
 =?utf-8?B?TnFKSTRMNjdrMVVQekNnNVp6Wk9weVRZNXFWV0dqUk5HTUhXMWhDNk1BRTBJ?=
 =?utf-8?B?V3ZkUHBzV3FMenJmRG1qaXl1QVRvdUpqN2t4QUNVNTF3RE93TVJoTTRobWR4?=
 =?utf-8?B?Q2NMemNORUh4WG04NkpvQ1IxZGk1N2VmNlI0U0NKN0JMYXZkZzVyUDBDNVpO?=
 =?utf-8?B?STlWUmExU01paUZ2YVJ2ZW9IZEZYemhJUC9UY1NmTlVZWVF6L0tXVEVCYlk3?=
 =?utf-8?B?NXlyYTVUdVQxSEtZdHBMUGUzSE12OWVnTFBLeExOd2hwK1ROdmw3dGpaQWpu?=
 =?utf-8?B?ejNLVjVpaFlRK0tPNW5UM3FGQ2lsS1BXTXgvWmE4NUtyK1hIdVV6WDBlQW0y?=
 =?utf-8?B?MENMYytOQ2p3blptbjM3a3FFcjFCYWwxZFh0K3NRSWJQVW4zSkhuSkdKNC9j?=
 =?utf-8?B?MEdUSHRaYTYvUFBQYXhnREJiWWptTHB0QVcvRnhpMFRiM0cyaDVNSkNBWWxy?=
 =?utf-8?B?RzlPaEJiSnErb1hIeDhXT25kSUZwcW1Zd1Bub3E1S0pncktVOCtHenVLMUhP?=
 =?utf-8?B?ZDZZRnJ4SmNJSDY3bU9QL1h0Vi9qM2NDZkxSM3phVWxwRCtKRG5FL3hwem12?=
 =?utf-8?B?N1JaMXluOFgvYmdxcU9uZXpUOThhWDRiZ09YdCtETTJZamZWUGJqK3Yzb3c4?=
 =?utf-8?B?ckd5aU9ZSjFDQWtySzNFRnl1OVl5Zko3Ym1XSmYzQ0Z3UkkrYzZMY2FjTmZu?=
 =?utf-8?B?L1RRbjNVRHgrSHRYandQbWZZb3RSNnJiNzFub3lMODRCZXNNTWNUazRicHF5?=
 =?utf-8?B?V3RERTY2L3kvYWxURTZJNjByRUhBNVlqU2ZsYkZUb09RVjcrODRlbCtFTkRk?=
 =?utf-8?B?TWRtclZKWUljUWx6WG9JNUgvUmN1dFdCS1FmZkpSYzZkY1NlelJUK3hmYThi?=
 =?utf-8?B?S1dpa2lxc0tnNWQ4bS9LZUh1YWdXbElBaW9ibWM0SWJla1c3TTB0c1V2Qmpz?=
 =?utf-8?B?RUh5cHFDcmpWdnNjOXA2K3BNeWZHOEhIZG9Pc1EwRkRqWVhXU1hqeGRxZlBX?=
 =?utf-8?B?ZzZTY0hhN25UNnhYMFNNeDEvbGlYb1NyRkNQcUpOUU93dnp6TmlGaC90T3NZ?=
 =?utf-8?B?Q1l1S0tnaGt6MTRVaTZVWkJWM3ZWN01IR3RIL2syS0srQWZMM0JLU2xaZHVo?=
 =?utf-8?B?OU90eHBaazFZNW5qaVppUEE5NWRKNHlWbTNwTmpySDRXOTlmVGN3ZmFpTmJh?=
 =?utf-8?Q?VzMS/zg4WcwvcTojPFlyYrz4M?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <077299D0E5B444438C56539192E1E749@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2b292ae-e8db-4f0a-5476-08dc1cc30ea9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 09:58:46.9362 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pUDLdH1e8GojR6n0ECRD1AO5k7R1+bhe87wF1bFwRWCYmptS4Nz18XSbFG9EzxVqixdXhc39LxFW+VV10BsznA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5001
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
Cc: Linux4Microchip@microchip.com, linux-pwm@vger.kernel.org,
 alexandre.belloni@bootlin.com, dri-devel@lists.freedesktop.org,
 Nicolas.Ferre@microchip.com, Conor.Dooley@microchip.com,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 claudiu.beznea@tuxon.dev, airlied@gmail.com, sam@ravnborg.org, lee@kernel.org,
 u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org,
 conor+dt@kernel.org, tzimmermann@suse.de, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLA0KT24gMjAvMDEvMjQgMToxNSBhbSwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IEVYVEVS
TkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3Mg
eW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gVGh1LCBKYW4gMTgsIDIwMjQg
YXQgMDI6NTY6MTFQTSArMDUzMCwgRGhhcm1hIEJhbGFzdWJpcmFtYW5pIHdyb3RlOg0KPj4gQ29u
dmVydCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgQXRtZWwncyBITENEQyBQV00gY29udHJvbGxl
ciB0byBZQU1MDQo+PiBmb3JtYXQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogRGhhcm1hIEJhbGFz
dWJpcmFtYW5pIDxkaGFybWEuYkBtaWNyb2NoaXAuY29tPg0KPj4gUmV2aWV3ZWQtYnk6IENvbm9y
IERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+PiAtLS0NCj4+IGNoYW5nZWxv
Zw0KPj4gdjIgLT4gdjMNCj4+IC0gUmVtb3ZlICd8JyBpbiBkZXNjcmlwdGlvbiwgYXMgdGhlcmUg
aXMgbm8gZm9ybWF0dGluZyB0byBwcmVzZXJ2ZS4NCj4+IC0gRGVsZXRlIHRoZSBkZXNjcmlwdGlv
biBmb3IgcHdtLWNlbGxzLg0KPj4gLSBEcm9wIHRoZSBsYWJlbCBmb3IgcHdtIG5vZGUgYXMgaXQg
bm90IHVzZWQuDQo+PiB2MSAtPiB2Mg0KPj4gLSBSZW1vdmUgdGhlIGV4cGxpY2l0IGNvcHlyaWdo
dHMuDQo+PiAtIE1vZGlmeSB0aXRsZSAobm90IGluY2x1ZGUgd29yZHMgbGlrZSBiaW5kaW5nL2Ry
aXZlcikuDQo+PiAtIE1vZGlmeSBkZXNjcmlwdGlvbiBhY3R1YWxseSBkZXNjcmliaW5nIHRoZSBo
YXJkd2FyZSBhbmQgbm90IHRoZSBkcml2ZXIuDQo+PiAtIFJlbW92ZSBwaW5jdHJsIHByb3BlcnRp
ZXMgd2hpY2ggYXJlbid0IHJlcXVpcmVkLg0KPj4gLSBEcm9wIHBhcmVudCBub2RlIGFuZCBpdCdz
IG90aGVyIHN1Yi1kZXZpY2Ugbm9kZSB3aGljaCBhcmUgbm90IHJlbGF0ZWQgaGVyZS4NCj4+IC0t
LQ0KPj4gICAuLi4vYmluZGluZ3MvcHdtL2F0bWVsLGhsY2RjLXB3bS55YW1sICAgICAgICAgfCA0
NCArKysrKysrKysrKysrKysrKysrDQo+PiAgIC4uLi9iaW5kaW5ncy9wd20vYXRtZWwtaGxjZGMt
cHdtLnR4dCAgICAgICAgICB8IDI5IC0tLS0tLS0tLS0tLQ0KPj4gICAyIGZpbGVzIGNoYW5nZWQs
IDQ0IGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQ0KPj4gICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9hdG1lbCxobGNkYy1wd20u
eWFtbA0KPj4gICBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3B3bS9hdG1lbC1obGNkYy1wd20udHh0DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vYXRtZWwsaGxjZGMtcHdtLnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL2F0bWVsLGhsY2RjLXB3bS55YW1s
DQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMDAwLi40ZjRjYzIx
ZmU0ZjcNCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9wd20vYXRtZWwsaGxjZGMtcHdtLnlhbWwNCj4+IEBAIC0wLDAgKzEsNDQgQEAN
Cj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNs
YXVzZSkNCj4+ICslWUFNTCAxLjINCj4+ICstLS0NCj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9zY2hlbWFzL3B3bS9hdG1lbCxobGNkYy1wd20ueWFtbCMNCj4+ICskc2NoZW1hOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4+ICsNCj4+ICt0aXRs
ZTogQXRtZWwncyBITENEQydzIFBXTSBjb250cm9sbGVyDQo+PiArDQo+PiArbWFpbnRhaW5lcnM6
DQo+PiArICAtIE5pY29sYXMgRmVycmUgPG5pY29sYXMuZmVycmVAbWljcm9jaGlwLmNvbT4NCj4+
ICsgIC0gQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPg0K
Pj4gKyAgLSBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPj4gKw0K
Pj4gK2Rlc2NyaXB0aW9uOg0KPj4gKyAgVGhlIExDREMgaW50ZWdyYXRlcyBhIFB1bHNlIFdpZHRo
IE1vZHVsYXRpb24gKFBXTSkgQ29udHJvbGxlci4gVGhpcyBibG9jaw0KPj4gKyAgZ2VuZXJhdGVz
IHRoZSBMQ0QgY29udHJhc3QgY29udHJvbCBzaWduYWwgKExDRF9QV00pIHRoYXQgY29udHJvbHMg
dGhlDQo+PiArICBkaXNwbGF5J3MgY29udHJhc3QgYnkgc29mdHdhcmUuIExDRENfUFdNIGlzIGFu
IDgtYml0IFBXTSBzaWduYWwgdGhhdCBjYW4gYmUNCj4+ICsgIGNvbnZlcnRlZCB0byBhbiBhbmFs
b2cgdm9sdGFnZSB3aXRoIGEgc2ltcGxlIHBhc3NpdmUgZmlsdGVyLiBMQ0QgZGlzcGxheQ0KPj4g
KyAgcGFuZWxzIGhhdmUgZGlmZmVyZW50IGJhY2tsaWdodCBzcGVjaWZpY2F0aW9ucyBpbiB0ZXJt
cyBvZiBtaW5pbXVtL21heGltdW0NCj4+ICsgIHZhbHVlcyBmb3IgUFdNIGZyZXF1ZW5jeS4gSWYg
dGhlIExDREMgUFdNIGZyZXF1ZW5jeSByYW5nZSBkb2VzIG5vdCBtYXRjaCB0aGUNCj4+ICsgIExD
RCBkaXNwbGF5IHBhbmVsLCBpdCBpcyBwb3NzaWJsZSB0byB1c2UgdGhlIHN0YW5kYWxvbmUgUFdN
IENvbnRyb2xsZXIgdG8NCj4+ICsgIGRyaXZlIHRoZSBiYWNrbGlnaHQuDQo+PiArDQo+PiArcHJv
cGVydGllczoNCj4+ICsgIGNvbXBhdGlibGU6DQo+PiArICAgIGNvbnN0OiBhdG1lbCxobGNkYy1w
d20NCj4+ICsNCj4+ICsgICIjcHdtLWNlbGxzIjoNCj4+ICsgICAgY29uc3Q6IDMNCj4+ICsNCj4+
ICtyZXF1aXJlZDoNCj4+ICsgIC0gY29tcGF0aWJsZQ0KPj4gKyAgLSAiI3B3bS1jZWxscyINCj4+
ICsNCj4+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4+ICsNCj4+ICtleGFtcGxlczoN
Cj4+ICsgIC0gfA0KPj4gKyAgICBwd20gew0KPj4gKyAgICAgIGNvbXBhdGlibGUgPSAiYXRtZWws
aGxjZGMtcHdtIjsNCj4+ICsgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPj4gKyAg
ICAgIHBpbmN0cmwtMCA9IDwmcGluY3RybF9sY2RfcHdtPjsNCj4+ICsgICAgICAjcHdtLWNlbGxz
ID0gPDM+Ow0KPj4gKyAgICB9Ow0KPiANCj4gTW92ZSB0aGUgZXhhbXBsZSB0byB0aGUgTUZEIHNj
aGVtYS4gT3IganVzdCBkcm9wIGlmIGFscmVhZHkgdGhlcmUuDQoNCkFzIFNhbSBzdWdnZXN0ZWQg
SSB3aWxsIHNlbmQgdjQgc2VyaWVzIHdpdGggdGhpcyBiaW5kaW5nIGFzIGl0IGlzIGFuZCANCndp
bGwgc2VuZCB0aGUgY2xlYW4gdXAgcGF0Y2ggbGF0ZXIuDQoNCi0tIA0KVGhhbmtzLA0KRGhhcm1h
IEIuDQo+IA0KPiBSb2INCg0KDQoNCg==
