Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA8B801E0C
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 19:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C5AF10E054;
	Sat,  2 Dec 2023 18:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD24510E054;
 Sat,  2 Dec 2023 18:08:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zesfc4GZQ8b9Rzcu6R0bKuEPzc0AqJOSU2AFl5NdnWZQxdTZQjrpZCz6pA6h6iJ/qKDuwsO3hi8FhatuqPilhkf5DQdnNI0krCYL4CWheTv7yoD3gCDuM9KCXM1EsZXYtmo0j1MC8uiW9KM71fqwLMq2+ofVsLpzBTgydiMsDM8AwHu+1EnJGm5prabB7Eade64uIwjwhBHGIc/sQMYLGuVn6Ks0wVWouSkolJM+4XB9rRWH/gLmFl6yBIlqDpJlfIg/rx/iTapNRBMqULam/e4ww6qGmMLCyTL85gzO1qdX+JQeIIea8PARNlJXFbwXq+ZabEIZc6kt/c1d1935xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wi2XG5Uhd5gjtlXnV82fmdBvuW6UCj7/KkAE7AZcEyc=;
 b=n9stneLVXK2DMeHv120Z8pfoA/fsWQBlweKHY7F7pxdGFg71b449SQEquoPGFxRXU3z1Gpo6BRmhh1hFLTEK8mu8/+shu4RktprkVxn9y73lvI1zS3BFr3cVwAqjd81+OEOHuRCjk0tOrdTdJTVMm3i3BZuSR02+vseo7F4bgZrHAcusVxTgidsp8NAqSu+R482G6EpUPIqjxlCrNP1GJkoT8onYOp+F+DQ+P+7dG179Q2bhep14201I1qimzcUoDcr0OwlNfi1gHwNDfgmMrGXvTfm/37YbSP3V+AmfWLpiNUWkbAF+ETYAacziaWTiP8fU0dtR3CQXRtW7tRQlAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wi2XG5Uhd5gjtlXnV82fmdBvuW6UCj7/KkAE7AZcEyc=;
 b=c39Nxg/Lfamar9zPEDdOO74ereoKoxq6+Jdo44a9OLBN8H+vXZyCGBWW2az1qMu8DfQWxwoFUcAN4AJ3+oGi1aL+QlZnknYNiS+KYjbMu/xbFWAkrPUr0DIK8U54s5OpaX2DNwAWrRKRgTkuffT49qvlGHSFnV2hi9nbH0bRV69L9imcX6mc+WsX7dSWsY23pa5YN3u6fHsNqXnQQ/kRMjyLVXG8MbD89fJ6FK04x2PkLQjoAqFgHwf9YU8iNvl92mQ+FsBDQTPu+FIo11MSaXqNN5y1VSGJD6UqXN0m+XS/6mLOwJAaUAwTUo5tdvOEe13YxP0K7CvIIcPtTGTG5w==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by DM4PR12MB5166.namprd12.prod.outlook.com (2603:10b6:5:395::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.30; Sat, 2 Dec
 2023 18:08:01 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6%7]) with mapi id 15.20.7046.028; Sat, 2 Dec 2023
 18:08:01 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "marc_nouveau@merlins.org" <marc_nouveau@merlins.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Nouveau] Thinkpad P17 gen 2 kernel 6.4 and 6.6 lack of support
 for nvidia GA104GLM [RTX A5000 Mobile] and missing module firmware
Thread-Topic: [Nouveau] Thinkpad P17 gen 2 kernel 6.4 and 6.6 lack of support
 for nvidia GA104GLM [RTX A5000 Mobile] and missing module
 firmware
