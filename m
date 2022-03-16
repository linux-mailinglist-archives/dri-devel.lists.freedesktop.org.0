Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4344DA8DD
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 04:24:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D188610E168;
	Wed, 16 Mar 2022 03:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111DA10E168
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 03:24:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBtraDTSsdrd1ncwDcd+ffpECp3AvFk9BXOwcFNR5eus8bhZIQ561sgWAlj0wmb/j49YwOoSq05soRb8jlE6P69rv9EbqqmcUjeyHhTlQexuRT3hMEyn5orId35qK5VD9y8pPxGSOkzYAOWMbn1DeFyVVzBoiDE4BYZ/NgtPunHN57z0JdfapsI/g+jbcynRlyrISFT70LNRmv+TAgnOYnlxhS2CV5zaiwYhZoK/jhe7NXtUhD4VwKBizMQAmVNb1/OJvptMsQ8kM83yEdUA7jFm6ksj2JmVZRzOWs66M7Nj+XTOlZpM2dZkE8EfDWxBBvolslK80Gg/GHxDh2YL+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXc2oASX5q8pa1WEKJczrV7LHS38VZgFlAYDskarI4E=;
 b=QfNssEp/bf27y/bQQdMePh9jKjz2d5IHKdxbjfcLO9vew+Pyo7P140d0j6xZ5ndUhgJky5h8b6KC7lY64zyCIK7T5FFeZrcTpzQ89uzZa3KTnkmmZxWfSXe9UpePxKi+CSB4SgxqyT89Gu1YDnyMBVdXGsNejVZDxP9HfbUkTIDs+TpugWkisN3aBuBYNZh8+vpMgu4ThPAs5MM1kQojlEoojh9QcE74+/VBjr9V9+x80ReW9Tv5Hou9SpJsNa2lf0sLveEYfY6287fpCK4hsiRAokPYXTsJ6ftkjid4Sa2Y28wvPVFWTe421Ws04VVFYvrsm+KrOScdJ2s77slhqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXc2oASX5q8pa1WEKJczrV7LHS38VZgFlAYDskarI4E=;
 b=c8KrdSaUpgdvOHOlqybFdnUm43yTYrAgUo/dezWF2PpaTwoJ2NJ76hA77/wTTSIW2YfpQbH8R/CRoMeoq46n2sD3Zjd3t5Z1/QMmQrlVxKHB09sBRGESTqVY4wFwv5WE0yM3AkTFGjvdrwk7H+w6KubMxoH6LPuHU3wwKKngZ3Q=
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by SJ0PR05MB7342.namprd05.prod.outlook.com (2603:10b6:a03:285::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.13; Wed, 16 Mar
 2022 03:24:08 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::c029:c5b4:6e3c:e8c]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::c029:c5b4:6e3c:e8c%7]) with mapi id 15.20.5081.014; Wed, 16 Mar 2022
 03:24:07 +0000
