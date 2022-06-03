Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E0A53C8F8
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 12:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7700910FF03;
	Fri,  3 Jun 2022 10:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.140.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A00B10FEDE;
 Fri,  3 Jun 2022 10:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
 s=qccesdkim1; t=1654253717; x=1654858517;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c8aqbGi9FXoTdenT8qt/Z3fTnUbyPOHwRqIVgDGqCY4=;
 b=z43abK9OzxyQQrQe9VJZgn2XiiRv4mQSFEEBw4jnZWTH2lXMNYJpBkFF
 UDlLS16yuAcK+tnaj0stCrMZVDYPVJnS+aop3Ivg4SzxraPC82LcQ6T3+
 M1/XDfTCBexnfY84EfzuSKDe9k9v+NqS2O5JvT0nAEa0wT0xf6LbYHyOV 4=;
Received: from mail-bn8nam04lp2043.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.43])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2022 10:55:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICfLJgdSOEvBoThH/VpmC5RK4aK55UZiPSfZicDHy4SHkC3tYXT8ibKV5JwSsZ1nN3wu4Onbc0pkDSiZ59mpiq3f+aKjb/rN/4XyI73vEuAzeADJ6vJ5taV0x2g0ES2+n0aMvQhg1VIInL1eCHSNFIdOEYXlnIEbaahDj9PzOLnd8X/ohT88P7U1An5IrB8HEfzfrGYHIaAd6r70fmUOuM7yyd+a0vpHnCxCD88pV+lXPSg6PkDFYU9BRehZ2LWqNE9pt6FkuPKkQt/o9OU4XJNbp74T1bfFEKx0wbqIB3cw2PhF7PeTjglJKkN8Sb6ga1khLKNi5i93g6U7Pk0P0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8aqbGi9FXoTdenT8qt/Z3fTnUbyPOHwRqIVgDGqCY4=;
 b=ZSlKZyGBT00iwxpSpn+V9fMvm92FsONvMP1rrLW5zscw0R8df2AoCcfsSNK3scVlcTl8pupVyBbUxvcxdsVAUwzNARSjcmdM5NnpzLwULbUiNEDugHSYzzylIy6tk6sY3R66NXAtGdI36pOCnbBacn4MT7NQoRC0dXkhu1VEXgvhwHfyw56HVQRognkjfJXTB3cfzTU81pAVP7+vnMr8NfIs9S9IKKSOkb5MXW50X3UytebYbymXW2ZTLUNMtGuwi1tuphwmuYSpIdpSecqWnP6MoR+qQHK8kzAQ9N5GF/5YTMj2HcZCHvstwNwFVnBXAmjMacTOxuLEnmccJy/dRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:166::9)
 by BN6PR02MB2449.namprd02.prod.outlook.com (2603:10b6:404:50::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Fri, 3 Jun
 2022 10:55:09 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::5483:ae3f:a820:b25e]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::5483:ae3f:a820:b25e%6]) with mapi id 15.20.5314.015; Fri, 3 Jun 2022
 10:55:09 +0000
From: Vinod Polimera <vpolimer@qti.qualcomm.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "Vinod
 Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [v1] drm/msm: add null checks for drm device to avoid crash
 during probe defer
Thread-Topic: [v1] drm/msm: add null checks for drm device to avoid crash
 during probe defer
Thread-Index: AQHYdyuKE2gK6YgKjUuLkPHm/JYEN609bJyAgAAQNPA=
Date: Fri, 3 Jun 2022 10:55:08 +0000
Message-ID: <BN0PR02MB8173E511825B236D1E2A087FE4A19@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1654248167-10594-1-git-send-email-quic_vpolimer@quicinc.com>
 <01f88e7a-eeef-d538-634d-bb8e7c1272a0@linaro.org>
