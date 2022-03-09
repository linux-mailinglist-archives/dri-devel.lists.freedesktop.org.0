Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 822384D30DA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 15:14:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4AF10EBE6;
	Wed,  9 Mar 2022 14:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6A410EBDE;
 Wed,  9 Mar 2022 14:14:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kfyIlwQFg82YsIG8lZ2MZ47dF/R8qZBYpW9AqIxmFhHTdyTEpKwQozI45STqjsxdh2e266aTo8+TQne5wos7kPlGhmvlIpAkTjIrxr3j7wz2FV71F7ZN0LvJsVWEEoR4bbQ2G6S7la7FhuevoteE6r6ZUbAwpJGcoA+MLbUmEKsNux67Z5xPfLimcnzAT4wiwmjjWPYGXzLpIZXOhM6pYCCLacZ2SgeK0WoQHZGbU0bQXDgijPHvcIJCKmIoGfLADKdj31E2t92/Z8OJ19mW0NPHsjL4unkUbOF0NZuYZat5RxgzQ/LZuFuYIxllmrWMEm3d1C//8AQdOejI1nT1Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6tNsxFwU/YxlLyoYrEGQZ2fX8NuON6rbBfth23l0Zk=;
 b=Idx3d5qY9f0CCJ4g3jmf5oCEs/t6DTOMKIYiix+ayhv1Geh/8NXt7jTXHAUl/HBZA5vY4TO5G+mf2e/eP1KEWYOIisBi5/rO5f78BAAgqHEBeNhFV1bAK95lqxdA5Rgs178k8uAJdE82tUb7sze3HZIgRZBXZc+CXlEpR8JsSQ+dcdtRFo//InnlAzbijMa896lov8EGAK8pKyN0+6sSXSZgu1EdILyJGiFhxK6hdsdBW2LVUqWbZWGDi593Ky8ZJqWY62DiBwFVaKmhMlzjhpgRJODa/lptZqrvAxtvTR2pnfuXdgUus0507+to5s07r+OudmleIUbYvOdNitH5ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6tNsxFwU/YxlLyoYrEGQZ2fX8NuON6rbBfth23l0Zk=;
 b=tv6934iU4SkjkE4Wkt9Gjp/+HK0luMbRAj8ybut4lBTfLBJ/Cm2OUiE/+vxJ6VfYNN7IkrStWblBgHLZtgL4jr1PWCbudh+kjNciqMmqRn4sp0KMVj8caGeGwq28Zqhdet/pwuUIYYEOwjzWe5Td1ZeWT1kQuJJl8dK1OXUAcIA=
