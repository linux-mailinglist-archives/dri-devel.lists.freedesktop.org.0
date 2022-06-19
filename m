Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04055550DB3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 01:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F3F10F0AB;
	Sun, 19 Jun 2022 23:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBCB210EC0C
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 23:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1655682844; x=1687218844;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=X0E5/e+BA22zMfK7GPDN+OLAJ1IVDcoPqGOBUxZjQWY=;
 b=EaX7WJ1UUeBHXRe0ogJ7J0goiL9LnB1eN7j22MOM7s2KUvL4JF+VXjKk
 6hO6H88/n04z2PvEzDSubVVKvXl9QO+kB/BDmTinasx+vpyJxTsoPStkA
 cZ8RZQAW4hbt45/E2etj8CraAafrF1bSRRbMxvmT5A4gmUrng7z6pUkeH
 KvRmy2D7kh9OG/jYxlp28Qpdmio9x7aKzBrGBUvwsaUq1FQeUUsHNWS3+
 tkQJJQXkRLbyPwaXOzHy/qea83zGdZ3YOmP5mhhwYy+j0f7/96XQZWd5x
 wLzzzCt99XayQRowxRrAup1k8tJMu97CM7cbgAlWlP0jgRGF510cXPyhM w==;
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="100738154"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Jun 2022 16:54:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sun, 19 Jun 2022 16:54:02 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Sun, 19 Jun 2022 16:54:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a8GcTKG/Hkw6X5fqDznmGV2u8T879aPb3DhGxBB9cm9xncbe6mm7JjkOpUvXpFBz+M+yrs2F7Mum41sncl2B1SiH46lJNjrCHQuifUptIWWR2YaoqaQomn+foXn4lyZsO8UdRyEwYHDbGTVtMXzCUiKk61M2Ttv/UWxfa0sPPuEOzExzNjkRM/D5egud/scwa3E9g6yiGF8bEhVDLhBAQxD2LubbLbJUvZpux2kC5AgJ891u4VEw8xQDQ3leTYeuNCYS3tWd0oRVOCgsNEjRtqPgyyy0WtDnEXjmv4B9WJQ/YWc2xJqhmz3cvugLO9BE2Dzb/Zr3M3CLYSfnlzSzeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0E5/e+BA22zMfK7GPDN+OLAJ1IVDcoPqGOBUxZjQWY=;
 b=NTq2uhz2CaANDvKfLF/6PPkaC59ORldrfMwUpGqrTGaO5sS9FXBmhCjJyhTLw3IL5OC9CCTDx0Z9c5KGGuShywTwpxYM/bt7Sl0mhmt5OFRKsxiLlvSH4lq8hNykGId9ajf5mwg+Rt0Fo5ErL4zXpfoPDfOvJNQVyyxDAQ1NI8VdXpAr5kcV8jM0ECeQLN57GR1UHO+F7U2/yvjAAFbmyQKmvkNfKpf4elav9YtWAsksfUY6+UXckmeOnUdH1W9AU+WqAD3KS4spSBaS0AQT7AWRrzKFvueASOxBu4FWwIc5Chu/Y8Wsi37MPZWOkuwsO53xMEc50EopgYOJFbVkoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0E5/e+BA22zMfK7GPDN+OLAJ1IVDcoPqGOBUxZjQWY=;
 b=apK8QV+EO2f0NqXAIcFtuvk755oPB7Dk9O46MaAotfmLmMznypA6n/w2SgdxpFmBz49A0WJaRMOQSkCtiKaR8bf4pDonJbxNS9aAn2CytvgtTNK2Tlaa6kE/3G0pAUSWhJD8GKvSbczcfpJGEx3gkBYewN8zDTIqD/3DNxswbJU=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN9PR11MB5418.namprd11.prod.outlook.com (2603:10b6:408:11f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Sun, 19 Jun
 2022 23:54:00 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5353.020; Sun, 19 Jun 2022
 23:54:00 +0000
From: <Conor.Dooley@microchip.com>
To: <damien.lemoal@opensource.wdc.com>, <mail@conchuod.ie>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <thierry.reding@gmail.com>,
 <sam@ravnborg.org>, <Eugeniy.Paltsev@synopsys.com>, <vkoul@kernel.org>,
 <lgirdwood@gmail.com>, <broonie@kernel.org>, <fancer.lancer@gmail.com>,
 <daniel.lezcano@linaro.org>, <palmer@dabbelt.com>, <palmer@rivosinc.com>
Subject: Re: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Thread-Topic: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Thread-Index: AQHYgw905RVeuSLdkUCudsZPOTg0Ga1XZVUAgAAEPQA=
Date: Sun, 19 Jun 2022 23:54:00 +0000
Message-ID: <e1fbf363-d057-1000-a846-3df524801f15@microchip.com>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-8-mail@conchuod.ie>
 <9cd60b3b-44fe-62ac-9874-80ae2223d078@opensource.wdc.com>
In-Reply-To: <9cd60b3b-44fe-62ac-9874-80ae2223d078@opensource.wdc.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a56271c-0e1a-4438-3f06-08da524efb73
x-ms-traffictypediagnostic: BN9PR11MB5418:EE_
x-microsoft-antispam-prvs: <BN9PR11MB5418159C0537B3922E8052D998B19@BN9PR11MB5418.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Of+4KpQabc6hDh1IdRHDUtNdFeNxOVzlvNnWzw/nT6bFS6z4qyIgmniE0aE0JgDWYLZfVsJX42dtbScPd5eMtQl+Ig/xayLMJawxObMzjBJ0IYhwN3ahWlSSoXFNdmGd14Gm+XbabgZszDu99rXodq1tUkVI22NrFsgHD11o6mYCE5o63JGJ420OX7yU9kl7NlUP7nMkPn3BmEKcqZNpDOVZ52HxfD6m3guGJftJfvrVvxlch1qDPoItQ16Gx12hVvz4xJwy0d26J4A6TMj2RA5CZWPnWy35mNMfDLY4CTqO1A8lVdqg2BVf/Cgwi92u61OzcKj8I3agPJSUYfP6/X9BZrMdMyh1nHsT09jDJ58VNGQfP5iuhPmhl10xJCUEBMT5pkXyZmKmQ/BhjTF4kljDMG74KsojW3SK3CaMMwppaQ+0OJuFEqGedz051d07En294fno5tGsL58H71AhcA2HVzidAPr5PGtBVgM5vawUBgeGgPZwrtdbIjPJpx5lwa9HFqzEgGPy0pqkaQyBYvuR8bRTtvPOcASUQTP/N+fBzToptyZTqJzTCwMrmexjD6hjcw2ednNK+DKfnUYQqZrQvoRnhZu9hbhStgRISIA72lCGqqtwPbcDycS5DTclBNAevnqO2mkjJyF4hI8iFUIN8Gw2TfQlfp+FqgIrJXgDw84JyfTbCDuqG6A2tZY3liBjQ179yp6Qx3b7LaJZBKApUkvJZ9p/kocwjpFZACFdBd8RXHCZC6Zk5Upk4y8wK6nj2xc0n2UlErJe8ISZwCmmgb51kIEOGN9gdmSKEcQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(38070700005)(71200400001)(31696002)(8676002)(91956017)(498600001)(83380400001)(76116006)(66556008)(66946007)(6486002)(64756008)(921005)(66446008)(4326008)(110136005)(316002)(122000001)(66476007)(86362001)(186003)(54906003)(53546011)(2616005)(6506007)(6512007)(38100700002)(26005)(8936002)(36756003)(2906002)(5660300002)(31686004)(7416002)(7406005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWtyQWhMVjlpbTNXVGIzSDBTRUlhM21IZUJPU3c3U1BlY0Z6VUNoMDVXRGEw?=
 =?utf-8?B?ZWhEZjIrODZPSitmOVdOZ3pDZENVVDJLRWtVb3A2NzdvU1lxaEJPVVVxUFhk?=
 =?utf-8?B?a2pXYWphY2RCa3NqRWxKM1BaQlMwS1ZvU3NBczRCSW0xRkFCYkZ2ZHh6WlNZ?=
 =?utf-8?B?VTJocWxOM0FjYjQwZ2xLcW1vbUtxUkUwUTF2VEloK1JIdU9TVkMzcVFCZW9a?=
 =?utf-8?B?dHN4cXhKNmFLU1U2THdPRnowL0hpbDNDVTBYSDlLVjdQRzM5YnE4cTdLYUJa?=
 =?utf-8?B?Tk1sRFlXYUlDdTNoc2puaklPK3BMRndPUXRlbFlSTC95WldBN3UxSXNOMzJC?=
 =?utf-8?B?VWtqdWlNSVFNN2NBenJaVEFFUHZMTnh5UzNOSlliR3pJV1BCa1dFaWZCRVpm?=
 =?utf-8?B?Vk1aU3BUYW1BNWZBUElHWkc3UWVBb3ZmK2FvazBmQkhka3RlTXdJMVVQQlFu?=
 =?utf-8?B?d1Bsa3FWWklHdXpIRklkYm9wNmM2d1RXekFidCtURi80YlVBQzJoQ1Y0a1dp?=
 =?utf-8?B?dWxwMElGc1FUM0hVSHRrVFB6NkhlcGtEOXE2OHhINStXbUhnOXZCd3VUTXhT?=
 =?utf-8?B?TUI0VWlacmlQNitCbHZZSUtoUTdGK0pUbm53b1pFa1VSeWszTjU2Vm15YlQw?=
 =?utf-8?B?WDhqWnFsR3pyUWdMMTdZYmVOVmVvZ1I0SGZMeXU4Y1BMMTM3ZUFROWJEUEhr?=
 =?utf-8?B?VGhkZnE1Z0gxTzBHckJvaU9Cd1VGZmJtMzNDRU9NdzhMR3Zkdm1XVXlMYVkz?=
 =?utf-8?B?N2tkTDFXYjdhMGxTTjhGc1VDVWZCdXowS3RvVFVuMVNicEhtVDRhQUtEWkhq?=
 =?utf-8?B?T3FRZUVOZjFwSmZZdG56bmtyZDNBVnNmYXNwTm1keW8wSTVvZksySjN6SkNw?=
 =?utf-8?B?V2lLSWVucG9IbTNKazJabUtHVFZWNk9ac2Rhc1B4VmVYK1lPZ1FWWFNNRFBM?=
 =?utf-8?B?by9BTzlzNFlrME12VzVZbXl6M3FWV3BDS0JOTFpMbTgrRnJaUjZtYk9hWHd2?=
 =?utf-8?B?bDFwdnJMTVBIZnUyUzlFYmpvYWQ1dFlOcGo5MC8zTkJSallleFNvNlJ6Um5w?=
 =?utf-8?B?UFVXVHZSSDZ0dTNTa095ZTNoUFNRV20zWHpEdWtPcHJPMzIxVi9zOFBaQ1hX?=
 =?utf-8?B?OUozRmI5Z2I3akk3ZVVwQlZ2bjdQTnJ4MHo4SnVxamZqRzc2a2wrUFlub2JF?=
 =?utf-8?B?UUtXWSs0d1IyMjRIM2RaUXBtR1lnSUNCbTBaQU80U1JDK0VwRi9mckJMZFBN?=
 =?utf-8?B?eHk0OUtpL3Vjc1RoQ2VKUUNkMUdiaUYzdHczbjRkSGIzd0cxYnpCRldPV0xS?=
 =?utf-8?B?cUpza01Gdms5ZU5ONjByTExpQXJEcFppNy9CWWJUYzlRdVl6WGhOb2FkclVP?=
 =?utf-8?B?VE1MWTBWVU8zcDd5UjlnZC96WWZNdnE4Nkp5ODBBNVRVY0VtSlVsYVM5c2VK?=
 =?utf-8?B?TGw0cWZmekRpVUk3OWxsR2RuZXR3YkdtKzFLYVZpU2RLRTBBSXJ6STA0Z2kx?=
 =?utf-8?B?emlwOHE4cm5JOVp4dStRbkR5RGRxV1dsa09TSlhXZnRwY2U0bTgzMGdIU1pQ?=
 =?utf-8?B?Vzh3TkdTLzArM2craTRpSEtZOXV1SkZTWGZIYmJLWTJkM0V0YmNHcDZTTHJ0?=
 =?utf-8?B?N1kwQ28yOWFjUE9oZGQvUUVNMU14RFFqWStVcktxTTdyWUNMSWEram1wNnJB?=
 =?utf-8?B?U0ZpWnZXVE1mNm8xTkRGOXZPNnNtbWVpcmdRTVlWUks1b2huZXU2Rzh5VWFl?=
 =?utf-8?B?Y3VYYURxTTdkN3Njb0QzU2xCMm13akNQcG04d2xEZmNScWtEeGlpTjAwM1Iv?=
 =?utf-8?B?ZXMyS1QxaUkwNEdta2c3WGd4eWljdEUxREQ1bmdhMFlYcUpOa3VSSDR3Z3Nt?=
 =?utf-8?B?QmFkRnNyd1JIWWJLU2I0NTFRdjAwRnFJTkc4Qng3N1dPY21uMFVzbHNBNHIz?=
 =?utf-8?B?SFF6Z2pDMTFzUU9LOU9QK2ZhTXR4bEVPZ2tnVGlQMXRkaXdXN2JGWEw2bkh2?=
 =?utf-8?B?RjN1Y3ZpRGxyRFV3aitXc1lSbGQyZTF2Ukw4cmIvNmFLUjR6YUx2b2xuaUFN?=
 =?utf-8?B?UkNKNXRXQTB2UGlaWDlHeEZKaldsWHdMZzA3TUVHbStPWm1lV3RhdkJMV3Ux?=
 =?utf-8?B?bmtWd3g0TytFMit0Qm53WXM0V1YxS01XaXhCQ2JTeitMUWdQZWM4R29Xb0pr?=
 =?utf-8?B?emVVRmEveUF6YWFTcHhtWmVpeTVHeWRSZXYwWjJ1VmpUOVZsU1Y0RCtuQVZo?=
 =?utf-8?B?eEw1NXZVUDhpaTUyNVUxdm52bjNZd3A3aDB4My9OM2dLN3BvazcvK3Z6WUhF?=
 =?utf-8?B?R3EvTXJkUnNHQUkranJjYmFVcS9Id1VveTZhZXlDU0xueVZRelZtZURNNVd4?=
 =?utf-8?Q?1BdcoYpRIKQluQWY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF34058018383E4DA3BF723FA6380DB0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a56271c-0e1a-4438-3f06-08da524efb73
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2022 23:54:00.5594 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vntB/oyBqw7ypJC25Ro+uqYvSRzI93Sqej8Wn6JzswyMymAT/zP9M6vszeFc1xDbi/cyw6OwuCCopW+tS6kAcNmfp7r93Pf2+epAKsU7Mkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5418
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
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, aou@eecs.berkeley.edu,
 devicetree@vger.kernel.org, masahiroy@kernel.org, linux-kernel@vger.kernel.org,
 jee.heng.sia@intel.com, linux-spi@vger.kernel.org, joabreu@synopsys.com,
 geert@linux-m68k.org, dri-devel@lists.freedesktop.org,
 paul.walmsley@sifive.com, dmaengine@vger.kernel.org, tglx@linutronix.de,
 dillon.minfei@gmail.com, linux-riscv@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAvMDYvMjAyMiAwMDozOCwgRGFtaWVuIExlIE1vYWwgd3JvdGU6DQo+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gNi8xOC8yMiAyMTozMCwgQ29ub3IgRG9v
bGV5IHdyb3RlOg0KPj4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlw
LmNvbT4NCj4+DQo+PiBUaGUgazIxMCBtZW1vcnkgbm9kZSBoYXMgYSBjb21wYXRpYmxlIHN0cmlu
ZyB0aGF0IGRvZXMgbm90IG1hdGNoIHdpdGgNCj4+IGFueSBkcml2ZXIgb3IgZHQtYmluZGluZyAm
IGhhcyBzZXZlcmFsIG5vbiBzdGFuZGFyZCBwcm9wZXJ0aWVzLg0KPj4gUmVwbGFjZSB0aGUgcmVn
IG5hbWVzIHdpdGggYSBjb21tZW50IGFuZCBkZWxldGUgdGhlIHJlc3QuDQo+Pg0KPj4gU2lnbmVk
LW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+IC0t
LQ0KPj4gLS0tDQo+PiAgYXJjaC9yaXNjdi9ib290L2R0cy9jYW5hYW4vazIxMC5kdHNpIHwgNiAt
LS0tLS0NCj4+ICAxIGZpbGUgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9jYW5hYW4vazIxMC5kdHNpIGIvYXJjaC9yaXNjdi9i
b290L2R0cy9jYW5hYW4vazIxMC5kdHNpDQo+PiBpbmRleCA0NGQzMzg1MTQ3NjEuLjI4N2VhNmVl
YmU0NyAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvY2FuYWFuL2syMTAuZHRz
aQ0KPj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9jYW5hYW4vazIxMC5kdHNpDQo+PiBAQCAt
NjksMTUgKzY5LDkgQEAgY3B1MV9pbnRjOiBpbnRlcnJ1cHQtY29udHJvbGxlciB7DQo+Pg0KPj4g
ICAgICAgc3JhbTogbWVtb3J5QDgwMDAwMDAwIHsNCj4+ICAgICAgICAgICAgICAgZGV2aWNlX3R5
cGUgPSAibWVtb3J5IjsNCj4+IC0gICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJjYW5hYW4sazIx
MC1zcmFtIjsNCj4+ICAgICAgICAgICAgICAgcmVnID0gPDB4ODAwMDAwMDAgMHg0MDAwMDA+LA0K
Pj4gICAgICAgICAgICAgICAgICAgICA8MHg4MDQwMDAwMCAweDIwMDAwMD4sDQo+PiAgICAgICAg
ICAgICAgICAgICAgIDwweDgwNjAwMDAwIDB4MjAwMDAwPjsNCj4+IC0gICAgICAgICAgICAgcmVn
LW5hbWVzID0gInNyYW0wIiwgInNyYW0xIiwgImFpc3JhbSI7DQo+PiAtICAgICAgICAgICAgIGNs
b2NrcyA9IDwmc3lzY2xrIEsyMTBfQ0xLX1NSQU0wPiwNCj4+IC0gICAgICAgICAgICAgICAgICAg
ICAgPCZzeXNjbGsgSzIxMF9DTEtfU1JBTTE+LA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICA8
JnN5c2NsayBLMjEwX0NMS19BST47DQo+PiAtICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gInNy
YW0wIiwgInNyYW0xIiwgImFpc3JhbSI7DQo+PiAgICAgICB9Ow0KPiANCj4gVGhlc2UgYXJlIHVz
ZWQgYnkgdS1ib290IHRvIHNldHVwIHRoZSBtZW1vcnkgY2xvY2tzIGFuZCBpbml0aWFsaXplIHRo
ZQ0KPiBhaXNyYW0uIFN1cmUgdGhlIGtlcm5lbCBhY3R1YWxseSBkb2VzIG5vdCB1c2UgdGhpcywg
YnV0IHRvIGJlIGluIHN5bmMgd2l0aA0KPiB1LWJvb3QgRFQsIEkgd291bGQgcHJlZmVyIGtlZXBp
bmcgdGhpcyBhcyBpcy4gUmlnaHQgbm93LCB1LWJvb3QgKmFuZCogdGhlDQo+IGtlcm5lbCB3b3Jr
IGZpbmUgd2l0aCBib3RoIHUtYm9vdCBpbnRlcm5hbCBEVCBhbmQgdGhlIGtlcm5lbCBEVC4NCg0K
UmlnaHQsIGJ1dCB1bmZvcnR1bmF0ZWx5IHRoYXQgZGVzaXJlIGFsb25lIGRvZXNuJ3QgZG8gYW55
dGhpbmcgYWJvdXQNCnRoZSBkdGJzX2NoZWNrIGNvbXBsYWludHMuDQoNCkkgZ3Vlc3MgdGhlIGFs
dGVybmF0aXZlIGFwcHJvYWNoIG9mIGFjdHVhbGx5IGRvY3VtZW50aW5nIHRoZSBjb21wYXRpYmxl
DQp3b3VsZCBiZSBtb3JlIHBhbGF0YWJsZT8NCg0KVGhhbmtzLA0KQ29ub3IuDQoNCg0KDQo=
