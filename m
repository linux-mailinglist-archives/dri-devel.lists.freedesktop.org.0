Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ACE55BB79
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 20:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1995311AA9E;
	Mon, 27 Jun 2022 18:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3300C11AA9E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 18:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1656353147; x=1687889147;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jZk/JbbHouGijU0bHYxj5ANsT2FgUgoTS9HYC+K1d6Y=;
 b=GcK0N0oJnj7RL8mpT4ijxIIF7RcWyD3MDSv1aZ+dq+F8fzov0YhlKxjx
 QjeJuIiTqjNCMdJEl90wJ1eQd6tWZdTDKOAi/ARiJWgHJC4Q8U8Q9b86R
 uk/rdHDfUr8obMGH/aoqYBkV5WhXuh8kogX/jdglskYJGfhk0fpNLHwz6
 7jvZcmokMckUxwWChCha1mhFsFI5pnkY9Cy81IyPyd7+WRWcu65k6HIIF
 9nDCAaSE18AAgMHKBJ0iRFsx8PIO9AMZnPIxUzP/dk9LM6vuxSHPg80LP
 /Ll5aPW8XptAjhC8uPHEFWqGR3TamLqJ1ficUvd1x/tAt3rJl0A3ng7o4 w==;
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="165295260"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Jun 2022 11:05:46 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 27 Jun 2022 11:05:45 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 27 Jun 2022 11:05:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4Pu7qCv4ShRgPzG/qrH3iWZm4ea+Fh0jguRU7bwEpDyjBj79pXWwmiIf5p6By4FMOrKlR+KY0DtyeV7PBKYH8sgUYGZ/Vijv58dsefpnQFqjwNcwdSdjs1Rpoz8E+HmQdxvKPJxc0Ti6SZcbkmYpCUo4vQfIFzOMoIxrn1KMCX2n7Tl61OeQee3JAiiXuwxdDELEMWMqTB0GbWORR5R5rcPB3cXoUVA3/xRr8sMdCewPDlkq//sA6vLpSFE5mkbzdzzINnvW9OHiSccq5Xrb98v9hT1EKjAWr/9FUq55LUwLK9AwzO23oSVdIF88g52OtUlEX1Ey9WsTd4Kth/OAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZk/JbbHouGijU0bHYxj5ANsT2FgUgoTS9HYC+K1d6Y=;
 b=YltOrSiB2C2QO44BTvukxBIRlKGI6JQT7FAurheU5Jkr6p4Wg0WCzC6lkK8wDPvhIsoalcbefesmzTIaklEynNt6o2GgzkOSBhQQXI5zn+M+cYGedldNWOampWQ1lFROGPiwoSxHRf9+bbQJcxrOtoGDtYpC4k2g1KiMqMhR52UpkOSv0db9+EZhty9ixS4rP8iI04UF9K/g576omziAssc0nubG1nwcidJW0TPvIzssE2QrCVf+LT+Xix3FdeiYgruPCzVzCRdYBX7b3yoTGycmWo8dyGqlhZM+d4pCQDrCwqhzxkXu3n+8GlLZlpADZtQ/kKe09PtlNGuEsN39lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZk/JbbHouGijU0bHYxj5ANsT2FgUgoTS9HYC+K1d6Y=;
 b=fro4JrCMRGR3ZDhp2wQyWwdPkOTrNe1lJYvdUZ1aYVjjO/wb5TEzpLdxMfOWF89dY2dWBepka1y+PKPKRXL33jDl3kHBVChoqjLjIlmM29spapB6YWu2RmQcvFCjwmT/3eJuyZ97c6t8gFoJKY+F6CcIutatXZ9ic/knz6O/KuA=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BL1PR11MB5382.namprd11.prod.outlook.com (2603:10b6:208:31c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Mon, 27 Jun
 2022 18:05:40 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 18:05:40 +0000
From: <Conor.Dooley@microchip.com>
To: <robh@kernel.org>
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Thread-Topic: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Thread-Index: AQHYgw+Pu1Tn+/2s8EmHi9NhXNIv361YymsAgAACs4CACr+gAIAADiaA
Date: Mon, 27 Jun 2022 18:05:40 +0000
Message-ID: <4b143eab-9905-a926-b3bc-10627cf0098e@microchip.com>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
 <20220620205654.g7fyipwytbww5757@mobilestation>
 <61b0fb86-078d-0262-b142-df2984ce0f97@microchip.com>
 <20220627171500.GA2600685-robh@kernel.org>
In-Reply-To: <20220627171500.GA2600685-robh@kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 583ddbaa-a6dd-417d-73be-08da5867a520
x-ms-traffictypediagnostic: BL1PR11MB5382:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sAWGaL7b6OZclb+HIG47GQLdhiJbeMtdLTHwdJFK3Q2299qcSQKpKFoOq/9IxvqAlR5mcpk0J0KQpb49XsxGcsAgMRNEcm2NwLwGYb2+9B7QkM4zm+73sFAfwucC4VfmZ9psXON79xUsFARjAGzqrybbqtOJ59UndghqXMq9293PMh2KVvUUUfpTslUADzXuULlC3+6+UuMmV5K54d9/oYTK6PNAcjbEy/fir14ejOhR//npXSAgHi31G2FaquPJ9xjKw7n5J3jZVtDYDu5TFiPWNK+978S3Za+3vyUq8beyA8C+SId+t/bkEusW4574npsW5mrfDvfipjEiWvFMHj0ISxRKTEoURisxvvGoLkKKSyKKV/7OT1rUbfZ87yZRS26fgUy09jmQfqCD2/Cy+5QdZwZNm4lCHDS0NAi++8YkkMZ4Xf7rLlKC6zkDix1AkN0Qh3zWfDXvQgR1WVf+6NSRwqH+AYxO0OOE0LdsiQiI6MbYjPqXS7NPtIIBqDK54RmFDrDPdGvNDgVWhbvqinN8vmelg7v7ivVMvJEDtas3U6TYt8F+90UBJFDX9hvpjqYTNuMtp1X0qQpqDqtO3Rhsq8JTTuM72KizOUCdQxVFLXt3t8ZmtOWVUY7JFD+vUxcgmXkxXGjyuvI7rutUYCOJI3Re8gYTrMNNPlTdmLMb3Lqwezq4SNqMZuY2OM2hMUq3EWKzibZsO5Gx7ke1xi0UjejPApPwKPPOCHW7GmextnQghZtW3jCEZyCHLCEq+6TZwb4/GP0AAtFX6m3n+SY0ELCqLtQE7dFkpFq/JE2r2+f79kwXTcYo9zE+voGTIBx4EJsToU5Tnf3a/ylENzOJxduyUSoUY/yUODBVNWk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39860400002)(136003)(396003)(376002)(346002)(2906002)(6506007)(15650500001)(122000001)(6916009)(186003)(478600001)(36756003)(53546011)(7416002)(38070700005)(31696002)(41300700001)(86362001)(316002)(31686004)(54906003)(8936002)(38100700002)(66476007)(6512007)(5660300002)(2616005)(4326008)(8676002)(91956017)(71200400001)(26005)(76116006)(66946007)(6486002)(66446008)(66556008)(64756008)(7406005)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDB0MERITURHVHAwbWxmbW8yTDYxRU5wTkJzT0V0c1VBcGpnNXpocmJLRk9z?=
 =?utf-8?B?dzVGZkFqN1ovNmxlY1pmYnpnNHFUL0QrUTUycUVGTi9Ycno4Mmt2M3BIbVdF?=
 =?utf-8?B?alpvL0dBcitqTElUdGFHNFJCWWtINVdFb21XWHpuZy94ZEttM3I3M1h4cUxW?=
 =?utf-8?B?WFFDUjlHRjVMZjNmeW5vQVJCTWcrUlVoNlNCbFJLa1hsTnRFT3BuSFpNUUZY?=
 =?utf-8?B?S2xocVdwRmQ1a245bzJnMVVQalR4b05oSm8zUUUvbWJ5OUtBcWJ4SjN3Q0JU?=
 =?utf-8?B?QUY0QlF5dmd1OXJUTnM2emIxR1NRUlpyNWZkcFYvV0R0OGg2ejVUaEpZZ0ZU?=
 =?utf-8?B?WkhpbVRTZDJKQSt4T1Z3NTIvUXpDL3Q1cDlGeGRnc1BubnVGNkNuczlKVFJl?=
 =?utf-8?B?Vkw3SDl3MHJDcWo5NW9sdjlxN0FWenhvNlR3ejNFVFMvL0JnL21ZV24reGZW?=
 =?utf-8?B?WEd2clhodlJvczJmeE05ZE9RR3ZvSUVjZG9DdlVGSmRoUGxSdkJWQTRaWWFY?=
 =?utf-8?B?dG13ekREeWs0RW5JUEtVdmpaaXZRTTY1TisxL2dab3JKeHNlaWRrWm1wWjdt?=
 =?utf-8?B?bjJHSWRzSnJWcU1rWW1IMGlrZlA1cU9zQ2NYTXB1V0YwNjhVU0xjU3RESlhW?=
 =?utf-8?B?NC90OTIrNG9NUWhnajRvcEwvTzBJUElMcXRmbTBOUG5Qd1oxNzd6cWQ5THFx?=
 =?utf-8?B?RW1GSkJ4RmI5QUI5aEMzQTNaK1duTjhPUnpLMkEybmFmUzZ2UnlIaWxoZENY?=
 =?utf-8?B?MHRUeGFWaXl5SmdDRE1JTDJLMmFoR2FxN0MrcExSUC96aEl1SkhzSjhMTVc3?=
 =?utf-8?B?OERXTHV0UkIyZ3MwNFB5SUJEV2Y0OGVzZDlMOWJxTU8va2xHT0xJQyt5YlNF?=
 =?utf-8?B?MGxNRktOSTRFbmZrWnVNaVhHRjlBc3pUNFlhL09LamdNUWpleDl4dFJJTWdM?=
 =?utf-8?B?bS8yUmJvdmQ1Q2phZ3o1NXkwVzVDM1NVRHZIWi9MZ1RXdDhkNzFSK3RaWkhz?=
 =?utf-8?B?bFNGRHJoSXhVOTA5K29lVjJhS2ZvY0RPbmxMd2Z5WEZrbDZvZzVTclJWUWpF?=
 =?utf-8?B?a1ppbzh2YVp1RGhaWG91TUJxb0kvaUlyUXdIUmR1eUlpWG5xVXV0WnIrWXJt?=
 =?utf-8?B?ZUR6bmgrblpzTW5PUkFHalg1eHVVYkJCZHEzeHp6cG5XdURMam1pUDNObEs2?=
 =?utf-8?B?MVoyVmpLVGF0L3NtWWI1MERXUDVvV2FmbmxIU0c2V2EybFNoS0oyek5Ob09P?=
 =?utf-8?B?RFpKUnFxSUpydTVTZXk5S3BmS1pZNURaSzdlb1N1dFFybEgyK0pSa0FMZGtj?=
 =?utf-8?B?VnM1UXVjcDNkS3R6MllldXlWYUF1ME5LM2JYYzMrckh0MncrSzUybFlTQ1li?=
 =?utf-8?B?MUhTSjZPRXJwUWtxclMzWVRyOVlza3ZmVnI0ZnJNV0lHbW8rTTkwL1lOMUw0?=
 =?utf-8?B?aHVsYUI2NExWZzhKSnNiWmNIYzdyQzNZU1BSYmExMWNlZmlKMk1JOXlDZ0ow?=
 =?utf-8?B?cm9ZdW5sUHRyak1rMEFRcmZvUFRpVGpadmlXVFlaTWVkQS9VajlBbHdCS29H?=
 =?utf-8?B?S0pGdFNnRjNmbjE2T0JoTTVVODZvNFFoOXlBNm9ac0M1RnRKTGpNcHBCUDl0?=
 =?utf-8?B?Z0ZsdFVVL20zYTJxbXA1OFAvQXNYVEtoMFFzMVlkZUJDQjBRUTlHRjF1dEN5?=
 =?utf-8?B?UTNMTDBuVDN5dEJZbkp1d0lLN0Mrbis3UGtqdnlJMHVLNW4zSzA1RlpkVjRI?=
 =?utf-8?B?SGw3M2RwTHVENURtU3V4ZmNpcVM2azVLZjNST2g0Z0xyNk1VNERSdmZUTWto?=
 =?utf-8?B?NkhraDBhUUdJQU1Tbno1dm1iRkVLSUFTL1ZoelFLbThZTDRkcWgzKzV0VGo1?=
 =?utf-8?B?WVlSRFVGbkxqbUhyS3ZueHBVQ1huc0dCZ0RVd0pQWm1JNGNUT0pJdXRadVhJ?=
 =?utf-8?B?cHJFUnZRNHp2Sk1pb3haQUNxdWpFWWxnaDZjZ2pBbU1zUDIybDhvYVhNWEJh?=
 =?utf-8?B?anBqM0FncjJienJQeEJ3U0JqMmhQTmZ6dzdVMzh0a0xLRUZZSEFqS0tGSFU4?=
 =?utf-8?B?WXZHMm1PSUVUOEp6OU1kYTZOSndXZTFaVXZLNm1zMTVmYU9wN3QvM0tLenJ2?=
 =?utf-8?B?dTJwNlQrdVRXV2FxalU0V3ZSZUxQQnpOQkRDeURuMjQwSTZlaDVRK3EwNDNa?=
 =?utf-8?B?WGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <671BECC7F1B437478D2868D3EB15E4DC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 583ddbaa-a6dd-417d-73be-08da5867a520
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 18:05:40.1433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tP+MJgXXrT/tWBavS26BJT/1QE6lkA08rEL/sVp9uk1pkzoK6yCl7pi+YFJijHEnYY8CteKlZ3ibGkc7R7R+W66PAe8zCnn0ifIu9gesWCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5382
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
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, airlied@linux.ie,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 jee.heng.sia@intel.com, krzysztof.kozlowski+dt@linaro.org,
 linux-riscv@lists.infradead.org, sam@ravnborg.org,
 damien.lemoal@opensource.wdc.com, daniel.lezcano@linaro.org,
 joabreu@synopsys.com, geert@linux-m68k.org, Eugeniy.Paltsev@synopsys.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, broonie@kernel.org,
 dri-devel@lists.freedesktop.org, paul.walmsley@sifive.com, mail@conchuod.ie,
 tglx@linutronix.de, dillon.minfei@gmail.com, lgirdwood@gmail.com,
 fancer.lancer@gmail.com, linux-spi@vger.kernel.org, vkoul@kernel.org,
 palmer@dabbelt.com, dmaengine@vger.kernel.org, masahiroy@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjcvMDYvMjAyMiAxODoxNSwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gTW9uLCBKdW4gMjAsIDIwMjIgYXQgMDk6MDY6
MzRQTSArMDAwMCwgQ29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBPbiAyMC8w
Ni8yMDIyIDIxOjU2LCBTZXJnZSBTZW1pbiB3cm90ZToNCj4+PiBFWFRFUk5BTCBFTUFJTDogRG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBj
b250ZW50IGlzIHNhZmUNCj4+Pg0KPj4+IE9uIFNhdCwgSnVuIDE4LCAyMDIyIGF0IDAxOjMwOjI4
UE0gKzAxMDAsIENvbm9yIERvb2xleSB3cm90ZToNCj4+Pj4gRnJvbTogQ29ub3IgRG9vbGV5IDxj
b25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+Pj4NCj4+Pj4gc25wcyxkd2Mtc3NpLTEuMDFh
IGhhcyBhIHNpbmdsZSB1c2VyIC0gdGhlIENhbmFhbiBrMjEwLCB3aGljaCB1c2VzIGENCj4+Pj4g
d2lkdGggb2YgNCBmb3Igc3BpLXtyLHR9eC1idXMtd2lkdGguIFVwZGF0ZSB0aGUgYmluZGluZyB0
byByZWZsZWN0DQo+Pj4+IHRoaXMuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERv
b2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+Pj4+IC0tLQ0KPj4+PiAgLi4uL2Jp
bmRpbmdzL3NwaS9zbnBzLGR3LWFwYi1zc2kueWFtbCAgICAgICAgIHwgNDggKysrKysrKysrKysr
KystLS0tLQ0KPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDEzIGRlbGV0
aW9ucygtKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3NwaS9zbnBzLGR3LWFwYi1zc2kueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zcGkvc25wcyxkdy1hcGItc3NpLnlhbWwNCj4+Pj4gaW5kZXggZTI1ZDQ0
YzIxOGYyLi5mMmI5ZTNmMDYyY2QgMTAwNjQ0DQo+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9zcGkvc25wcyxkdy1hcGItc3NpLnlhbWwNCj4+Pj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9zbnBzLGR3LWFwYi1zc2kueWFtbA0K
Pj4+PiBAQCAtMTM1LDE5ICsxMzUsNDEgQEAgcHJvcGVydGllczoNCj4+Pj4gICAgICAgIG9mIHRo
ZSBkZXNpZ253YXJlIGNvbnRyb2xsZXIsIGFuZCB0aGUgdXBwZXIgbGltaXQgaXMgYWxzbyBzdWJq
ZWN0IHRvDQo+Pj4+ICAgICAgICBjb250cm9sbGVyIGNvbmZpZ3VyYXRpb24uDQo+Pj4+DQo+Pj4+
IC1wYXR0ZXJuUHJvcGVydGllczoNCj4+Pj4gLSAgIl4uKkBbMC05YS1mXSskIjoNCj4+Pj4gLSAg
ICB0eXBlOiBvYmplY3QNCj4+Pj4gLSAgICBwcm9wZXJ0aWVzOg0KPj4+PiAtICAgICAgcmVnOg0K
Pj4+PiAtICAgICAgICBtaW5pbXVtOiAwDQo+Pj4+IC0gICAgICAgIG1heGltdW06IDMNCj4+Pj4g
LQ0KPj4+PiAtICAgICAgc3BpLXJ4LWJ1cy13aWR0aDoNCj4+Pj4gLSAgICAgICAgY29uc3Q6IDEN
Cj4+Pj4gLQ0KPj4+PiAtICAgICAgc3BpLXR4LWJ1cy13aWR0aDoNCj4+Pj4gLSAgICAgICAgY29u
c3Q6IDENCj4+Pj4gK2lmOg0KPj4+PiArICBwcm9wZXJ0aWVzOg0KPj4+PiArICAgIGNvbXBhdGli
bGU6DQo+Pj4+ICsgICAgICBjb250YWluczoNCj4+Pj4gKyAgICAgICAgY29uc3Q6IHNucHMsZHdj
LXNzaS0xLjAxYQ0KPj4+PiArDQo+Pj4+ICt0aGVuOg0KPj4+PiArICBwYXR0ZXJuUHJvcGVydGll
czoNCj4+Pj4gKyAgICAiXi4qQFswLTlhLWZdKyQiOg0KPj4+PiArICAgICAgdHlwZTogb2JqZWN0
DQo+Pj4+ICsgICAgICBwcm9wZXJ0aWVzOg0KPj4+PiArICAgICAgICByZWc6DQo+Pj4+ICsgICAg
ICAgICAgbWluaW11bTogMA0KPj4+PiArICAgICAgICAgIG1heGltdW06IDMNCj4+Pj4gKw0KPj4+
PiArICAgICAgICBzcGktcngtYnVzLXdpZHRoOg0KPj4+PiArICAgICAgICAgIGNvbnN0OiA0DQo+
Pj4+ICsNCj4+Pj4gKyAgICAgICAgc3BpLXR4LWJ1cy13aWR0aDoNCj4+Pj4gKyAgICAgICAgICBj
b25zdDogNA0KPj4+PiArDQo+Pj4+ICtlbHNlOg0KPj4+PiArICBwYXR0ZXJuUHJvcGVydGllczoN
Cj4+Pj4gKyAgICAiXi4qQFswLTlhLWZdKyQiOg0KPj4+PiArICAgICAgdHlwZTogb2JqZWN0DQo+
Pj4+ICsgICAgICBwcm9wZXJ0aWVzOg0KPj4+PiArICAgICAgICByZWc6DQo+Pj4+ICsgICAgICAg
ICAgbWluaW11bTogMA0KPj4+PiArICAgICAgICAgIG1heGltdW06IDMNCj4+Pj4gKw0KPj4+PiAr
ICAgICAgICBzcGktcngtYnVzLXdpZHRoOg0KPj4+PiArICAgICAgICAgIGNvbnN0OiAxDQo+Pj4+
ICsNCj4+Pj4gKyAgICAgICAgc3BpLXR4LWJ1cy13aWR0aDoNCj4+Pj4gKyAgICAgICAgICBjb25z
dDogMQ0KPj4+DQo+Pj4gWW91IGNhbiBqdXN0IHVzZSBhIG1vcmUgcmVsYXhlZCBjb25zdHJhaW50
ICJlbnVtOiBbMSAyIDQgOF0iIGhlcmUNCj4+DQo+PiA4IHRvbz8gc3VyZS4NCj4gDQo+IFRoZW4g
bm8gY29uc3RyYWludHMgbmVlZGVkIGJlY2F1c2UgdGhlIGNvbW1vbiBkZWZpbml0aW9uIGFscmVh
ZHkgaGFzDQo+IHRoaXMgcHJlc3VtYWJseS4NCg0KQWxtb3N0LCB0aGUgZGVmYXVsdCBoYXMgMCBp
biB0aGUgZW51bSB0b28uDQpJJ2xsIGdvIHdpdGggdGhhdCAtIHRoYW5rcyENCkNvbm9yLg0KDQo=