In-Reply-To: <01f88e7a-eeef-d538-634d-bb8e7c1272a0@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1acb664e-b095-4140-21f6-08da454f86ab
x-ms-traffictypediagnostic: BN6PR02MB2449:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR02MB24496037F0170C3F3CD384CAE4A19@BN6PR02MB2449.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jm2XtiLIpti1w9VuuiNbdlNl8P0NZe5AH0RuQVWPQYw/C+m/YtIFbpsoq4JXXZ1NQuZXmgMX38rjfFZECH0sP3Ny5VfEDDgiSAExwx2ZZ8XsqWLqvfTd2sgXRGGLTv66J4Ryr/khJeGb0Ji0luSqNgtNkS69/wAKh25Bat/JENX507KgotFFkPo1UHaXjg6apREFWepp6K4cbvUy71Wz15C7JBnxEKBCWa+ag8MeUWxM+2QUIOasviyBxcD3zfQmPnySAQKXCrlSI5f/AEdsjMVZ5aVOWGAsUViFfnfgxHJV1lBM/drQ4/aDDyDQ0CvyemP+pxx1d+R17j3Kd4l8HWeTLHm9nqCfamG/kDXxyYviCcUGWuqqIKXfCic6VYCxBQxtCKj7u59vwNZh/pdBM3lZ9msTtxweUmg4XctMQImcpMC0ujyf0V3UyRTsoxf9w8l7iBwq63x9aoTqWV7ERK5MGOJIpP8Be30iahM9N3AsPzqklYK2MGoWrnz9jTl+B7Vj7bcn6GbRtgvjwLCTccyUBXSr+TZa3pLtojtGPguxiCQUHXFzgDAmjVT7PVFeVTZeAOIcyHBRNidQdKI3DSqFmlM0MTZnerc8TBRLzR3AeigyjMb36dFrkZriTfqWTqErqORRd+/x1mxxt9uzY90i21Ein3jJzIBMw9G/miji2tva+HLwUy0HrprSpTRT3CuKUn6P4yTUUhCyJJDJTQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8173.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(122000001)(186003)(33656002)(508600001)(5660300002)(53546011)(38100700002)(8936002)(107886003)(2906002)(83380400001)(6506007)(9686003)(7696005)(26005)(55016003)(38070700005)(52536014)(76116006)(64756008)(966005)(86362001)(316002)(54906003)(110136005)(71200400001)(66946007)(66556008)(66446008)(4326008)(66476007)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmY1ZXNDdGM5dEwrQW95d09leXBUaE5tQjh5dUVVelBucW5Fd01EUlNaRC8r?=
 =?utf-8?B?UlVnVjNPUEZMMEx2cGdxV3oya3AvMUNmbUozTFBhYm1YQXhJZE4zRm45VWlt?=
 =?utf-8?B?emdZUXkwZ0JQK0NMZDVwaFpESDZPREd6anQ4Y2lXRDFkS2x3UkxqZ2xJbmxj?=
 =?utf-8?B?SFhtQlBKL21XTG9xMDFWZm45bEZGZWN5bDRsU1hiR0RLWDdaYVFIek02bk5W?=
 =?utf-8?B?b3h2ZGZzMkZxa3lldGtlUzMxcHgyUVpYU2J1VGs2Q3Q4MFl2bkRPaGEwL3pK?=
 =?utf-8?B?V0hvZW43REd2S3BKNjdINk5VdTl4b3dieldLQkU1aENxcUFScFI2NEZIQUtW?=
 =?utf-8?B?Z2R4MVFCempDNW5kYXdKZVRRSzJMakFCQTRhVFplT1Z6MDRCb1lNaVdBNWtR?=
 =?utf-8?B?ZC9IYmt2VVN2ZUFleElka1lZaVloNGRjNnlqYWhFK3JxY0hKNmVtSjh3aFd5?=
 =?utf-8?B?TEYwbS9zcG1YUFhqdjNuS2ZTb0F1akJwOU4vamsxMW9rTkFZOUlUb3NXZFd6?=
 =?utf-8?B?V2RGSGZ1MSs4SkhnOVRVamhmcUc1K2JLbllIZ1htbUQ0NDV2ZzhXaUVGWjFn?=
 =?utf-8?B?REl1eGVtRGJjRUxwMG1KUzZZeVptRmtKenNWMERoczRNd2F0WGhMb250OUwx?=
 =?utf-8?B?dlVFdTEybFMrcFd3b2tqYUlWcmVDalo2Z0ExY3NScTNFVkJYOWdqUFFHQUJ6?=
 =?utf-8?B?Vk5pNzYrWHNzZXFMNDVic1F4aUd0T3hqY2MrT2NrbnpqbHFCS3g2NnpiaXdo?=
 =?utf-8?B?K28wdjRzOFJMUDlmUDV5c3hDV01WNkdVVm52K0lkbXRzQmJUTVVxWEtZcDBi?=
 =?utf-8?B?TFNsNVMyazNEM1I4RW9MdEkwUzBsWFZpQTJETVVEcHBFd2NjQ0Z1Q25zNmRz?=
 =?utf-8?B?QUkrYkNCczFjOTZYODZsVzVYb0pBdUVMOXNpSi9lbG9wQWxmcklRZFZiUU9W?=
 =?utf-8?B?WC9ZSmlSMDBzWVZpdlB4RFJkRUZlSHFxUUpVWEFpSnIrUkNxR1VYTG9TTTN4?=
 =?utf-8?B?NzA1anJhUXBBWnVqSEM1R0sxc2p2SndSWDFjTVlWcC9iLzlhb2NYa3g2NkY4?=
 =?utf-8?B?ZFRwSU5hS3NxSnp3TThObW5OMEorb1piL3FEb1pGN3NKWDN2b0tkT0J2WkJs?=
 =?utf-8?B?L3I5ek9tSnZkK29wNlovV2ZXeDVnWnRwUGdjWTM2UG5pcTVTM0lZMms0ZDB0?=
 =?utf-8?B?UEZkc1NJcmQ4Q1RQMHE2YzZoS0U1VlZVMDExNWQwODcwSEd2S3VtbW0vL0o3?=
 =?utf-8?B?VTd1OUh2ekN5SHZDMXpaU3ZPcFlDaHoxVithV3RvV0czY2FGcTRYM2h6UmZB?=
 =?utf-8?B?dWYrRVlkWVhJd3UydmVXUU00cW5weWpRRjdOVlRYdGYrczRJNXJKZlNTMTg4?=
 =?utf-8?B?TnU3RFladzJjd3krbllHenhVQnlpTnZaa3JQSlVnMlZJSGhnOWFTdy9MTmIy?=
 =?utf-8?B?SStiYlhkTFZpWVB2RnhrSkozOHV3cy9mYkl1ZTJaREt2ZU16KzQ1VWJGUzVX?=
 =?utf-8?B?eTNXM2V1SjExWC9lekZtQkZJVFd6ZnMxNlMxSFQrd0w0RWZhMkxvK2MwTi93?=
 =?utf-8?B?YVp3ZEVnZHoreTIzQTI2Q1Bvdk02aHpJSDdISFc0SnVRVVRzS290NmVZRXZM?=
 =?utf-8?B?cWFSZjh0TkpVUkovM3JhRE1UbEJJRlI4b1RhSjhZS01rY3RaNU5DSnJiNWhH?=
 =?utf-8?B?Mi9iZCtTZVhNbm1pNkczUklyMWw2Q1g5TmJuVlErUXE3T1FWdk5NTDUwU296?=
 =?utf-8?B?Z1MxSjhScVN6V29PbUhVcExRdXhFUUJ1V1VjWEErRnBJaGVTNVJldGZzY2F2?=
 =?utf-8?B?emZnRFdXSG1oTkxkWnhHU0krcDhnQmNRNkdiTlVoUHBaQ0h2RlRyR1lIWG1a?=
 =?utf-8?B?eFFYem9jU255L0plQ3EvandMeWZnRHQ5VjZvRDZacEtqdVZKa2N2ODI0MzRw?=
 =?utf-8?B?UTdiRkhXQjczNHN1aXlraVJNSTByQWZ0RjNQMDdNenpSZ29NNWtzZXNvYWFz?=
 =?utf-8?B?dzlTdGUrQ0dmaHF2K2YvSFZNZnJNWENnWjBFeU40cENpeXpHNkRpYUhFbVpw?=
 =?utf-8?B?T0Q1ZllsbklWOXl1OVMwWnVQdWZEZSsyU3ZIS1doVUIwNVVuYmc4djZXNitU?=
 =?utf-8?B?WU9lMHhpKzRlMEI5UEd0enJrOEtkMEtSU01IWUZNYm1sY3pnbWtrWGZQbGM1?=
 =?utf-8?B?RTR1UTZLMlU2Y0MzT3dFYndCMkk1SDJGVEJQZ3oxdTVVYzlLOHlXZ2ZTN2h3?=
 =?utf-8?B?UWxqRytROHpWYlZFalhSTU9TWmw5WHBxVmVEUUpBbTc3WGVTVGxNTlRadnBZ?=
 =?utf-8?B?L2hRNGZ5cktGbmlsUGZiWUVlZzdCT1dnS0RVU3g1NG5rTFhlRjFjbmVDTmM2?=
 =?utf-8?Q?KW4iND2tlCRBITMc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1acb664e-b095-4140-21f6-08da454f86ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2022 10:55:08.9973 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MIQEdhXfW24DkqvCGKztXRRERuBNtiQJZImIjU0bLmY2IA0M4TbUwqqgWJBiuaityvcLcyzyAybzWRhmNDCY2Pr/LGtcvlh4WQWUDTmp9Jk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2449
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
Cc: "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "vpolimer@quicinc.com" <vpolimer@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "dianders@chromium.org" <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG1pdHJ5IEJhcnlzaGtv
diA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPg0KPiBTZW50OiBGcmlkYXksIEp1bmUgMywg
MjAyMiAzOjA3IFBNDQo+IFRvOiBWaW5vZCBQb2xpbWVyYSAoUVVJQykgPHF1aWNfdnBvbGltZXJA
cXVpY2luYy5jb20+OyBkcmktDQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgt
YXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+IENjOiBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnOyByb2JkY2xhcmtAZ21haWwuY29tOw0KPiBkaWFuZGVyc0BjaHJvbWl1bS5vcmc7
IHZwb2xpbWVyQHF1aWNpbmMuY29tOyBzd2JveWRAY2hyb21pdW0ub3JnOw0KPiBrYWx5YW50QHF1
aWNpbmMuY29tDQo+IFN1YmplY3Q6IFJlOiBbdjFdIGRybS9tc206IGFkZCBudWxsIGNoZWNrcyBm
b3IgZHJtIGRldmljZSB0byBhdm9pZCBjcmFzaA0KPiBkdXJpbmcgcHJvYmUgZGVmZXINCj4gDQo+
IFdBUk5JTkc6IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgUXVhbGNvbW0u
IFBsZWFzZSBiZSB3YXJ5DQo+IG9mIGFueSBsaW5rcyBvciBhdHRhY2htZW50cywgYW5kIGRvIG5v
dCBlbmFibGUgbWFjcm9zLg0KPiANCj4gT24gMDMvMDYvMjAyMiAxMjoyMiwgVmlub2QgUG9saW1l
cmEgd3JvdGU6DQo+ID4gRHVyaW5nIHByb2JlIGRlZmVyLCBkcm0gZGV2aWNlIGlzIG5vdCBpbml0
aWFsaXplZCBhbmQgYW4gZXh0ZXJuYWwNCj4gPiB0cmlnZ2VyIHRvIHNodXRkb3duIGlzIHRyeWlu
ZyB0byBjbGVhbiB1cCBkcm0gZGV2aWNlIGxlYWRpbmcgdG8gY3Jhc2guDQo+ID4gQWRkIGNoZWNr
cyB0byBhdm9pZCBkcm0gZGV2aWNlIGNsZWFudXAgaW4gc3VjaCBjYXNlcy4NCj4gPg0KPiA+IEJV
RzogdW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGF0IHZp
cnR1YWwNCj4gPiBhZGRyZXNzIDAwMDAwMDAwMDAwMDAwYjgNCj4gPg0KPiA+IENhbGwgdHJhY2U6
DQo+ID4NCj4gPiBkcm1fYXRvbWljX2hlbHBlcl9zaHV0ZG93bisweDQ0LzB4MTQ0DQo+ID4gbXNt
X3BkZXZfc2h1dGRvd24rMHgyYy8weDM4DQo+ID4gcGxhdGZvcm1fc2h1dGRvd24rMHgyYy8weDM4
DQo+ID4gZGV2aWNlX3NodXRkb3duKzB4MTU4LzB4MjEwDQo+ID4ga2VybmVsX3Jlc3RhcnRfcHJl
cGFyZSsweDQwLzB4NGMNCj4gPiBrZXJuZWxfcmVzdGFydCsweDIwLzB4NmMNCj4gPiBfX2FybTY0
X3N5c19yZWJvb3QrMHgxOTQvMHgyM2MNCj4gPiBpbnZva2Vfc3lzY2FsbCsweDUwLzB4MTNjDQo+
ID4gZWwwX3N2Y19jb21tb24rMHhhMC8weDE3Yw0KPiA+IGRvX2VsMF9zdmNfY29tcGF0KzB4Mjgv
MHgzNA0KPiA+IGVsMF9zdmNfY29tcGF0KzB4MjAvMHg3MA0KPiA+IGVsMHRfMzJfc3luY19oYW5k
bGVyKzB4YTgvMHhjYw0KPiA+IGVsMHRfMzJfc3luYysweDFhOC8weDFhYw0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogVmlub2QgUG9saW1lcmEgPHF1aWNfdnBvbGltZXJAcXVpY2luYy5jb20+DQo+
IA0KPiBGaXhlcyA/DQotIEFkZGVkIGZpeGVzIHRhZyBpbiB2Mi4NCj4gDQo+ID4gLS0tDQo+ID4g
ICBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYyB8IDYgKysrKystDQo+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0v
bXNtL21zbV9kcnYuYw0KPiA+IGluZGV4IDQ0NDg1MzYuLmQ2MmFjNjYgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbXNtL21zbV9kcnYuYw0KPiA+IEBAIC0xNDIsNiArMTQyLDkgQEAgc3RhdGljIHZvaWQgbXNt
X2lycV91bmluc3RhbGwoc3RydWN0IGRybV9kZXZpY2UNCj4gKmRldikNCj4gPiAgICAgICBzdHJ1
Y3QgbXNtX2RybV9wcml2YXRlICpwcml2ID0gZGV2LT5kZXZfcHJpdmF0ZTsNCj4gPiAgICAgICBz
dHJ1Y3QgbXNtX2ttcyAqa21zID0gcHJpdi0+a21zOw0KPiA+DQo+ID4gKyAgICAgaWYgKCFpcnFf
aGFzX2FjdGlvbihrbXMtPmlycSkpDQo+ID4gKyAgICAgICAgICAgICByZXR1cm47DQo+ID4gKw0K
PiANCj4gSXMgdGhpcyBwYXJ0IHJlcXVpcmVkIHdpdGgNCj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJl
ZWRlc2t0b3Aub3JnL3BhdGNoLzQ4NTQyMi8/c2VyaWVzPTEwMzcwMiZyZXY9MT8NClllcywgSSBm
ZWVsIGxpa2UgdGhpcyBpcyBhIGJldHRlciBhcHByb2FjaCB0aGFuIG1haW50YWluaW5nIGEgbmV3
IHZhcmlhYmxlLiBJIHNlZSBhIGNvdXBsZSBvZiBkcml2ZXJzIGZvbGxvd2luZyBzaW1pbGFyIGFw
cHJvYWNoIHRvIHNhZmVndWFyZCB1bmluc3RhbGwgd2l0aG91dCBiZWluZyBpbnN0YWxsIGNhbGxl
ZC4NCj4gDQo+ID4gICAgICAga21zLT5mdW5jcy0+aXJxX3VuaW5zdGFsbChrbXMpOw0KPiA+ICAg
ICAgIGlmIChrbXMtPmlycV9yZXF1ZXN0ZWQpDQo+ID4gICAgICAgICAgICAgICBmcmVlX2lycShr
bXMtPmlycSwgZGV2KTsNCj4gPiBAQCAtMjU5LDYgKzI2Miw3IEBAIHN0YXRpYyBpbnQgbXNtX2Ry
bV91bmluaXQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+DQo+ID4gICAgICAgZGRldi0+ZGV2X3By
aXZhdGUgPSBOVUxMOw0KPiA+ICAgICAgIGRybV9kZXZfcHV0KGRkZXYpOw0KPiA+ICsgICAgIHBy
aXYtPmRldiA9IE5VTEw7DQo+IA0KPiBXaGF0IGFyZSB5b3UgdHJ5aW5nIHRvIHByb3RlY3QgaGVy
ZT8NCklmIHdlIGdldCBhIHNodXRkb3duIGNhbGwgYWZ0ZXIgcHJvYmUgZGVmZXIsIHRoZXJlIGNh
biBiZSBzdGFsZSBwb2ludGVyIGluIHByaXYtPmRldiB3aGljaCBpcyBpbnZhbGlkIHRoYXQgbmVl
ZHMgdG8gYmUgY2xlYXJlZC4NCj4gDQo+ID4NCj4gPiAgICAgICBkZXN0cm95X3dvcmtxdWV1ZShw
cml2LT53cSk7DQo+ID4NCj4gPiBAQCAtMTE2Nyw3ICsxMTcxLDcgQEAgdm9pZCBtc21fZHJ2X3No
dXRkb3duKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+ID4gICAgICAgc3RydWN0
IG1zbV9kcm1fcHJpdmF0ZSAqcHJpdiA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOw0KPiA+
ICAgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkcm0gPSBwcml2ID8gcHJpdi0+ZGV2IDogTlVMTDsN
Cj4gPg0KPiA+IC0gICAgIGlmICghcHJpdiB8fCAhcHJpdi0+a21zKQ0KPiA+ICsgICAgIGlmICgh
cHJpdiB8fCAhcHJpdi0+a21zIHx8ICFkcm0pDQo+ID4gICAgICAgICAgICAgICByZXR1cm47DQo+
ID4NCj4gPiAgICAgICBkcm1fYXRvbWljX2hlbHBlcl9zaHV0ZG93bihkcm0pOw0KPiANCj4gDQo+
IC0tDQo+IFdpdGggYmVzdCB3aXNoZXMNCj4gRG1pdHJ5DQo=