From: Zack Rusin <zackr@vmware.com>
To: "chuck.lever@oracle.com" <chuck.lever@oracle.com>
Subject: Re: KASAN splat in vmwgfx driver
Thread-Topic: KASAN splat in vmwgfx driver
Thread-Index: AQHYOM8rPVlc0tAUtUWLkaZ1uU6s1KzBWPcA
Date: Wed, 16 Mar 2022 03:24:07 +0000
Message-ID: <bf950aa65380a4e3b1f61a24dbff20ca40690cf4.camel@vmware.com>
References: <A31D4988-1D08-438D-B1D3-F80DDB244D62@oracle.com>
In-Reply-To: <A31D4988-1D08-438D-B1D3-F80DDB244D62@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4-1ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d0fe40cd-b5c1-4e10-81ce-08da06fc6e2a
x-ms-traffictypediagnostic: SJ0PR05MB7342:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <SJ0PR05MB73422F0F3FD9B41829619547CE119@SJ0PR05MB7342.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5bpsXuuUa+7vUG3x0S58X+2ivU55r6iPGSOPbPJuiA62DIPrUjSASr5/C4RnCPgL6+QeQXhGb1VHVeGrZJAPiA98GoPc+yQveDszRfe6ukOmDu8fARsjjYv1VwTALS4/GjlC+MiBLGH0LQioJHFenDy2rg33HRr9eV1mCIJ14uGVwFAj0S7QXr8MlyWxF8xLCTYqb4FdkQ5c4/u4kDR2FUAnfGsB8jDYVb18RYHavwmEDleoiXS09dXyjTRrImHQXoCijTs9jn/7s5uSTvQ88ypJrpQnzfXe2fjOmXeS9tXodkbLvPOZNKK8YT4/sSsSymH2v57Y3f4luGPX3Qe8acLJlf/UItLryEDiQc5o5jExyylTovhKwHGyn/Hs/ZGI9jlWab4Y0ooqfSC11057B2J+nLtDG0a3x3NqZOsg6X+Lk914UEmPMP7gCfRYTQWTN7VBhmlmtS8PjImsPXqm9wDsdbtDGVO/lMHHioC6j2j+Mmgj54hin2E84pZK9a0Af+AqPOXvi32erYRjytdpvKiVNyH3M4wxRJhYIY+hI2Z+/QTtMkSLsSqCZT7REBspNmWECRwYQeH9qkfUsUg1IUv3kkUjnxlg09yKrExZcr9fmv6HxqX0fFC0MpIKiFBw/++nojKrBksL9en/QWcruqLwUkHfj+3tVzw3suA3i7puf2yZMWmI0oPRTV8Z/6ptqhcLTM1x3rMxO7lLWgDf5kkuV4FKmHBy4v1K24xTJng=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4744005)(316002)(122000001)(38100700002)(6916009)(6506007)(6512007)(2616005)(5660300002)(2906002)(36756003)(83380400001)(26005)(186003)(38070700005)(8936002)(508600001)(71200400001)(6486002)(8676002)(64756008)(4326008)(66476007)(66446008)(76116006)(86362001)(66946007)(66556008)(40753002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bXhybWRJV0dWK08rZndBQlNYN3gvN1ZPRk9hMGdWY1lsVUgzL1Z2Tm5tZTlB?=
 =?utf-8?B?VnJRNGlVeFBOZ2tnWFVueVV2YS9UMi9LcDZLTXpXTkw5NnM5Y3Z1OTVJVFdE?=
 =?utf-8?B?emN3dnNIekFQaHJaMmpyKzhlZGtrOHhqeHFtN051ZGVhZjhISC9GMDFsWlpa?=
 =?utf-8?B?SnZ6cC94RjBhTFlLNUhGMnBzKzl5Z1IvbmxlMGo3N1gxV3RmcXZ5QnVhVnNE?=
 =?utf-8?B?a0RLaGthaHN1ZHZ4VXI3SjVISklNdWhWQlJ6STBIcDR0Rk5xalJqN2RtdGM3?=
 =?utf-8?B?SVEzZGVxa014akJvaDNIWDQ3R2loMFRjQld4OTUxVTFlbnZOSkE1RSt3cElX?=
 =?utf-8?B?WTdNM3JPOVlUTDZ0N0RQcUxiVHZFeWZOeU92dEpCVDJaWFQzMStmMEEwSU1r?=
 =?utf-8?B?a1NKMmZNUGl4N3RkMjRQUHMzWFRjMUlWdHRnUllNWHgzcWFCOFRCZGZueWtu?=
 =?utf-8?B?L3dUMTE2a2ZFRElTUjRhQ2hhVWVPZGowbms2Y0p6dStnUHBVcGxBM0xDYVdp?=
 =?utf-8?B?d3VRQUxuU0oyYVpsVjlmU3A2RXQybVZkQ0g2cEpkZG1MdGliOWZPRFUzS3NE?=
 =?utf-8?B?RFEyY2QvUWd0THgwSms3SHBKcHVHSndrUUQ0dlNKOTJiS1B3cWdtK3Bxako2?=
 =?utf-8?B?UXpqVW1CVDYzZmtRU2hmM1lUWWVyQjRYWDhmd1lDSVRDYzdLa1dwTHU0MDE0?=
 =?utf-8?B?bVpIQ3JHZzBkdDNJd1lnYmpmQVBBanoyeGR1d3pqQkM2Rm5zeUZPK0dCS0Uz?=
 =?utf-8?B?QTgyb01QTjVzQllJeTkyc0t5WGtEdXRHdnNENVVXYWNaQklMVkQrMlprcUVl?=
 =?utf-8?B?MzR6THJaek5kSFhqV0cwbHRsdGRSVytxUzlyWkZlN1UxUXZiZGFERTVpbUVZ?=
 =?utf-8?B?TUg0a3NDM2pxZXY3cFdhRHVUWnpIbTNydXZqU1YyR3NYOXI1UWNaYlkrVTlU?=
 =?utf-8?B?eEhuVnNDNy9lS0t0LzN2anBJb3pkNXY5VXZVOXdYd2FiZkE4ZzlFV2FuY3dj?=
 =?utf-8?B?RUMzczYxV01XaDlhUTZxektya2xHRjAyRFhBajVHVGZGd1RGb25VY0NadG93?=
 =?utf-8?B?djQ0eEZndVQ5cUExTnk5dS9LZXNoWXRWNHZyUitPRVBVMmtMNXdLL1dkc0I2?=
 =?utf-8?B?MVlIQWRldVRJSVlBZDNVbGIvV1VIRlNrTHkrUEJoNTdYZEplUGY4WklWWDJ3?=
 =?utf-8?B?QUltNm5iTk1hNzR0OHBrUnZSZXJDRm95ZkkrdWcyRmdMU2JJZmFqVjUzTVJG?=
 =?utf-8?B?a3l0aXVCVXZ3U1VWNFhORkc2dEdsYnVRMGJJMmdUaXJmZWZMTVVRcW04c2pV?=
 =?utf-8?B?RmQxcXhudzR3UGwzYXlOeVBEdE9CaXdMT1hDdXVhVFJsNXpwejFkd1gxaGxP?=
 =?utf-8?B?bkV6c1QzM3duZHFjSWZvNDF5UjA5UERDdjhNSk1YbjRDaTk2QTVYYjd5ZDNk?=
 =?utf-8?B?VTZkVU4xZWZhSW5kbEM5SzdwVDZYeTcreGd3VkVxQkEzZHgvS0srVlBYNkJJ?=
 =?utf-8?B?ZEdsUC9jbEJPWDVyL2dLaG4vTXZ0cHhQeU1ZT2RKUEgvdHh5SHpLcGl2SnJr?=
 =?utf-8?B?WFlZZUdyWkM0ZWtpenRPRTJla3RUUHJYaENSamhNVHEzQjVhS1NkWmVOOWN6?=
 =?utf-8?B?UEpPQXBxMnpmYlNybXo4U2M4MElaWWhSUXBpb3k5b2dLK2Q0czRHTC9QVnYz?=
 =?utf-8?B?c1NvMC9nV1ZFVEFGQVN6MElJZUJOQWRkNHNTdjBvOXFOS1ZPQjZPeW9LcUxZ?=
 =?utf-8?B?T0Q4YkRLVnZQNXFiVjFmT0xKRlJWRHYwRzFidGZ2ODlKVlBtRkZQMGM3dFVy?=
 =?utf-8?B?ZVVjQWc3b1JrODVpcGRyWU5IaVppcWd1eHlrQzVnK0ZOcjBDQWlpQk5MKzFl?=
 =?utf-8?B?YmRIUlUyeTdTak1SNGJaaG9QcHJGRDc4UDdldCtaVHk4dTN0dDlrekVMS04v?=
 =?utf-8?Q?IqAAtavtYs25n1o9ukwRPIybJ+Mk95fZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9077FB1A5855854FA352E3D81AFA1772@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0fe40cd-b5c1-4e10-81ce-08da06fc6e2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 03:24:07.5526 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DQvUXPXRqtYrb3WlZhSd6nfeQKCF4nVk73HqI48Pc3qgJilAG9qS6kjkmIl4f9AvVwQH2ofXcvBY3YNUgRkI4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB7342
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIyLTAzLTE2IGF0IDAwOjQ1ICswMDAwLCBDaHVjayBMZXZlciBJSUkgd3JvdGU6
DQo+IEZvciBhIGtlcm5lbCBkZXZlbG9wbWVudCBwcm9qZWN0IEknbSB3b3JraW5nIG9uLCBJJ20g
dXNpbmcNCj4gTGludXggaW4gYSBWTXdhcmUgZ3Vlc3QuIEFmdGVyIGtlcm5lbCB2NS4xNi4yLCBJ
IG5vdGljZWQNCj4gdGhpcyBLQVNBTiBzcGxhdDoNCg0KQWgsIHllYSwgdGhhbmtzLiBJdCdzIGJl
Y2F1c2Ugdm13X2JvX2NyZWF0ZV9rZXJuZWwgY3JlYXRlcyBhIHJhdw0KdHRtX2J1ZmZlcl9vYmpl
Y3QgaW5zdGVhZCBvZiB2bXdfYnVmZmVyX29iamVjdC7CoA0KDQpXaXRoIHRoZSBjaGFuZ2UgdG8g
YWxsb2NhdGUgdGhvc2UgbW9iIGJhY2tlZCBvYmplY3RzIGluIFZNV19QTF9TWVNURU0NCndlIGhh
dmUgdG8gbWlncmF0ZSB0aGVtIGZyb20gVFRNX1BMX1NZU1RFTSBidXQgdm13X3F1ZXJ5X21vdmVf
bm90aWZ5DQphc3N1bWVzIHRoYXQga2VybmVsIG9iamVjdHMgbmV2ZXIgbWlncmF0ZSBhbmQgc28g
YXJlIGFsd2F5cw0Kdm13X2J1ZmZlcl9vYmplY3Qgd2hpY2ggaXMgbm90IHRoZSBjYXNlIGFueW1v
cmUuDQoNCktBU0FOIGhlcmUgY29tcGxhaW5zIGFib3V0IHRoZSBjb250YWluZXJfb2YoYm8sIHN0
cnVjdA0Kdm13X2J1ZmZlcl9vYmplY3QsIGJhc2UpOyBpdCdzIGluIGdlbmVyYWwgaGFybWxlc3Mg
YmVjYXVzZSB0aGUgcmVzdWx0cw0KYXJlIG9ubHkgdXNlZCBpZsKgbmV3X21lbS0+bWVtX3R5cGUg
PT0gVFRNX1BMX1NZU1RFTSAmJiBvbGRfbWVtLQ0KPm1lbV90eXBlID09IFZNV19QTF9NT0Igd2hp
Y2ggaXMgbm90IGdvaW5nIHRvIGJlIHRoZSBjYXNlIGhlcmUsIGJ1dCBpdA0KaXMgYW4gaW52YWxp
ZCByZWFkIGFuZCB3ZSdsbCBnZXQgdG8gaXQgYXMgc29vbiBhcyB3ZSBjYW4uDQoNCnoNCg==
