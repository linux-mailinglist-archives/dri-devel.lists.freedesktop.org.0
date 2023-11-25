Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 923BB7F877E
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 02:23:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C4A10E02E;
	Sat, 25 Nov 2023 01:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW2PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012009.outbound.protection.outlook.com [52.101.48.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9967C10E02E
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 01:23:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnhJERccsEKLBvBc6FZ5xaWbNu7dWThcEe/bRaMgDuVAAfWM6mBhdJI/r1/QtJK2DO2iAp3jjdsh9Z+N+oOM6enmfFITsbT428XLROA07vBC1RYvbVB/M2DVHCsOzpeYfvA3IT8FW0t35N7PgietTD1BoPO1qClNE1++RTCgFsTqkJoe6fn6zAVg8Ejjw5HVjWUzR/n3ygQWtjW4DyFsWer54F0kgOeQBFl+K9XgR9efZoh6VeCA5vM08F1ufpBjVr7245VQ7HpS4N+r1mMe+c0xtiwgLIuDdsWzfTso/SPeSB1sYz81ARFoDg21JLWLcqep2Cw6W85Tg2QNBifWgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qQjLuqcfafIZoSL8igaFhk48rZPHM8HffNfrWzAFio=;
 b=a2QOOpI3bZcuCvxt8X9cX47OtVoiId6UULbusGgeTG2BPDx2QMFf37t4s67mUVefi9sqa4KW/Ou3Wm6klDL9qrbGUrz/qCEJpj+8gQ9/AD0lkXmnsHBhgnqDRUlx6g121FGhvlKv3fPnK/rM1Pt5ly4dgXc8eyVE3S/oFvZlmBsJygbYOo38uLqKqDfR4ZE+1VwoMhgYDL5S94Jp22As6Sf8bPAk/A40IDIxQg8Ur5l8+zO7t7JhtIVjCfLsdUX0mQV5z1LK9F2sTJJWp9m+Ia+0SigDAS/K5InwnRZMCiXIgqnoylY9yPWI+5VIowMzbLsAmbw6EKTF8A/HW0DpGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qQjLuqcfafIZoSL8igaFhk48rZPHM8HffNfrWzAFio=;
 b=AJElrAjh6mw4GdjnyVPTAbDPq03BKMMU3sNVMxquLtT4xm4IVEU0sgZz1g+YtCabH44GvQYQ795sCRUVX3/PV91iHM3E2rJmsHS/wS+SvOCsAPxhUEZBiCp0l2gZxqHRlgiMDDnH+ysScI6UcR9urTY8XOLK41efRNzaplN8VXs=
Received: from MWHPR05MB3648.namprd05.prod.outlook.com (2603:10b6:301:45::23)
 by SJ0PR05MB9868.namprd05.prod.outlook.com (2603:10b6:a03:4e3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Sat, 25 Nov
 2023 01:22:58 +0000
Received: from MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7]) by MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7%2]) with mapi id 15.20.7025.021; Sat, 25 Nov 2023
 01:22:58 +0000
From: Alexey Makhalov <amakhalov@vmware.com>
To: Simon Horman <horms@kernel.org>
Subject: Re: [PATCH 4/6] input/vmmouse: Use vmware_hypercall API
Thread-Topic: [PATCH 4/6] input/vmmouse: Use vmware_hypercall API
Thread-Index: AQHaHZv+HhGdPqcT2UGcVBmuH/XNJ7CJ4rEAgABd4wA=
Date: Sat, 25 Nov 2023 01:22:58 +0000
Message-ID: <A64E0517-57D9-47DF-8DD8-040EE6843246@vmware.com>
References: <20231122233058.185601-1-amakhalov@vmware.com>
 <20231122233058.185601-5-amakhalov@vmware.com>
 <20231124194646.GW50352@kernel.org>