Received: from DM6PR12MB5021.namprd12.prod.outlook.com (2603:10b6:5:208::17)
 by MWHPR1201MB0125.namprd12.prod.outlook.com (2603:10b6:301:55::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.19; Wed, 9 Mar
 2022 14:14:22 +0000
Received: from DM6PR12MB5021.namprd12.prod.outlook.com
 ([fe80::8579:c3cf:2687:6969]) by DM6PR12MB5021.namprd12.prod.outlook.com
 ([fe80::8579:c3cf:2687:6969%5]) with mapi id 15.20.5038.029; Wed, 9 Mar 2022
 14:14:22 +0000
From: "Yat Sin, David" <David.YatSin@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/amdkfd: CRIU export dmabuf handles for GTT BOs
Thread-Topic: [PATCH v2] drm/amdkfd: CRIU export dmabuf handles for GTT BOs
Thread-Index: AQHYMzCrQhkGLCyhtkK6iaR3cQ6L6qy1/jMAgAEbROA=
Date: Wed, 9 Mar 2022 14:14:22 +0000
Message-ID: <DM6PR12MB50213EB7F7B527DF506CFAFD950A9@DM6PR12MB5021.namprd12.prod.outlook.com>
References: <20220308210818.2864-1-david.yatsin@amd.com>
 <97b16cd7-48f3-dab2-945a-f6fe5cb37955@amd.com>
In-Reply-To: <97b16cd7-48f3-dab2-945a-f6fe5cb37955@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c189fb4-836a-4c48-c89c-08da01d71c01
x-ms-traffictypediagnostic: MWHPR1201MB0125:EE_
x-microsoft-antispam-prvs: <MWHPR1201MB0125863DD726DBA7805518CF950A9@MWHPR1201MB0125.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VrkeUgukDDGAJw7CJX0r9TGxx/ZZJyHr+fBEV+qeK+Ua3PhIi02ev5HMIrRZF9RYJxgLQu+VZzIYJZOl7+vxG0TTrVDscSPON+89YAiW7dIH7SqTOAxnFuZ4tpuTVFdddgSAlBdam8+Qmwk1UXQmzntrE7mZg4VeDVJD74P3aNRqHyiJxBQgqf9dx7XyE5GOqTOBNm/wSnSSNuSJk5/J6iU63lbnUeeDdNb4JorXEIqqwzVjQx2tgtp7JlEjIiL4dz2yF0VE+/mNNkh6gm74P8DxPgEuPqFuaxYioS8S+l9+sY0kCPbE8S+gNHdozVjXT5Svb/fhtlc/ASGZ603BUdvnj4lGKAHeyuc01PH8ysjH1fKJs0YIMquNkwfrLcMIygC7oG15RzNp+DJWp64pgyjFUcFLquEaZmbCDQlU7tGOAr2QRwBvtejoyH1Vh+KcjiPiDTT2Y0cElP11fUJOl9gzD61KrAM3ITJrkl/57JN6qfItRNp4cDO9ifjM7/2FLB/eG6hPevE4sW8ugYqSj8Ibe2CCV/VywiFJijEBTLMmimnLLvDPgcZqwbeAOsbqgNFvvVHOIgfiuV1uePzLQei6MxKd9bwz4GjFGAfN9/qUvsx9SPMXPKMpNakMXSxRs45DbXggiBXKKQCGi7MnErpbE2+VksD+joDLMKjzywsyw6qHz/wmp7XU/F0UNZK9B18OCmgiJrPOsPszjUMGt6MFiAFoqCmX1Me15eyyIKiP0uqP/H8CVdDtU3LjKcekjYVqyqqLcMNzvJcwD28VvqKci0+/Erja4r5vemozwZo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5021.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(38070700005)(122000001)(26005)(5660300002)(83380400001)(86362001)(33656002)(508600001)(52536014)(64756008)(966005)(76116006)(8676002)(66476007)(316002)(66446008)(55016003)(66556008)(8936002)(9686003)(38100700002)(450100002)(71200400001)(53546011)(7696005)(6506007)(110136005)(66946007)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTY1bUdaaXFsZ1JWL1NQOW15bUQwRW1aNGpKMVFvS2ZpVTJqbmpOdWtvR1Ji?=
 =?utf-8?B?WkhmV01MRVJ5blFwTGZwdXRIaDJrUjF1dXRpbHpBL3lic0ZJVmx0RFdGdkhn?=
 =?utf-8?B?UXNrdVZibXg5VmFCQmcvVzBadWtOMk5Zd20wT0E1TFloN3ZCcThpdTFwalU0?=
 =?utf-8?B?UlpwbS90SGNKSzRQWUNsdmE2TmZHRXJWTEdpUEtzUVYwYUUwNlRvWURwUTZG?=
 =?utf-8?B?RHBGN3ZaRHlyeWRJNlIrcWdIam90dWxyakFGdmpuQ0VHeFdLU05WY1Z5U3pl?=
 =?utf-8?B?Vm16dkIySWJLWjhoZko3M2FDRUUrSTFFL0FMMEYzSDY5Q1ZjajVHNHAzS0Rm?=
 =?utf-8?B?eUZiY3Z5dmx5ci9XUndmSnRuZlk4U1RNNzlCeittWGRVYml6SFhqbit2Tkpz?=
 =?utf-8?B?bTdFUnBuNWdDRE9VZ1V5SVZtRTlsR3l1a1BrWkJ5V2p0ZnpheHZhYUxseExO?=
 =?utf-8?B?MnlDbExFR0ZvWFFxR0JVWUZVcmZXNUc4SkFiRkltQW12TUtGUGRGdzZ4QUgw?=
 =?utf-8?B?UjRaUXg5SEIzKzJRWHY4ektnYU5Ic1NONGw1Sk0vUGJqTHFhSFdCR0ZkSWQ4?=
 =?utf-8?B?b0JiZVVmNENMSEQ0eUt5cElOWnl3enZmaHBscnFJWlR1MVJQSE14SE0xYm1r?=
 =?utf-8?B?RG9rOFY5YlRTUE9MeUN4a01PeU1rejZpR2Z2R2taQ0xKajE5YlhMT1pLVXhZ?=
 =?utf-8?B?OEFjaFpQbkpZVENVbUt5NE5zTkkwRUsxRWdYVkxZakxVTjFnd1NWMXo3eWR6?=
 =?utf-8?B?M2JROGhqZjEzSERzRGJNUWRWbk9YN1JZRWNQZmZNcHQ3Q0lQTXBXQ0JtYXg1?=
 =?utf-8?B?cy9wZndZZHNlMlJxcDJEdEx3Nk1tVTlWcDFZRFZlSEtnR0JLV20yY0hVR1d2?=
 =?utf-8?B?ZTZSUkFUcnFueVVjNGgyVEsva29NaEEzamxNK2JhZXZxdGZ2UUJaUGVWYXlx?=
 =?utf-8?B?ZUJiVGJ1dTkyL2dTenN0N2dkMndLVTZ0Zm1KTk1ZY0IzVDk0MFpOa0dYaFNm?=
 =?utf-8?B?di9XSXR3cVlsclhHcG1iZitITWhWZkVoMEdOYTFIQTZlVDcxNlFoQnNINGFJ?=
 =?utf-8?B?ZEdCOXBzV2xGRDdqY1RJMjJRQ2MxUzgwaEkyLyt2ZDRrU29MNVhxL21sOGM0?=
 =?utf-8?B?Z0RuYmdHYkd1aEZ1ZlhUaU16OUpBcFJQR2NOMkZRa3dLYktxS29CbXh0TVFj?=
 =?utf-8?B?MlVkMVpYbm9XY0V3S1oxWHZvRzlCTWhUQTI5bGwwVmk3Vk4zZjJrVkZ3dlNF?=
 =?utf-8?B?R0hzZHJBbE9oQmRaRUpLaDdRMDF6OW1CU3BjMDBFdnYvNTVUazdNa0UzdUZx?=
 =?utf-8?B?bWNvcTIwRjk5ZS9mSDNQZURMeWpLd2ErQktrY0pEcmR4OWNvWW01QlNDTk45?=
 =?utf-8?B?WTljakcwQXpyYTN0dGVPKy9sSEs3K3pMNW9nTlErVE1Ba085UzRwc0dGMEIx?=
 =?utf-8?B?UndPSkpzWkhmbEJneHZ6NEhGZDNXdnlPMStxNTYxMjJ4VEVuL3hvaDRMK3Fz?=
 =?utf-8?B?SjYxdWloY1pieVRDNmdTaHVNd0lYQk1PNnJDT0dIb3RsU1JUZGxCYzZENGlL?=
 =?utf-8?B?dGxQK0Zsa1oyTC9ZK05WUkdPb2t0Qm93WEcvbVFrZmx2TkFYcG04RC9KK2tJ?=
 =?utf-8?B?OUFmS0ZrVXFjallkNlROTnQ1T3g1N1ZCNm5QOFRreFZrakhMRlA0UkFCSFpG?=
 =?utf-8?B?bUN3RlI2QW5Vek41azQ5K3prVDhLSlR5NXkyRGtYTHd0UFJFN2pMRTlmNm1l?=
 =?utf-8?B?cXJkZlBxZkVvanlHeW1PNU9YVmxEdzhhMnVqa1BqUXE1MlZDL3ZYUW5Mbjdp?=
 =?utf-8?B?bE1xaWw1OXdndmNpaVBNbEoxNEYrZy9pSlFlTXk5YUk2ell1SlRsNGx6dzcw?=
 =?utf-8?B?VE9tRndpbVdUQXBMSVBBc3JKblNlb0Q4MjRWd0xrZWdtTXBnUWt4alVydmJp?=
 =?utf-8?B?cGhIdm1scEQ1ODU5RGxpMEhSd2dJU1NjelpEVVlYelZKd0t0Q2JPZU45UHIr?=
 =?utf-8?B?SkZYTG9IaGpQUVQyRkRkRDBicU56R1BERUJUTWFBMHQ4U3lQVmJETXZxRjVi?=
 =?utf-8?B?Z3hURmI5Mm5FRjFQK2tWSVhFOWpXd3U3bkw2UFg2UytxUW80WklOdjE3Y1FZ?=
 =?utf-8?B?QnEyR0tIakRGS3NQRWtWaFJmTmt3d0g2Z2crcHl5TUZkTTlZendlL0U2T1Bz?=
 =?utf-8?Q?PvEt3iLlcGU8T8qgn3wYtys=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5021.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c189fb4-836a-4c48-c89c-08da01d71c01
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2022 14:14:22.5028 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nI/TGIZbOTslUV9etNE7crlxNPXoqLcjWC9sY7Y4VZFRHeekPmagwVrmkuhV9n/oy5n2X4XTtOWFIp5Iay+hcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0125
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

VGhpcyBpcyB0aGUgbGluayB0byB0aGUgdXNlciBtb2RlIGNoYW5nZToNCmh0dHBzOi8vZ2l0aHVi
LmNvbS9jaGVja3BvaW50LXJlc3RvcmUvY3JpdS9wdWxsLzE3MDkNCg0KUmVnYXJkcywNCkRhdmlk
DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3VlaGxpbmcsIEZlbGl4
IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXJjaCA4LCAyMDIy
IDQ6MjAgUE0NCj4gVG86IFlhdCBTaW4sIERhdmlkIDxEYXZpZC5ZYXRTaW5AYW1kLmNvbT47IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIGRybS9hbWRrZmQ6IENSSVUgZXhwb3J0
IGRtYWJ1ZiBoYW5kbGVzIGZvciBHVFQNCj4gQk9zDQo+IA0KPiANCj4gQW0gMjAyMi0wMy0wOCB1
bSAxNjowOCBzY2hyaWViIERhdmlkIFlhdCBTaW46DQo+ID4gRXhwb3J0IGRtYWJ1ZiBoYW5kbGVz
IGZvciBHVFQgQk9zIHNvIHRoYXQgdGhlaXIgY29udGVudHMgY2FuIGJlDQo+ID4gYWNjZXNzZWQg
dXNpbmcgU0RNQSBkdXJpbmcgY2hlY2twb2ludC9yZXN0b3JlLg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogRGF2aWQgWWF0IFNpbiA8ZGF2aWQueWF0c2luQGFtZC5jb20+DQo+IA0KPiBMb29rcyBn
b29kIHRvIG1lLiBQbGVhc2UgYWxzbyBwb3N0IGEgbGluayB0byB0aGUgdXNlciBtb2RlIGNoYW5n
ZSBmb3IgdGhpcy4NCj4gDQo+IE5vdGUgdGhhdCB0aGUgdXNlciBtb2RlIGNvZGUgaGFzIG5vdCBi
ZWVuIG1lcmdlZCB1cHN0cmVhbSB5ZXQuIEkgdGhpbmsgdGhpcw0KPiBzaG91bGQgYmUgdGhlIGZp
bmFsIGNsZWFudXAgYmVmb3JlIHRoZSB1c2VyIG1vZGUgQ1JJVSBwbHVnaW4gY2FuIGJlIG1lcmdl
ZA0KPiB3aXRoIHRoZSB1cGRhdGVkIEtGRCB2ZXJzaW9uIGRlcGVuZGVuY3kuDQo+IA0KPiBUaGFu
a3MsDQo+ICDCoCBGZWxpeA0KPiANCj4gDQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jIHwgMTIgKysrKysrKystLS0tDQo+ID4gICBpbmNsdWRl
L3VhcGkvbGludXgva2ZkX2lvY3RsLmggICAgICAgICAgIHwgIDMgKystDQo+ID4gICAyIGZpbGVz
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYw0KPiA+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYw0KPiA+IGluZGV4IDJjN2Q3
NmU2N2RkYi4uZTFlMjM2Mjg0MWY4IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfY2hhcmRldi5jDQo+ID4gQEAgLTE3NTksNyArMTc1OSw4IEBAIHN0YXRpYyBpbnQg
Y3JpdV9jaGVja3BvaW50X2JvcyhzdHJ1Y3QNCj4ga2ZkX3Byb2Nlc3MgKnAsDQo+ID4gICAJCQkJ
CWdvdG8gZXhpdDsNCj4gPiAgIAkJCQl9DQo+ID4gICAJCQl9DQo+ID4gLQkJCWlmIChib19idWNr
ZXQtPmFsbG9jX2ZsYWdzICYNCj4gS0ZEX0lPQ19BTExPQ19NRU1fRkxBR1NfVlJBTSkgew0KPiA+
ICsJCQlpZiAoYm9fYnVja2V0LT5hbGxvY19mbGFncw0KPiA+ICsJCQkgICAgJiAoS0ZEX0lPQ19B
TExPQ19NRU1fRkxBR1NfVlJBTSB8DQo+ID4gK0tGRF9JT0NfQUxMT0NfTUVNX0ZMQUdTX0dUVCkp
IHsNCj4gPiAgIAkJCQlyZXQgPSBjcml1X2dldF9wcmltZV9oYW5kbGUoJmR1bXBlcl9iby0NCj4g
PnRiby5iYXNlLA0KPiA+ICAgCQkJCQkJYm9fYnVja2V0LT5hbGxvY19mbGFncyAmDQo+ID4NCj4g
CUtGRF9JT0NfQUxMT0NfTUVNX0ZMQUdTX1dSSVRBQkxFID8gRFJNX1JEV1IgOiAwLCBAQCAtDQo+
IDE4MTIsNw0KPiA+ICsxODEzLDggQEAgc3RhdGljIGludCBjcml1X2NoZWNrcG9pbnRfYm9zKHN0
cnVjdCBrZmRfcHJvY2VzcyAqcCwNCj4gPg0KPiA+ICAgZXhpdDoNCj4gPiAgIAl3aGlsZSAocmV0
ICYmIGJvX2luZGV4LS0pIHsNCj4gPiAtCQlpZiAoYm9fYnVja2V0c1tib19pbmRleF0uYWxsb2Nf
ZmxhZ3MgJg0KPiBLRkRfSU9DX0FMTE9DX01FTV9GTEFHU19WUkFNKQ0KPiA+ICsJCWlmIChib19i
dWNrZXRzW2JvX2luZGV4XS5hbGxvY19mbGFncw0KPiA+ICsJCSAgICAmIChLRkRfSU9DX0FMTE9D
X01FTV9GTEFHU19WUkFNIHwNCj4gS0ZEX0lPQ19BTExPQ19NRU1fRkxBR1NfR1RUKSkNCj4gPiAg
IAkJCWNsb3NlX2ZkKGJvX2J1Y2tldHNbYm9faW5kZXhdLmRtYWJ1Zl9mZCk7DQo+ID4gICAJfQ0K
PiA+DQo+ID4gQEAgLTIyMTEsNyArMjIxMyw4IEBAIHN0YXRpYyBpbnQgY3JpdV9yZXN0b3JlX2Jv
KHN0cnVjdCBrZmRfcHJvY2Vzcw0KPiA+ICpwLA0KPiA+DQo+ID4gICAJcHJfZGVidWcoIm1hcCBt
ZW1vcnkgd2FzIHN1Y2Nlc3NmdWwgZm9yIHRoZSBCT1xuIik7DQo+ID4gICAJLyogY3JlYXRlIHRo
ZSBkbWFidWYgb2JqZWN0IGFuZCBleHBvcnQgdGhlIGJvICovDQo+ID4gLQlpZiAoYm9fYnVja2V0
LT5hbGxvY19mbGFncyAmIEtGRF9JT0NfQUxMT0NfTUVNX0ZMQUdTX1ZSQU0pIHsNCj4gPiArCWlm
IChib19idWNrZXQtPmFsbG9jX2ZsYWdzDQo+ID4gKwkgICAgJiAoS0ZEX0lPQ19BTExPQ19NRU1f
RkxBR1NfVlJBTSB8DQo+IEtGRF9JT0NfQUxMT0NfTUVNX0ZMQUdTX0dUVCkpDQo+ID4gK3sNCj4g
PiAgIAkJcmV0ID0gY3JpdV9nZXRfcHJpbWVfaGFuZGxlKCZrZ2RfbWVtLT5iby0+dGJvLmJhc2Us
DQo+IERSTV9SRFdSLA0KPiA+ICAgCQkJCQkgICAgJmJvX2J1Y2tldC0+ZG1hYnVmX2ZkKTsNCj4g
PiAgIAkJaWYgKHJldCkNCj4gPiBAQCAtMjI4MSw3ICsyMjg0LDggQEAgc3RhdGljIGludCBjcml1
X3Jlc3RvcmVfYm9zKHN0cnVjdCBrZmRfcHJvY2Vzcw0KPiA+ICpwLA0KPiA+DQo+ID4gICBleGl0
Og0KPiA+ICAgCXdoaWxlIChyZXQgJiYgaS0tKSB7DQo+ID4gLQkJaWYgKGJvX2J1Y2tldHNbaV0u
YWxsb2NfZmxhZ3MgJg0KPiBLRkRfSU9DX0FMTE9DX01FTV9GTEFHU19WUkFNKQ0KPiA+ICsJCWlm
IChib19idWNrZXRzW2ldLmFsbG9jX2ZsYWdzDQo+ID4gKwkJICAgJiAoS0ZEX0lPQ19BTExPQ19N
RU1fRkxBR1NfVlJBTSB8DQo+IEtGRF9JT0NfQUxMT0NfTUVNX0ZMQUdTX0dUVCkpDQo+ID4gICAJ
CQljbG9zZV9mZChib19idWNrZXRzW2ldLmRtYWJ1Zl9mZCk7DQo+ID4gICAJfQ0KPiA+ICAgCWt2
ZnJlZShib19idWNrZXRzKTsNCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L2tm
ZF9pb2N0bC5oDQo+ID4gYi9pbmNsdWRlL3VhcGkvbGludXgva2ZkX2lvY3RsLmggaW5kZXggYjQw
Njg3YmYxMDE0Li5lYjlmZjg1Zjg1NTYNCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL3Vh
cGkvbGludXgva2ZkX2lvY3RsLmgNCj4gPiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgva2ZkX2lv
Y3RsLmgNCj4gPiBAQCAtMzMsOSArMzMsMTAgQEANCj4gPiAgICAqIC0gMS41IC0gQWRkIFNWTSBB
UEkNCj4gPiAgICAqIC0gMS42IC0gUXVlcnkgY2xlYXIgZmxhZ3MgaW4gU1ZNIGdldF9hdHRyIEFQ
SQ0KPiA+ICAgICogLSAxLjcgLSBDaGVja3BvaW50IFJlc3RvcmUgKENSSVUpIEFQSQ0KPiA+ICsg
KiAtIDEuOCAtIENSSVUgLSBTdXBwb3J0IGZvciBTRE1BIHRyYW5zZmVycyB3aXRoIEdUVCBCT3MN
Cj4gPiAgICAqLw0KPiA+ICAgI2RlZmluZSBLRkRfSU9DVExfTUFKT1JfVkVSU0lPTiAxDQo+ID4g
LSNkZWZpbmUgS0ZEX0lPQ1RMX01JTk9SX1ZFUlNJT04gNw0KPiA+ICsjZGVmaW5lIEtGRF9JT0NU
TF9NSU5PUl9WRVJTSU9OIDgNCj4gPg0KPiA+ICAgc3RydWN0IGtmZF9pb2N0bF9nZXRfdmVyc2lv
bl9hcmdzIHsNCj4gPiAgIAlfX3UzMiBtYWpvcl92ZXJzaW9uOwkvKiBmcm9tIEtGRCAqLw0K
