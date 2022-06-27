Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8A355B954
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 13:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC22E11338E;
	Mon, 27 Jun 2022 11:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AD41134BD
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 11:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1656327787; x=1687863787;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Wp0kyNkmroTn9RCaxHByL3CuxFxtV2N+kxDE8aaKZ4k=;
 b=NkrOsT9EfnhbaDCQxjeC5XBVa9RB8wbmyP1g0Cca88ywRu4HWRCLNTiu
 UjdDOCuAHxmEV1IL66LvTduipsS6pXDdTtHofGO0zt/2luZtTV0SgXow0
 V/xjZUFuPkUKtNUbnNOg7Iv6kOXi3KjZPlwcpFhcT40vZH2FOSgoVfocp
 sbsC+ZL8YmouQHRb+yaKm4CKZr9LkXREYP1xVpLJW5aEv+BdajPkx26vr
 7XHNg2Qax/sKTTYX2Q9n86LzgZXULr2GmcH2ToPhsiDXuXgy1NgbSpXuj
 Ko0r3FfBk11BrvK7wsUxmIBMlLFOYOHVo7G0ISkgM1eoDsGlW7jBFKfbj g==;
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="169732728"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Jun 2022 04:03:05 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 27 Jun 2022 04:03:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 27 Jun 2022 04:03:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOGRbDh9tT0XOWLmrX/PVzclTBlTLhfWRCL59zl52gv3xF8NbBJwR/1oOLqDjo5bQ4dHeffStA+WDWbtBL1hp1T03y6AC+rMerNI9WakEimQA63vZWxf0pgKYwyoRz7lJy8MG595BLPwUWaxrcjSCAI0xGjZNMjwhKwk4sCk8bXjawPPl4aSZAZwd7oeg9I9lmCdiwivF5rt6UEzZ+h8FER5M3NezcLMsixvg5z6ayXqy50NpvRX+He1jfkJEbrMo2TkoZoSoAu/+uJix7+P+qehCLWKKVxWdY/O/p55JX8m3nRgrW+Z1XnarCVLjJ2pt9ReE5m+5/DFXxFiPx9Z/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wp0kyNkmroTn9RCaxHByL3CuxFxtV2N+kxDE8aaKZ4k=;
 b=POx9BDtlZDTOsnMvlxoQSNyjruWA26P90TILQA3BKn2VVFYAPlnevaqKZXvqpRENnkZO5j0PDhCPpgtBdbP9RV4hbA8DG+1rrVE0xyJWSK06Yu4yTJ4GRu9zX3xzlzvlk6W7FP/vj5B1YHwDhbLGst6RAdzipfUX9Kb+K/dA7ctSvSbLpkUyuBeJNltKe5xJEweK5GRKp7cEF0ClRJFyuT3CjiCBWtjhYw2cRenHxeEYRhBuppNz7RiIJKvcnjim8Sm5I9BjmqtBlQcRXK8czpuYEVKg+OS3EvZFtjmlIUuaLo9vyVkNgdBryJK/56VvvWX6tKNrSUQncLcfCuYAgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wp0kyNkmroTn9RCaxHByL3CuxFxtV2N+kxDE8aaKZ4k=;
 b=tzvWvsRUzwG0zwR28+Gd7es2SX093V93jUk6tb/Vq7vT/yzxzNd8qThxAx64qr/OJT7hb6duVlJsC7b/7+D4WpawvmRsw+8C/J92rld5KvrrdFef0EZFNXNI83oailT7db7eRq0Fq+ajACeqGyzwQoQ2e4A2obPTmhoOzts2VI4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN2PR11MB4677.namprd11.prod.outlook.com (2603:10b6:208:24e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Mon, 27 Jun
 2022 11:03:03 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 11:03:02 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <damien.lemoal@opensource.wdc.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Thread-Topic: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Thread-Index: AQHYgw905RVeuSLdkUCudsZPOTg0Ga1XZVUAgAAEPQCAAAjWAIACL32AgAk9twCAAAL9AIAAJpyAgAAbkgA=
Date: Mon, 27 Jun 2022 11:03:02 +0000
Message-ID: <626a079e-9640-b358-a452-6b226a619f34@microchip.com>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-8-mail@conchuod.ie>
 <9cd60b3b-44fe-62ac-9874-80ae2223d078@opensource.wdc.com>
 <e1fbf363-d057-1000-a846-3df524801f15@microchip.com>
 <891cf74c-ac0a-b380-1d5f-dd7ce5aeda9d@opensource.wdc.com>
 <6c9de242-6ccf-49a2-8422-e6949c5169ff@microchip.com>
 <70cd0066-9aa7-ca41-ad61-898d491328aa@linaro.org>
 <b8dce80e-2753-497e-1dd3-3eb0d248b74e@microchip.com>
 <430f5284-b107-e43c-7329-9e299093a352@linaro.org>
In-Reply-To: <430f5284-b107-e43c-7329-9e299093a352@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d072f39-dbde-4018-3921-08da582c9a9e
x-ms-traffictypediagnostic: MN2PR11MB4677:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4UdqLWS2QaVT2nHtCaHrF46RtPRm8mhvMRovzC6SWMxYsrzVFIXY6CH6vHdKewtnA/hRpZi0kAIrhzXVGFdzV8I+caK0dCRUorxR9BLb4w8Vxrs3Cjf91VnXzd2ArP2ketGxJn7Dq+O+QBteQSyecGoqLB10sOiN6W2qhjOBkQJ93eAT583TQ1cr0VbdNVixkIM6nH1Wg+3AVu52bx1+9a8HmiuiHmSO4cWRj2B0enEfB561900fD5gIhtnbDeeSqmt+O+jX5S/HY510w9dwcha3AxQ6eBmfVxj9wLHF6NkbsDMh8VoA0osOYbsO9DxtWT+BHBgkYIBT00sJ9fS0ixxNPtnZ2YxsTSDq0fQuYa1lRx+bBJ8r5E6FWTz6Xd3ikGE+1aLecfdYO8QwhEAih+iJkGbZiL7nxYdnO3ZyStnHQOsvJL0KNlPxOQWicTu8c2tAnkQYvBV2g7Kt91NJiP88+hUHVg78r04pqBQU4nMEFQZWrUJKlJw69v+oP/WzmaaLZajiqO5b5UjqrlyMXU0vVeJwQx2kAf/OYnHt+y3XoQGxmXh5BJS1z1BTb2VatLKAxsew7EceWy/W0D80kdR6If04hpJbdi8zqBFZood5oRDOzeCqEfz4rUFUOyO+uKFvV7cRoe5ET1vA82JIDz7jGlfWDePAoo5JdYMKhUW77pFIImSs9VlwORoOkaH11MY9J8DqaKZBrCaA1yS7AeWOjmrh9tRsch+6jj8kIKfgogv6PxHkB8xt3G/HlKM+8PCBjW8VIR3y/uEMFccsz+oZwkqhRlF7piFPik7AQfYLXv0bwnGFPtwC5HtlUGwyuGFWJhmSCAyMXZbEaRRyWmZQvZqafR/9xZ94WcvF/w0JFLv0Zf1pHFiUnekTc09+vNKjnCDp0axzDBPoQ2ZkVA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(346002)(376002)(396003)(136003)(39860400002)(6512007)(6506007)(110136005)(38070700005)(31686004)(38100700002)(53546011)(83380400001)(316002)(41300700001)(36756003)(26005)(478600001)(31696002)(54906003)(2906002)(66446008)(8676002)(4326008)(71200400001)(76116006)(64756008)(66476007)(2616005)(6486002)(122000001)(7416002)(86362001)(8936002)(966005)(91956017)(7406005)(186003)(66556008)(66946007)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3l3VTBNWEFOL1Z0VDl3dUZzczRJWmdCY21CMFFiaERGVjVUWlVYY25YaDFv?=
 =?utf-8?B?T1VhU0JBMlVTZUcrZFJqLzRxQlgzenAxaXFNKzEvTnFKSnAyV0pqNkZPQlpO?=
 =?utf-8?B?Ty9WbG91YW0xUGQ3MjNqUVBOYU0reittYUNnMjRqUXVKaVA2VklTenJ3RTdV?=
 =?utf-8?B?TUdNMDZqV0h5TjhDLzVSRGlnZDdQa3I3NWMwWEFOdFdpSWFOa0ZrRGJxb3ow?=
 =?utf-8?B?Ry9OZ21Rak9GYVU1akJCN2NMS1VsZzdSeFRUSjJFcnE2Z0QyTTRkNmtISTg3?=
 =?utf-8?B?VUV5MWxNdWhiOXM1ZnlFVitmeU00QlBxTThHOEU2YjBzWDl1VmRldEZlTWlW?=
 =?utf-8?B?T2QyZEJiNzFOcS91Sm1xTUxGeDRpNXVKUkowelRwOHFXSVUraGlDR2EvVE51?=
 =?utf-8?B?VlllQVJ1dVArS0x1YVRBWEdWbE5UTVdKa0ZKWWlNeE9Ec09RdkVlZ2pQdmhO?=
 =?utf-8?B?YnVTd1FXQzRlZ0VOSXk3UFl5LzFGTkp5QzhUVjB6Qkl4akJJMEdKQlhUZHZP?=
 =?utf-8?B?WHo0a0RJZHdORVFoOE5EbWY0SExYSlhpM2V5VGNDVGNkb25CeXlMVnp0TkNm?=
 =?utf-8?B?QmRZOHEwclVaYnZKS1lrbG1vSVV4aEVxZ3VtaU1SY1JZQm5URHl5R3pDQ1VG?=
 =?utf-8?B?VjdKcnlhUHBLOUdIRmNLT2pUczczY05uWTZXZkhuM0dsd2N0ay9TNWo4NHFh?=
 =?utf-8?B?d0dkd3FsZWM1bTBTbGNTc0NkMVNNaHlMVUNSbEpPZXh0OVc4ZnNnUm4yNlRr?=
 =?utf-8?B?SWIvUUV6VmE1d291S3FibGw5a1Z6ZFNWK0hXZTZQZ05kajEvV2ZLS0lIVlZq?=
 =?utf-8?B?OURtM2x1NXZaOThUY0VzYWRwd1NFR09lMUwyOE1lNG5xNlBDdEtUMXNjbFE5?=
 =?utf-8?B?Lzl0ZVFpNHJFdFhYSnEzN3BkcDFlTnYyakZWeHFBSS9PTVYzVjk2bGNOMmI5?=
 =?utf-8?B?czloczZ1UDFzc1orTjIwd2l1ZE1uS2pVYzh1Y2Mxc3pxY29ZQk1DMHlNdG8v?=
 =?utf-8?B?bzV0bkRxOHhtVWdmMVgzeTV0MVpIZlU1OVN5RzV2RW1wS1oxN3N5djNITEJF?=
 =?utf-8?B?OXRuRFdIRHVvNnZVbThNWVdpT2VxZGxSZUVQL1VTY291U2o2MkVORithdXBn?=
 =?utf-8?B?YlRSV0FhSnhCazZnNm5RdmpXdHRZTDJEMHdxUzIxTjRPNWZwS0tGSmpheGgw?=
 =?utf-8?B?bHcrck9hMm53Y2VWTTJSMXFOeW00b3NzNDBVUEo4RTU3c08zT0pYUDNWUlla?=
 =?utf-8?B?TWZNejFUUDVIVG5seE5yNDQvZ25RbVNrQ1BOMHpmZUp4Q3FmU2VEWk5BSXA4?=
 =?utf-8?B?N1hweHVIV3FVR2JJWXMyZGlrOXR2Um5ha2xqc3dzai9TZ1FncEdRNzQ0YmM0?=
 =?utf-8?B?TDNyeXFPZlJCOFBFSXN0a1gyT0VlUlU3NllyYWFJWmJXV24vcENkaXhYN1hX?=
 =?utf-8?B?ekV3UC9sb1RZR280ZHI5MFArNm9STzRscjg4bXJLOW5IcWFTaHhza3hUM3Ux?=
 =?utf-8?B?YUh0SnBMS1p2ZFBqK0V2Sk1MVkhFTDdlY0N1ck1Od1EybmZ6YmlLTy9XWW51?=
 =?utf-8?B?VS82VE5lK0N4YzZXL2hTKy9VK0IxY0x0Z2N6aFhGb0o1MDBVSFN5N1gxZnVO?=
 =?utf-8?B?RHlTL3BhODViOXpCTmVtRXhIM25jOXZMcGFiUGJneHRxeXlvVDZvTCtTbHNi?=
 =?utf-8?B?dnJBNHhqTHdLT3U2V1FEVW5oRDhxc3o5SkFsQkg2Z3FWeXAxNG8wNXptUkpi?=
 =?utf-8?B?MGxYZ1VnRVRGblYvZFppM05aSFN1RkZBaitmbGdwaFFtbWhYNjdUN1hta0Fn?=
 =?utf-8?B?Y0haTjNiQW5KN1B1Y0RweFR4MEY5c2tBREhNQTh1dWF3cEVBSmVZWUNqTWVz?=
 =?utf-8?B?WDlDRXMrVVl1QmhWdlZsV25iSElzanF2VHZRa2FJb2c0dW0vNFdNcDNtZG9y?=
 =?utf-8?B?bWpQdjEyMGtjYm5XNGxBK0lsaVk2Z0cvd0RDL1V0TllhbzliNUd0cjdXZXo1?=
 =?utf-8?B?QVp2MDlCZW1ESGJyU1VWcHZFdTF3Z2xrNWRCdlBRVXdCOHd2TmRtUkRvVk1Q?=
 =?utf-8?B?K1ZNUmh0VXBiMDZBN1NhM3E0M1pUYWJHUysrOE9Fc0szcmR0aXE1MVJobVVh?=
 =?utf-8?Q?bMLLgEFO0jREhptlfhoiFQExM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <87E1808B9EB0314AAA11A69460A0F845@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d072f39-dbde-4018-3921-08da582c9a9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 11:03:02.1587 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sb6xBcaMxHrlIdNqlxg/OccOgYTIqk5EBrC0kKHATSYIZbSu/gY6RDU2pv/z66RbF0X3zK4BOCnuLXBBxtJGqPBd06rlvLUeAHZdINPVoLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4677
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, jee.heng.sia@intel.com,
 linux-riscv@lists.infradead.org, sam@ravnborg.org, masahiroy@kernel.org,
 daniel.lezcano@linaro.org, joabreu@synopsys.com, geert@linux-m68k.org,
 Eugeniy.Paltsev@synopsys.com, devicetree@vger.kernel.org,
 aou@eecs.berkeley.edu, broonie@kernel.org, palmer@rivosinc.com,
 paul.walmsley@sifive.com, tglx@linutronix.de, dillon.minfei@gmail.com,
 lgirdwood@gmail.com, fancer.lancer@gmail.com, linux-spi@vger.kernel.org,
 vkoul@kernel.org, palmer@dabbelt.com, dmaengine@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjcvMDYvMjAyMiAxMDoyNCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAyNy8wNi8yMDIyIDA5OjA2LCBD
b25vci5Eb29sZXlAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+DQo+Pg0KPj4gT24gMjcvMDYvMjAy
MiAwNzo1NSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4+PiBPbiAyMS8wNi8yMDIyIDEx
OjQ5LCBDb25vci5Eb29sZXlAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+Pj4gT24gMjAvMDYvMjAy
MiAwMToyNSwgRGFtaWVuIExlIE1vYWwgd3JvdGU6DQo+Pj4+PiBFWFRFUk5BTCBFTUFJTDogRG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBj
b250ZW50IGlzIHNhZmUNCj4+Pj4+DQo+Pj4+PiBPbiA2LzIwLzIyIDA4OjU0LCBDb25vci5Eb29s
ZXlAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+Pj4+PiBPbiAyMC8wNi8yMDIyIDAwOjM4LCBEYW1p
ZW4gTGUgTW9hbCB3cm90ZToNCj4+Pj4+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBz
YWZlDQo+Pj4+Pj4+DQo+Pj4+Pj4+IE9uIDYvMTgvMjIgMjE6MzAsIENvbm9yIERvb2xleSB3cm90
ZToNCj4+Pj4+Pj4+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5j
b20+DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gVGhlIGsyMTAgbWVtb3J5IG5vZGUgaGFzIGEgY29tcGF0
aWJsZSBzdHJpbmcgdGhhdCBkb2VzIG5vdCBtYXRjaCB3aXRoDQo+Pj4+Pj4+PiBhbnkgZHJpdmVy
IG9yIGR0LWJpbmRpbmcgJiBoYXMgc2V2ZXJhbCBub24gc3RhbmRhcmQgcHJvcGVydGllcy4NCj4+
Pj4+Pj4+IFJlcGxhY2UgdGhlIHJlZyBuYW1lcyB3aXRoIGEgY29tbWVudCBhbmQgZGVsZXRlIHRo
ZSByZXN0Lg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8
Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+Pj4+Pj4+PiAtLS0NCj4+Pj4+Pj4+IC0tLQ0K
Pj4+Pj4+Pj4gICAgIGFyY2gvcmlzY3YvYm9vdC9kdHMvY2FuYWFuL2syMTAuZHRzaSB8IDYgLS0t
LS0tDQo+Pj4+Pj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0pDQo+Pj4+Pj4+
Pg0KPj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvY2FuYWFuL2syMTAu
ZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvY2FuYWFuL2syMTAuZHRzaQ0KPj4+Pj4+Pj4gaW5k
ZXggNDRkMzM4NTE0NzYxLi4yODdlYTZlZWJlNDcgMTAwNjQ0DQo+Pj4+Pj4+PiAtLS0gYS9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL2NhbmFhbi9rMjEwLmR0c2kNCj4+Pj4+Pj4+ICsrKyBiL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvY2FuYWFuL2syMTAuZHRzaQ0KPj4+Pj4+Pj4gQEAgLTY5LDE1ICs2OSw5IEBA
IGNwdTFfaW50YzogaW50ZXJydXB0LWNvbnRyb2xsZXIgew0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+ICAg
ICAgICAgIHNyYW06IG1lbW9yeUA4MDAwMDAwMCB7DQo+Pj4+Pj4+PiAgICAgICAgICAgICAgICAg
IGRldmljZV90eXBlID0gIm1lbW9yeSI7DQo+Pj4+Pj4+PiAtICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAiY2FuYWFuLGsyMTAtc3JhbSI7DQo+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgIHJlZyA9
IDwweDgwMDAwMDAwIDB4NDAwMDAwPiwNCj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAg
PDB4ODA0MDAwMDAgMHgyMDAwMDA+LA0KPj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICA8
MHg4MDYwMDAwMCAweDIwMDAwMD47DQo+Pj4+Pj4+PiAtICAgICAgICAgICAgIHJlZy1uYW1lcyA9
ICJzcmFtMCIsICJzcmFtMSIsICJhaXNyYW0iOw0KPj4+Pj4+Pj4gLSAgICAgICAgICAgICBjbG9j
a3MgPSA8JnN5c2NsayBLMjEwX0NMS19TUkFNMD4sDQo+Pj4+Pj4+PiAtICAgICAgICAgICAgICAg
ICAgICAgIDwmc3lzY2xrIEsyMTBfQ0xLX1NSQU0xPiwNCj4+Pj4+Pj4+IC0gICAgICAgICAgICAg
ICAgICAgICAgPCZzeXNjbGsgSzIxMF9DTEtfQUk+Ow0KPj4+Pj4+Pj4gLSAgICAgICAgICAgICBj
bG9jay1uYW1lcyA9ICJzcmFtMCIsICJzcmFtMSIsICJhaXNyYW0iOw0KPj4+Pj4+Pj4gICAgICAg
ICAgfTsNCj4+Pj4+Pj4NCj4+Pj4+Pj4gVGhlc2UgYXJlIHVzZWQgYnkgdS1ib290IHRvIHNldHVw
IHRoZSBtZW1vcnkgY2xvY2tzIGFuZCBpbml0aWFsaXplIHRoZQ0KPj4+Pj4+PiBhaXNyYW0uIFN1
cmUgdGhlIGtlcm5lbCBhY3R1YWxseSBkb2VzIG5vdCB1c2UgdGhpcywgYnV0IHRvIGJlIGluIHN5
bmMgd2l0aA0KPj4+Pj4+PiB1LWJvb3QgRFQsIEkgd291bGQgcHJlZmVyIGtlZXBpbmcgdGhpcyBh
cyBpcy4gUmlnaHQgbm93LCB1LWJvb3QgKmFuZCogdGhlDQo+Pj4+Pj4+IGtlcm5lbCB3b3JrIGZp
bmUgd2l0aCBib3RoIHUtYm9vdCBpbnRlcm5hbCBEVCBhbmQgdGhlIGtlcm5lbCBEVC4NCj4+Pj4+
Pg0KPj4+Pj4+IFJpZ2h0LCBidXQgdW5mb3J0dW5hdGVseSB0aGF0IGRlc2lyZSBhbG9uZSBkb2Vz
bid0IGRvIGFueXRoaW5nIGFib3V0DQo+Pj4+Pj4gdGhlIGR0YnNfY2hlY2sgY29tcGxhaW50cy4N
Cj4+Pj4+Pg0KPj4+Pj4+IEkgZ3Vlc3MgdGhlIGFsdGVybmF0aXZlIGFwcHJvYWNoIG9mIGFjdHVh
bGx5IGRvY3VtZW50aW5nIHRoZSBjb21wYXRpYmxlDQo+Pj4+Pj4gd291bGQgYmUgbW9yZSBwYWxh
dGFibGU/DQo+Pj4+Pg0KPj4+Pj4gWWVzLCBJIHRoaW5rIHNvLiBUaGF0IHdvdWxkIGFsbG93IGtl
ZXBpbmcgdGhlIGZpZWxkcyB3aXRob3V0IHRoZSBEVEIgYnVpbGQNCj4+Pj4+IHdhcm5pbmdzLg0K
Pj4+Pg0KPj4+PiBIbW0gbG9va3MgbGlrZSB0aGF0IGFwcHJvYWNoIGNvbnRyYWRpY3RzIHRoZSBk
dC1zY2hlbWE7DQo+Pj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9kZXZpY2V0cmVlLW9yZy9kdC1zY2hl
bWEvYmxvYi9tYWluL2R0c2NoZW1hL3NjaGVtYXMvbWVtb3J5LnlhbWwNCj4+Pj4NCj4+Pj4gQFJv
YixLcnp5c3p0b2Ygd2hhdCBpcyBvbmUgbWVhbnQgdG8gZG8gaGVyZT8NCj4+Pg0KPj4+IFdoeSBk
byB5b3UgdGhpbmsgaXQgY29udHJhZGljdCBiaW5kaW5ncz8gQmluZGluZ3MgZm9yIG1lbW9yeSBh
bGxvdw0KPj4NCj4+IEJlY2F1c2Ugd2hlbiBJIHRyaWVkIHRvIHdyaXRlIHRoZSBiaW5kaW5nLCB0
aGUgbWVtb3J5IG5vZGUgY29tcGxhaW5lZA0KPj4gYWJvdXQgdGhlIGNsb2NrIHByb3BlcnRpZXMg
ZXRjIGFuZCByZWZlcmVuY2VkIHRoZSBkdC1zY2hlbWEgKHdoaWNoDQo+PiBmb3IgbWVtb3J5QGZv
byBub2RlcyBoYXMgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlLg0KPiANCj4gQWgsIEkgc2Vl
LCBJIGxvb2tlZCBhdCB3cm9uZyBsZXZlbC4gSW5kZWVkIG1lbW9yeSBub2RlIGNhbm5vdCBoYXZl
DQo+IGFueXRoaW5nIGVsc2UuDQo+IA0KPj4NCj4+PiBhZGRpdGlvbmFsIHByb3BlcnRpZXMsIHNv
IHlvdSBqdXN0IG5lZWQgdG8gY3JlYXRlIGJpbmRpbmcgZm9yIHRoaXMgb25lLg0KPj4+IEFuZCBt
YWtlIGl0IGEgY29ycmVjdCBiaW5kaW5nLCBJT1csIGJlIHN1cmUgdGhhdCB0aGVzZSBjbG9ja3Mg
YXJlIHJlYWwgZXRjLg0KPj4+DQo+Pj4gQWx0aG91Z2ggdXN1YWxseSB3ZSBoYWQgc2VwYXJhdGUg
YmluZGluZ3MgKGFuZCBkZXZpY2UgZHJpdmVycykgZm9yDQo+Pj4gbWVtb3J5IGNvbnRyb2xsZXJz
LCBpbnN0ZWFkIG9mIGluY2x1ZGluZyB0aGVtIGluIHRoZSAibWVtb3J5IiBub2RlLg0KPj4NCj4+
IEkgZ3Vlc3MgY2hhbmdpbmcgdG8gdGhhdCBmb3JtYXQgd291bGQgcHJvYmFibHkgcmVxdWlyZSBz
b21lIGNoYW5nZXMgb24NCj4+IHRoZSBVLUJvb3Qgc2lkZSBvZiB0aGluZ3MuIFRha2luZyAiY2Fs
eGVkYSxoYi1kZHItY3RybCIgYXMgYW4gZXhhbXBsZSwNCj4+IGxvb2tzIGxpa2UgdGhlIGNsb2Nr
cyBldGMgZ28gaW4gYSBjb250cm9sbGVyIG5vZGUsIHdoaWNoIHNlZW1zIGxpa2UgYQ0KPj4gImJl
dHRlciIgd2F5IG9mIGRvaW5nIGl0IC0NCj4gDQo+IFllcywgYmVjYXVzZSBJIHRoaW5rIG1lbW9y
eSBub2RlIGlzIGtpbmQgb2Ygc3BlY2lhbC4gSXQgZGVzY3JpYmVzIHRoZQ0KPiBwaHlzaWNhbCBt
ZW1vcnkgbGF5b3V0IGZvciB0aGUgc3lzdGVtLCBub3QgdGhlIG1lbW9yeSBjb250cm9sbGVyIG9y
DQo+IG1lbW9yeSBjaGFyYWN0ZXJpc3RpY3MgKGxpa2UgdGltaW5ncykuDQo+IA0KPiBXaGF0IFUt
Qm9vdCBuZWVkcyBpcyBpbmRlZWQgbWVtb3J5IGNvbnRyb2xsZXIgbm9kZS4gSXQncyBub3Qgb25s
eQ0KPiBjYWx4ZWRhIGJ1dCBhbHNvIGZldyBvdGhlcnMgdXNpbmcgSkVERUMgTFBERFIgYmluZGlu
Z3MuDQo+IA0KPj4gYnV0IHdvdWxkIGJyZWFrIGV4aXN0aW5nIGR0cyBpbiBVLUJvb3QNCj4+IHdp
dGhvdXQgY2hhbmdlcyB0byBoYW5kbGUgYm90aCBtZXRob2RzIHRoZXJlLg0KPiANCj4gWWVzLCB0
aGF0J3MgYSBiaXQgaW5jb252ZW5pZW50IGJ1dCBhbHNvIGEgcHJpY2Ugc29tZW9uZSBoYXMgdG8g
cGF5IGZvcg0KPiBpbnRyb2R1Y2luZyBEVFMgcHJvcGVydGllcyB3aXRob3V0IGJpbmRpbmdzLg0K
PiANCg0KQWxyaWdodCBzbywgSSdsbCBtYWtlIGl0IGEgbWVtb3J5IGNvbnRyb2xsZXIgYW5kIGNv
bmp1cmUgdXAgYSB2Mi4NCkFzIGFsd2F5cywgdGhhbmtzIGZvciB5b3VyIGhlbHAgS3J6eXN6dG9m
IQ0KDQo=