Thread-Index: AQHaJUebktwGhpOAHkyovBaQ9m3oYbCWSmgA
Date: Sat, 2 Dec 2023 18:08:01 +0000
Message-ID: <ee2168cb672d8210854535dc9d80c854880ea4fb.camel@nvidia.com>
References: <20231202171326.GB24486@merlins.org>
In-Reply-To: <20231202171326.GB24486@merlins.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|DM4PR12MB5166:EE_
x-ms-office365-filtering-correlation-id: 20294865-b8e1-4e46-2ffa-08dbf3619f37
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dB+RaPYnqKipRDygjP2ChLASI5vNjr2DdnqEZGT1BfZaRzoqnUYHO0EiPVAYjTHWTwncbcG1n9qTYmT5kUZvjo1ljHSVC241DZOi12qOKT/Le6lyj0wntIQRk3p4FB0g+vMvmQhx94qUYPP9AyvWMSLPMl9rtMz700dvMJ4Mc/RGcF7Hqt7atyTldvCORnmERAM5Bt025KkZDwmCr43IgOJnTTXsb/J9pLqst41qKe8fU1yZZYGmujH8yumYiN94q9ZDkcZZoD7tts0LkaBCDbUr5Y/DT0WIW/bVWIZ1gHpYFtzDlafycgtmxLE6MYS9a3mXrS8FfoX3ihCByr5QnZEWLx+Fhg7/X/3MwQL8upyaHfdJ01/2TUULrGMSjPwe2TC1BpAb8VMHlxECUQRjkmaVkT30+kq1zy81VghjmCnDek7fjwnQz/IAImnn5AD/V10HjygSTUbdJ5yfshEOOWMssNiVMC1q/d9aYA/D2qOIyDDcbljAHYD391R6BMsL9kuUmCp+SC7AW7/CvCgXpeBvz9OlWnAD4hTEiz9aC9nvwQhylYlvVuAJR7Wu5ucxNzD1tHufnm5gNFA9vzQHyRXoihsDj/16MFvo6G1zw/57PYBLklkcA1zAc7oC48X9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(346002)(366004)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(558084003)(36756003)(38070700009)(6486002)(2616005)(2906002)(71200400001)(478600001)(86362001)(4326008)(316002)(8676002)(8936002)(66446008)(6506007)(110136005)(6512007)(26005)(5660300002)(64756008)(66476007)(66556008)(66946007)(38100700002)(76116006)(41300700001)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2xQdnhoYXJXQiszQ1BRcWQ0MU9QeDJuT1p4anJYUEErbGp0bUVKSms0YnZ4?=
 =?utf-8?B?NVVHQ3RrbzEvejVNZzh3amZlK2hKUXFQbjhabFh6SENkRzdveENZbjRwUlRq?=
 =?utf-8?B?VFViOE9lekJIVHZHSVpKeEI4WTlIZXZZb3o1a3AxUWorRktqTXc0L2FUOXlE?=
 =?utf-8?B?bkQwa0tWeDVkYVF2RVhtVzh3bm1pRVYvakNjdXBHK2wrNWZIOHBGLzZ0cmkw?=
 =?utf-8?B?djJ3ZThoRVV6KzdMbjRmdVExYWw0WjlzZCtydFBxd3IzTnZ6Zi91aW9NbjJL?=
 =?utf-8?B?cUZOTHVPNVlmcERnY2xQM3pjMXU4TWVYcnVSTkQyK0sxMjVKSTkzcUJMU2RX?=
 =?utf-8?B?Vjhsei9ta2EyVHE5Qkpha2EvMjg4QWpEYW5EWFhuajBYeFpHczdYYkVyVkJS?=
 =?utf-8?B?SzQvQVlEY0FyTWtaT1l2MzRURzRIT0o1Z040WHZFNTVKenlMQlYzb1F3aHhk?=
 =?utf-8?B?eGpNUFNrcHpWc1J1RHAySlgrR1duUHV5bXBQNUFQdnA2ejdpb2Q2bmhpZ094?=
 =?utf-8?B?b3ZEaldnRmlHVnFtOWZ2WFJBeXlBVXl4NHlSSk90UERheWRiTHZDbFlGL2tO?=
 =?utf-8?B?Z2xjbE1tSmVHK0ZwcVR2VEJPSDR3VkdSaFcyT0FoVGgrUnI1dVhjWlVxSUR0?=
 =?utf-8?B?L0d3QVZDdjF6ZFhwWFZpR3ZxSEdtekxCQS91bFhnY2s0dURkYncxTnJBYlpv?=
 =?utf-8?B?NG1JVmpEWnlGK1JlWXNQQ1VucDUwR2NIdlFLWWxTSkprWXhBQk9qbTNraDZR?=
 =?utf-8?B?MGp6TklDcDB6R3phVXg2T3ZTYXhBdFVHcnFTblZRa0dxNkdlMWFQZDZNT2Ry?=
 =?utf-8?B?aFM5b1lKTDNyd2E2RVlDMU41amhrMTE4bzMvUTlqOVRNcmJvSmhVa0NiK2Rj?=
 =?utf-8?B?eEt6cnpJR3RUeFMwcWpYUWJVWDUvbDZWaVpQRnVWb2k5WlFudC9wQ0REaUJN?=
 =?utf-8?B?dFE3aXAvK0FNd2tuWlh0bFpUR1dKZ0RIcERWOXhZTVJCMG9jUDR3S3lOVS93?=
 =?utf-8?B?d1VGYUk2YXZBNXo3c2JKZ0t6d0xVV3F5R3VkNlpnWXNybC9ja21BSi95bGNM?=
 =?utf-8?B?Mi85ZURhYkJSR3AyalgrcU5Zd3ZZNWZwalp4TVU5UHRwa1N6WXZhZU84Z0cr?=
 =?utf-8?B?OEpqK3Y2QjZMR0tWcFdzOHltaHhBWS8vUWlkcjd0cnd4ZzUveUVkRHFzMmJU?=
 =?utf-8?B?MEVTZDArZnlRbktCZXpMbENxNDdWVDY3UnpzalJhSUM0WDVPTG5MNCtUZ1dG?=
 =?utf-8?B?b1dlQjFReDJ2OTRrcVpQTldpWE5pZlZqcVNMdmJmZzFvT2laVnpPOXdINHZM?=
 =?utf-8?B?M0VTbTFteWZ6dDluNFJrUW5nOHU3TnNRVmpwdFRLcEJQSVROOWk5bW1GNFdP?=
 =?utf-8?B?OW5EekZ1QndmS0J2aW16VHlIWEprK0U4OUZEbDZsZ2d2RnV5cWlWaE5yYW5K?=
 =?utf-8?B?WnNuMXpuWVVBSkkvaFFaYnRKVERTRkZsSll0bEd0T3VyU0p0eW1nZTJ6S1BG?=
 =?utf-8?B?Qk1QeXc1YXdkcnlrM29WSFVPZW1WN0h5aTVpNitKMzBqcFZvaHgrT09pSURP?=
 =?utf-8?B?VUxCdTRvZXVyaTZITk1CcVpPWktVQkJYa3JsMWJGc1pXLytCL3F1ejhieEMw?=
 =?utf-8?B?c2RCU2NZSnlQMjY5RWNlWDQyRXl0S1Z5dWNCQzR1bmVNcnhjYjFlZENDMlI3?=
 =?utf-8?B?aDZ1blBMUVFPWkVDL3lQMGhNVDQ1aTJmZjVuMmxlemtkd0k0Kys1N3hzdTVG?=
 =?utf-8?B?cGI3NHgwVTFJaEwwajd3QXVtWkpWazV5ZmpqTXFaZWliaXZpUGlXamVlOHJD?=
 =?utf-8?B?SVk1ODRzZWtQbTJoQ1hvSW5NbjJST0p4MG9MTFdqTGtjMTQ3YUp3U2l0aXZa?=
 =?utf-8?B?bnozUmppaW5TQnVlMTNQRHBBb2VFVEp5am5Yb1FLTUF4TUdPRm92R2xzbTJC?=
 =?utf-8?B?dHNKRU51UC9kakticUZDWE5BdTFPR1lOb3V4cVY1UEsyNnlRZHMvckJFdU5l?=
 =?utf-8?B?anU5ckRXYy85UUJkMTE3TzUya2dNS3RPZGJyNC9rREJyNHlxM1NFRjM4R0FQ?=
 =?utf-8?B?Ri9PbGVHdHlFUjJaY0ZDTENVOGYyQWxOU2d2UlBhRjRYTlBRRnF0QVZ1cDVj?=
 =?utf-8?Q?q7FEuHwJpghFR853UM6o05auN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <49B2824E092CC341874FAE53BAE299EC@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20294865-b8e1-4e46-2ffa-08dbf3619f37
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2023 18:08:01.1040 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jd1F+cZ4VCxmQnp6kDtv/Q4tD4aKC5xcWa47WlOEamWm3ckFqLt2cqhyGitvKVwNfIeGlBXFMA5QKEOAnI+fBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5166
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
Cc: "paulmck@kernel.org" <paulmck@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDIzLTEyLTAyIGF0IDA5OjEzIC0wODAwLCBNYXJjIE1FUkxJTiB3cm90ZToNCj4g
W8KgwqDCoCAzLjE4NDUyNV0gbm91dmVhdTogdW5rbm93biBwYXJhbWV0ZXIgJ21vZHNldCcgaWdu
b3JlZA0KDQpGb3Igc3RhcnRlcnMsIHlvdSBtaXNzcGVsbGVkICJtb2Rlc2V0Ig0K