In-Reply-To: <20231124194646.GW50352@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR05MB3648:EE_|SJ0PR05MB9868:EE_
x-ms-office365-filtering-correlation-id: 8d3cdbff-e726-45bf-cee2-08dbed550f26
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aN07+feasDGqc1bp9Eow4HucTwy+6QW0CDziNoThPvbc8JtUbQY8U29NW5FBT40ygKM0HAa2JMMb/dDnDVTrWcm1lh32ayDA5M14YPg19QGICfzb0UhCZtTXzvCR9hyZNM+ls41io8/4EkracMSLaoRSoxD7YSLunuQJqzAY23W08Vu+tea0jFYX07TTwK5QqC+/rWhmQL7CwDFpdvVHmqsY0x0N2A4VpYdFcKAKcS1L/sqeWWbpo5so748QHdDKxKwzfRLkVn83V0HsMY62VyRgYJ0uLsO8hKtjBuwNf9WyioznmYDEQSLOXfnwTxHopm6gDR3ePwbIy+upK+Kn/nhOOcs+5b8nTBiVM+0zKxrYVU8OB3w43plHqJJMtYg75ZKnHNzIiVi0AEHM0rI9smuGIO32+K6qqI1uABIEeFKuIUzhiwVGMqXkUXT1nLP7TvRF6gtVUAb+gnti467103QNAZfz7oRtWSILb2SuyUaCCHvNh1Ztner72ENcsFlgQTvtCi/44as9ev5g/+m8bh4bMdjmaQzR1xOpE+vOKQgRK/EXT0tXLHoWeSTYR3k++2Nn44V1O3CuqkQAUfY+6+se5MBIp+A+AYbeuRaXQCO7uTmdsYXzISXDUPfJqTFYRMXKASyH5VM9WK8AHMC56VQDqZRRSpUsNtu+xGZlYFB3ATP+2r4WkUxzBQoaNd3mPBMDJwbLrunxiQJRoyOrNA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR05MB3648.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(396003)(366004)(136003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(5660300002)(7416002)(4326008)(8676002)(8936002)(2906002)(41300700001)(316002)(6916009)(66476007)(66556008)(66446008)(64756008)(66946007)(76116006)(91956017)(54906003)(38070700009)(86362001)(71200400001)(6506007)(478600001)(2616005)(36756003)(6512007)(33656002)(53546011)(26005)(122000001)(107886003)(83380400001)(38100700002)(6486002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWpYQURRSnpSMEZMdkExWUxRdDI1T2JLSFlMWjVNRlVUSktoK1pFdHZxL0k3?=
 =?utf-8?B?YWdLWVJmU1N5dVh5dUg3MGtaOWlaQUlBRFNmQXN6QmFrWGQ0MkE1RlZxazBz?=
 =?utf-8?B?ZlBMUlZDeFVCL0pobU5FSjgybVp6eDNYZ0huUnZ2UGNJWUhFbW9qa3pBVGd2?=
 =?utf-8?B?UHlRSlZsOWh0WmRvb1JSRWcvUTN5M2pZTW5VMWxIdElOZE9MYUpaQTJVU2p4?=
 =?utf-8?B?VDJCU3ZjS2VXQTkzbm5pcENkeFREQ3Z4cU8yREkvOGtUSUpUdVh3alRONWU3?=
 =?utf-8?B?UU1VdkFMdVRzbFVTOC9YVnhkVHRIUWhBZnhwcE82aitpM1pIQnNIb29hNHZk?=
 =?utf-8?B?S3FBZ1JuYXhEV3pRRUJXbVVCSUdrSXZReDI1NjBTN2tHaytRWk5RN29TWjI2?=
 =?utf-8?B?VytoOTh0UUplYzJjQ2FBK1Z4SlEybzdaU0laeUlyMFE4N3NEdGs5a1BoNFZY?=
 =?utf-8?B?UHdXdHQ2OTVQNkljeFhOSFhKS0pDMkZ3aDI0T1FicDlrSVRrT2tmbUY1OStI?=
 =?utf-8?B?bVFhbXRnRVphazFsOTljY1NQa1NsZmR3ZW53ME4rM24zSU5xMjBFa2pweWZS?=
 =?utf-8?B?SHVXbkdmWm5LM3NJMTZaWWNqWFY1U2dGeHZMa3hCVjJwZW4wWmE0NWFnRGdJ?=
 =?utf-8?B?VXJnakVYeVMrdjQvMGZkbmhLZFVidkJTOGZBdmpuNjlld0pMU3NQSG5hSEhR?=
 =?utf-8?B?QUVzQnVWUHRpVGIwQzJIajZHckF5YS9Rdk14ZUZCcWJZQkNvVkJDTHBMaE9K?=
 =?utf-8?B?dGZPenRjdnA3Z2dyb21OOUNRYzY4cnE0bmZsZVN5dllYN21uVGVPVVJ4R3VT?=
 =?utf-8?B?blBnczZ5S3lDdWR1d1RKS2Q4SzVpL1owUlVyM2ZHZXMweUtUY3pUaU1wdnpn?=
 =?utf-8?B?QWt3OE1qdlFORUJ6WEVMRytsY1VOaXNHMUNnL1N4RHZtdUoyWTVwYzAwY2xR?=
 =?utf-8?B?NllQN3dBemlxNlliM1QzNSs5SmxlcmZzLzhjUm9kMjZVUGJpWEZKbnlLMHJD?=
 =?utf-8?B?NzlZZHdzY0s0TXdKdk5zUG83QW9uSUFJWSt0bjlxTFJtdVZBZG5ITjlvVnU1?=
 =?utf-8?B?MEhRaU43U0lLYVJXNER1cGdaT2loY3F5b3RnQjJkYk5VNjZYMlE5cEdOeUZs?=
 =?utf-8?B?OERMYTRTTEdRVGtsOWtKVm1rUlE0RFVYTFRDVEoxb05MVlpqMVVXdHNvcnNS?=
 =?utf-8?B?ZUhuTEdZUkNhY3JMRXY0bG1mdlB6aTVVRmhqT3ZMbHl2ekJzRnRKS2JHa3FN?=
 =?utf-8?B?VDlaRUZsRXRJbXJxYUUwMDJ3UkVlaDJJZ3ZsQjE3Qzc2aDBDSjY0YzNpUTJz?=
 =?utf-8?B?R3NoNTRPcTd6ZjNGR3locDhkcGEvZFZ1TVU3TUZ5MHpabkdvQ1NSaG96L1VQ?=
 =?utf-8?B?Tkg3d0NtUFZiOERiU001TmlVaDhOMnJJS2JaWEFOVmtIUHcrQ0hPbXZNeFlj?=
 =?utf-8?B?S01PdWZoNEYvSXAzN2ZGM1dCT0l3WVluOXJxeGdwVVQzK0FwaVNBa0hmMm82?=
 =?utf-8?B?a0tDOUluUlhQNEZybXdxK20xMjYrTFZiaDZpVnlNODlYdGpGMGZUUWNVS0tK?=
 =?utf-8?B?S1l1MllDNytDYmptdlFRS084TWhwV3FKZVZsa3lvZDhtVDNWVmpLQU5rQzBG?=
 =?utf-8?B?WXVrRjFZY0VlbEhUVlpWb3NTRzVhYTJiSkU5OFBNcmZpSTRqZlVuWU94TElu?=
 =?utf-8?B?RVpHV2JNVldqSVNrRHBTdWRrNlFJSUZ4ZE5jK1dLb3hwMVhGVTNJSFh0ZUtW?=
 =?utf-8?B?OVFQNXRQVnRqVXRHd0hUODFlT2dwQVI5aUI0RkVYeXdvNVd0blZESWxjRVBY?=
 =?utf-8?B?cUJQSDFIKzI0MXR3WDZyV2tnOVAwd09jVlpjcXZLY01PSm1wODE2N05wVVp3?=
 =?utf-8?B?VlJINXZpcFJ1VEJWWjdSU210VDU2Q1lhYWlET1lsY25aS1JBbFB1MmVDdEhj?=
 =?utf-8?B?TE00ZW9jNTNZa2xpVS90YkpZZE5lUTFoOTluMEMyZGR6cTNzM0FKWXF4d0Z2?=
 =?utf-8?B?djQzclRYWFdHeGhWRUVCNnVvS255di84SXFvQ1dWTjRnYzNsV1dXSWp2VHdx?=
 =?utf-8?B?ajN2NVYrRmZucDNtWWdJZzFOVzAvZXJLU0lzdUJUTGtVVTZOc1orNTc5bzll?=
 =?utf-8?Q?98Tad7qIiJnzZzEizXqtvJn3h?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A9245C4B9726F45B72EF49ACCDA5B23@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR05MB3648.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3cdbff-e726-45bf-cee2-08dbed550f26
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2023 01:22:58.5186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ujy95XAwBrV/ZyWdQfIPLCsWV3V0zvQpT3sAh7oKe0pcEKfQfcIicbXPygMGIXjwB62RtIznT/GBJaYLlSRNkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB9868
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
Cc: Pv-drivers <Pv-drivers@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Nadav Amit <namit@vmware.com>, "H . Peter
 Anvin" <hpa@zytor.com>, Tim Merrifield <timothym@vmware.com>,
 "dave.hansen@linux.intel.co" <dave.hansen@linux.intel.co>,
 "x86@kernel.org" <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "richardcochran@gmail.com" <richardcochran@gmail.com>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "mripard@kernel.org" <mripard@kernel.org>, Ajay Kaher <akaher@vmware.com>,
 Jeff Sipek <jsipek@vmware.com>, Thomas Gleixner <tglx@linutronix.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bp@alien8.d" <bp@alien8.d>, "tzimmermann@suse.de" <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTm92IDI0LCAyMDIzLCBhdCAxMTo0NiBBTSwgU2ltb24gSG9ybWFuIDxob3Jtc0BrZXJuZWwu
b3JnPiB3cm90ZToNCj4gDQo+IE9uIFdlZCwgTm92IDIyLCAyMDIzIGF0IDAzOjMwOjQ5UE0gLTA4
MDAsIEFsZXhleSBNYWtoYWxvdiB3cm90ZToNCj4+IFN3aXRjaCBmcm9tIFZNV0FSRV9IWVBFUkNB
TEwgbWFjcm8gdG8gdm13YXJlX2h5cGVyY2FsbCBBUEkuDQo+PiBFbGltaW5hdGUgYXJjaCBzcGVj
aWZpYyBjb2RlLiBObyBmdW5jdGlvbmFsIGNoYW5nZXMgaW50ZW5kZWQuDQo+PiANCj4+IFNpZ25l
ZC1vZmYtYnk6IEFsZXhleSBNYWtoYWxvdiA8YW1ha2hhbG92QHZtd2FyZS5jb20+DQo+IA0KPiBI
aSBBbGV4ZXksDQo+IA0KPiBpdCBpcyBub3Qgc3RyaWN0bHkgcmVsYXRlZCB0byB0aGlzIHBhdGNo
LCBidXQgSSBub3RpY2UgdGhhbiBhbiB4ODZfNjQNCj4gYWxsbW9kY29uZmlnIGJ1aWxkIHdpdGgg
Vz0xIHVzaW5nIGdjYy0xMyBmYWlscyB0byBjb21waWxlIHRoaXMgZmlsZS4NCj4gDQo+IEl0IGFw
cGVhcnMgdGhhdCB0aGUgcHJvYmxlbSByZWxhdGVzIHRvIGJvdGggcHJpdi0+cGh5cyBhbmQNCj4g
cHNtb3VzZS0+cHMyZGV2LnNlcmlvLT5waHlzIGJlaW5nIDMyIGJ5dGVzLg0KPiANCj4gDQo+IGRy
aXZlcnMvaW5wdXQvbW91c2Uvdm1tb3VzZS5jOiBJbiBmdW5jdGlvbiDigJh2bW1vdXNlX2luaXTi
gJk6DQo+IGRyaXZlcnMvaW5wdXQvbW91c2Uvdm1tb3VzZS5jOjQ1NTo1MzogZXJyb3I6IOKAmC9p
bnB1dDHigJkgZGlyZWN0aXZlIG91dHB1dCBtYXkgYmUgdHJ1bmNhdGVkIHdyaXRpbmcgNyBieXRl
cyBpbnRvIGEgcmVnaW9uIG9mIHNpemUgYmV0d2VlbiAxIGFuZCAzMiBbLVdlcnJvcj1mb3JtYXQt
dHJ1bmNhdGlvbj1dDQo+ICA0NTUgfCAgICAgICAgIHNucHJpbnRmKHByaXYtPnBoeXMsIHNpemVv
Zihwcml2LT5waHlzKSwgIiVzL2lucHV0MSIsDQo+ICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fg0KPiBkcml2ZXJzL2lucHV0
L21vdXNlL3ZtbW91c2UuYzo0NTU6OTogbm90ZTog4oCYc25wcmludGbigJkgb3V0cHV0IGJldHdl
ZW4gOCBhbmQgMzkgYnl0ZXMgaW50byBhIGRlc3RpbmF0aW9uIG9mIHNpemUgMzINCj4gIDQ1NSB8
ICAgICAgICAgc25wcmludGYocHJpdi0+cGh5cywgc2l6ZW9mKHByaXYtPnBoeXMpLCAiJXMvaW5w
dXQxIiwNCj4gICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gIDQ1NiB8ICAgICAgICAgICAgICAgICAgcHNtb3VzZS0+
cHMyZGV2LnNlcmlvLT5waHlzKTsNCj4gICAgICB8ICAgICAgICAgICAgICAgICAgfn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fg0KPiANCj4gLi4uDQoNCkhpIFNpbW9uLCB0aGFua3MgZm9yIHJl
cG9ydGluZyB0aGUgaXNzdWUuDQpaYWNrLCBwbGVhc2UgdGFrZSBhIGxvb2suDQoNCuKAlEFsZXhl
eQ0KDQo=
