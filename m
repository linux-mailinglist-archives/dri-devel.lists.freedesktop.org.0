Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 957D988F95F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 09:02:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F8D11234E;
	Thu, 28 Mar 2024 08:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=armchina.partner.onmschina.cn header.i=@armchina.partner.onmschina.cn header.b="PjDzdWN5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2129.outbound.protection.partner.outlook.cn
 [139.219.146.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C8111234E
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 08:02:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDJ59lxw8GBXl3aPujhMCvVgLH0zvTMXmbg1i+GdrkgdG5L7RZDdtUVqld/iF6WTkQvJ12U7xOzmnXchqltzCPDygur/xSVqVVbGQmdXraLnL9JpKikriIYtYcU5h/18MCFLfbuD4K6WSrd0J3HKCopkQbJOYQGsEwtZ5bdMB887dezrh9GbAuS9Saaev/Rv4czp+kN3h+a5StUxHP3tJLr/6XITlkRfFm9jUzeICrn0E98bCYZUvACtNEkQj/CLrA3ZiEz6hU0XTvzILP6pNRmtBpDJ2OyCDOsX9liR5e5qx0I7ho+JB79N3jiseZ9HfoyvHVy1TOji36X68o06ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5CswhA92Vv80GZMTOdEUx7apL9G7IOC9R8i4daW8lo=;
 b=hSO5HCC7Y7c1PODpJm7VshiYSQTyySoxQfTTroyEn09ANGYVwP0lMRXZWU7R7HR3DPJeefymiDXxVNT4DuMgw5e6+PdiGYDbX2znl7/bil7PTucZq4xR4/R+mJkm7eu9u2sWu/qtc2V1CbcNBVpEtmMz+OW3QwedwjlazfM5oh0Wn7XaWNQnlthn0QHbE0Z9TTucq4rA2d1lVFzXb2Avbii8FGQRLy7o5FIOoykYq2qPm5cNeD9sCRWTRLX3cFLzS2g2H+wZuGWv0Vwo2pBBVVV4yY2+CtuW4ad2UkfhEhMZA/472TOtbYXAZm+9N+ZWW6awqH/Qqw/dwGhKnAaEJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=armchina.com; dmarc=pass action=none header.from=armchina.com;
 dkim=pass header.d=armchina.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armchina.partner.onmschina.cn; s=selector1-armchina-partner-onmschina-cn;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5CswhA92Vv80GZMTOdEUx7apL9G7IOC9R8i4daW8lo=;
 b=PjDzdWN5QigIe217On4PtHGIXmw0rxDeB+/sUqV6cklCr7/WrTdfY49kG5IiNqJ+k2vNzrhuH2r8Vi/Il4c7mzIGTbNUuoeCAnLZAhtskovx6zNdNF3hXqBrtz4L2zJazKSGocxH+DEjpoR0TS2UNx2VGoueyb8+wqus4uvPA4Y=
Received: from SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:8::10) by SH0PR01MB0748.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:22::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 07:46:01 +0000
Received: from SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn
 ([fe80::a8b:92ae:1d6e:9206]) by SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn
 ([fe80::a8b:92ae:1d6e:9206%6]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 07:46:01 +0000
From: Dejia Shang <Dejia.Shang@armchina.com>
To: "ogabbay@kernel.org" <ogabbay@kernel.org>, "airlied@redhat.com"
 <airlied@redhat.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: About upstreaming ArmChina NPU driver
Thread-Topic: About upstreaming ArmChina NPU driver
Thread-Index: AdqAssmmBRyQVXogTfqqG4OiiK8pHw==
Date: Thu, 28 Mar 2024 07:46:01 +0000
Message-ID: <SH0PR01MB063461EBC046437C88A6AE84983BA@SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=armchina.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SH0PR01MB0634:EE_|SH0PR01MB0748:EE_
x-ms-office365-filtering-correlation-id: b0ddcbf9-3ded-4982-038f-08dc4efb1d53
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +fcJ9c1XshVQbNCSc/bTreqpuv4lZy6iKweDlDVZfcd2kkxR3Wp0jXYJZivRcqYLHN+xK2nCBvjXKLmeLXdr1g2lGx02b5mH0jc/CqxoVnhqIj0kZytCAF3K9upB9LXeXi2l1E4W9zgFd2596FaNgiNefdj388nNKpd3nMcbZ62PzWc8K0RAjEptVL0nfEJJjqkmTXgljeWqB5Wn5Peo9QrsdDnMhr1WP+OzepyiGrITZgEc98dANo4VEq7v7/1cM92PqVcgRPzBoH2UI5ZigYzhJ4+b+CV+SEIWKRvFoCJ2FsqLNwKAPf4OdDjujXWIoMLhGV4TIpZl9eIqNmq39mv84lT/ygCUIWsyijMbk9UsQov2uD/Op+CRR/Cy3VEq4xd65yU0A6UPOXiO0PLvcl2Z8hPuaZmOLXx1a7KsFqxVVXF7ixqExpHpnTwFjAsuGCoskdBqtX1WZ1nh3mCbxO3g1sxDawEL+auEZ+1r5i9Ngo5CUYbIm/T07gCP+ddfJ2TOr+IMcBOE/8SJnndwLgnBPoblb4GNMGigroURNZY2F2NYJTdP7gCh197/TS8LDiso4No+SEJhJhKlwzWOH+tJJ2fYy9x4uxn0JFe187b53GXFQ/z8MiGG58DCOffp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE; SFS:(13230031)(366007)(1800799015)(41320700004)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2tRb3NIOU9QbGR0MUxjeVA2cmQ2RG1qVWNXd1dIdjBjcWlzdEJqbDBKQ0pE?=
 =?utf-8?B?RXNZa3AyaVF6Z2JMbTFiYi9mOWh4RmJEQVc0dmdnRkVOKzQ5VHA3WmxVQmov?=
 =?utf-8?B?Y24yNmNQL0tFRGtLSkYrQUZSZjVvcHJiTmxKMUp2b1dVcHl1MU9BSm5xUWJk?=
 =?utf-8?B?TnRLblhFWDd0OGFuWWJLendqM0U1OUdiaVZlcTg1ZjVHL3NHcjg0T09tcjlq?=
 =?utf-8?B?NTRoVFEzdnVWZWpuZWJhUmVBYXRucnM4c2VDKzQ0dDJqVzlRQ0ZjMXovRksv?=
 =?utf-8?B?SjNPTFY2RkRIZ1BObFB0MERCOU5DeDVlNXNLNkJaK0dQRXE0TnNBMnByZ2JC?=
 =?utf-8?B?UFc0VGlKNkY3NVFWbmdxMmFTcDltdGgzWUV2TlIyOHBzWWdLQzZsZ1RRa3pt?=
 =?utf-8?B?bHh0Vm5FUi9UYzNHeEsvazFrZDZiNWMvQXV2TXdzNjhJV1k1WG1lUk51M3gx?=
 =?utf-8?B?TTUwbnJOenh6c25MdUVJbldTQ0kwenJxV1psd3dmWkhoY3U5cUhCNFIraUdI?=
 =?utf-8?B?UHA0NUE0dFdHWjJkblZwWnNMRmRGTnU2aDY0akZNN3NPN0pRTmFqb3Yra1JX?=
 =?utf-8?B?dVp5SVBYSERQRkxWdWl6VkFsNTJWaWVQaVRCcVptUzQ3NHFWYWF2QnpMRUg2?=
 =?utf-8?B?RERHT0FNd094bXZ4N21QNkdPVjlQd09lYzVmNGpaaTdvVE1OVGlScHpxY2ZO?=
 =?utf-8?B?NlBTaEtIQUozYlRiZy8rNlMzT2pJUkxyVVYwK0k1YUE3RzdZWWkxejRiY2ta?=
 =?utf-8?B?R2VOUkIwM1dERXZVekIwZFcvaWh4dTNOaThwSHJPTnF3dU10MkNKcXZ4QXRY?=
 =?utf-8?B?YXh0OXRoWXYvem1TS2xiNnpaV0lLdU9CVEluV2xTQXpuRVhadjhhRXR6VlRi?=
 =?utf-8?B?N1d6dnNZNXA3ZjlHZVpXL2NBYVRaTWNKcUt0RnFLK3NIRzJ3MVJYV1RwNHVr?=
 =?utf-8?B?Ky9uS3BjRnk4K2lobDJqSGwvcE9lSXV2NjhiTE5VU0JlMWFxdVhIMHV5M0Rl?=
 =?utf-8?B?b2FvOEFMTUFlcmJEU3JzOEVlNm1iSm1vb0RPcEtaUC94cTRuWE1ETUFGRURq?=
 =?utf-8?B?R2srM0twR3MvVFpMMWc5eGMzdC9SQ0F1c0h4NUhkSDdtckEzbk1DQXkvL2tp?=
 =?utf-8?B?Q3UrVGs0akVtVHRHZ3NBYWpNcDRCQ3FzTkg4R1d2RnRhQ0QrN3BVNGZSRXVZ?=
 =?utf-8?B?ODBXanR0bkYyRUZibUJjUTg3QjZSeDU4Z0FFaFNoWmtSL2RhbElTclZtWGhH?=
 =?utf-8?B?c0RXdjEvNlF3bE04Mm82U2o2ZWpoRm1QeWo3VEk5NGNETE84MllaMDlDc0t3?=
 =?utf-8?B?MmNvSkxDejZDTnp5VmhTaU96S1ZSNWV1QnhnU2IxTHZUSm5TMDZES3FJMDlT?=
 =?utf-8?B?S3I1aUdGK0FqUWlNN3FIUE1yQi80M3NVMTAyOFI0K2hBT1g0aGhkZEc3L3p1?=
 =?utf-8?B?SytmMlR6ZFpOTXhmVXBSZmdiQ2Q4TXl3cnRMdGxwZGlNRHo4OVVodU9aTURk?=
 =?utf-8?B?S1NRSU9KVHk4WmE2UVJtbk1MYVc1L3lEQi84VWlvYnpXL3BrKzNEOVI3b0VE?=
 =?utf-8?B?ZnNjNVRWOUlsTnAybVNDS1VtakNWbUNhNzFaNCtHZWJKTVVXQmNSS1VERVli?=
 =?utf-8?B?U3M5RVROdmxOMDVUOVFMOTRMRGcyeERDWm5LQ3NkeU0zeGtvNGUvWEJTSHY0?=
 =?utf-8?B?eW5YRVhYQzltbGlGeTdmUE13TFZ0TDU0M0JmcWo5bS83R1B4ZzZFYVI3NlpM?=
 =?utf-8?B?VXdwc25lendnMEc2YTJVUnpQQW1QNXRRLzUxZ3M2RGI2VHlWeWlCNS9pT3RH?=
 =?utf-8?B?NTU2amV3RGcrc2RxZUZxbzE4aTVQc3pZbWpuM3FjOVpHS0thMm90QXBqc0Vy?=
 =?utf-8?B?TUdub29McTJEUWNSSlE2TGZyL1crZUFaNXVNTnRLVnF6SkV2WCtOaDNLeFBX?=
 =?utf-8?B?N213b3FCQ1B3V1BWWjQxUFR5TjFxYm0zWE1SZE9xWStxbEpmbkVCREJjb2J0?=
 =?utf-8?B?aXdFN2NSRUhEM3REREZucm1JU0tJZ3FjUC9XVkIzYmtySjZ2ZnRJa1VRVWpX?=
 =?utf-8?B?V0N3cFFGNGVzRnJyMFJLeVRSSy9GaDNBamQ1T0Mvd0QyNStRV3BqN1dMZWpB?=
 =?utf-8?Q?b6AjtKJNqyCozbJ5MIwWogBpw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: armchina.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ddcbf9-3ded-4982-038f-08dc4efb1d53
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 07:46:01.5082 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 58b271af-432f-4dad-9dee-571f404bc6a0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gd9l1o7IQ8bu2OxZ4ks6s6wI8JfCzBIFRlCgLL5Pj7/JGYsPfTCt7Rzk2ok83uy+D0sSKcLmd5y5FemEhoilCz/eVo4bhgUauSHH2HWgstA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0748
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

RGVhciBLZXJuZWwgTWFpbnRhaW5lcnMsDQoNCkkgYW0gYSBkcml2ZXIgZGV2ZWxvcGVyIGFuZCB3
b3VsZCBsaWtlIHRvIHVwc3RyZWFtIHRoZSBBcm1DaGluYSBaaG91eWkgTlBVIGRyaXZlciAoIlpo
b3V5aSIgaXMgdGhlIGJyYW5kKSB0byBhY2NlbCBzdWJzeXN0ZW0uDQoNClRoZSBkcml2ZXIgaXMg
YWxyZWFkeSBvcGVuIHNvdXJjZWQgKGJvdGggVU1EIGFuZCBLTUQpIGFuZCBhbnlvbmUgY2FuIGZp
bmQgdGhlIGNvZGUgZnJvbSBodHRwczovL2dpdGh1Yi5jb20vQXJtLUNoaW5hL0NvbXBhc3NfTlBV
X0RyaXZlci5naXQuDQoNClRoaXMgZHJpdmVyIGlzIHJlc3BvbnNpYmxlIGZvciBzY2hlZHVsaW5n
IEFJIGluZmVyZW5jZSB0YXNrcyB0byB0aGUgTlBVIGNvcmVzIChWMS9WMi9WMykuIFNwZWNpZmlj
YWxseSwgYSBzaW1wbGlmaWVkIGVuZC10by1lbmQgZmxvdyBpczoNCg0KICAgICAgICAxLiBBIFRG
TGl0ZS9PTk5YIG1vZGVsIGlzIHRyYW5zZm9ybWVkIHRvIGFuIGV4ZWN1dGFibGUgYmluYXJ5IGZp
bGUgaW4gRUxGIGZvcm1hdCBieSB0aGUgTk4gZ3JhcGggY29tcGlsZXIgKGRlc2lnbmVkIGJ5IEFy
bUNoaW5hKQ0KICAgICAgICAyLiBBbiBhcHBsaWNhdGlvbiBsb2FkcyB0aGUgZXhlY3V0YWJsZSBi
aW5hcnkgZmlsZSB0byBVTUQgYW5kIHByb3ZpZGVzIHRoZSBpbnB1dCBkYXRhLg0KICAgICAgICAz
LiBVTUQgcGFyc2VzIHRoZSBiaW5hcnkgYW5kIHNlbmRzIGlvY3RscyB0byBLTUQgKG9wZW4gZGV2
aWNlLCBkbyBtZW1vcnkgYWxsb2NhdGlvbi9tbWFwL2ZyZWUsIHN1Ym1pdCB0aGUgam9iIGRlc2Ny
aXB0b3IpLg0KICAgICAgICA0LiBLTUQgZGlzcGF0Y2hlcyB0aGUgam9iIHRvIE5QVSBoL3csIGhh
bmRsZXMgaW50ZXJydXB0cyBhbmQgdXBkYXRlcyB0aGUgZXhlY3V0aW9uIHN0YXR1cy4NCiAgICAg
ICAgNS4gVU1EIHBvbGxzIHRoZSBzdGF0dXMgb2YgdGhlIHByZS1zY2hlZHVsZWQgam9iLg0KICAg
ICAgICA2LiBUaGUgYXBwbGljYXRpb24gZ2V0cyB0aGUgb3V0cHV0IHJlc3VsdHMuDQoNClNvLi4u
Zm9yIHRoZSB1cHN0cmVhbWluZywNCg0KUTE6IGRvIHlvdSB0aGluayBvdXIgTlBVIGRyaXZlciBp
cyBzdWl0YWJsZSBmb3IgYWNjZWw/IElmIHRoZSBhbnN3ZXIgaXMgeWVzLCB3aGljaCB0cmVlICYg
YnJhbmNoIHNob3VsZCB0aGUgcGF0Y2hlcyBiZSBiYXNlZCBvbj8NCg0KUTI6IGluIHRocmVhZCBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL2VjNTQ3ZDMzLTIxNGYtNDk1Mi1hYTMzLWMyNzFl
OWVkYWQ2M0BrZXJuZWwub3JnLyBzaG93aW5nIGEgc2ltaWxhciBjYXNlLCBPZGVkIG1lbnRpb25l
ZCB0aGF0Og0KDQogICAgICAgICJJZiB3ZSB3b3VsZCBoYXZlIHVwc3RyZWFtZWQgYSBuZXcgZHJp
dmVyLCB0aGUgZXhwZWN0YXRpb24gd291bGQgaGF2ZSBiZWVuIHRoYXQgd2Ugd291bGQgdXNlIHNv
bWUgZHJtIG1lY2hhbmlzbXMuIiwgYW5kDQogICAgICAgICJ0aGUgbWluaW1hbCByZXF1aXJlbWVu
dCBpcyB0byB1c2UgR0VNL0JPcyBmb3IgbWVtb3J5IG1hbmFnZW1lbnQgb3BlcmF0aW9ucyIuDQoN
CkkgZ3Vlc3MgdGhvc2UgcmVxdWlyZW1lbnRzIGFyZSBhbHNvIGFwcGxpY2FibGUgZm9yIHRoZSBa
aG91eWkgTlBVIEtNRD8gQ3VycmVudGx5LCB0aGUgbWVtb3J5IG1hbmFnZW1lbnQgKE1NKSBpbiBL
TUQgaXMgYmFzZWQgb24gZG1hLW1hcHBpbmcgQVBJcywgd2hpY2ggaGFuZGxlcyBib3RoIHJlc2Vy
dmVkIENNQSByZWdpb24ocykgYW5kIFNNTVUgbWFwcGVkIGJ1ZmZlcnMsIGFuZCBzdXBwb3J0cyB0
aGUgZG1hLWJ1ZiBmcmFtZXdvcmsuIE1heWJlIEkgc2hvdWxkIHJlcGxhY2UgdGhlIGltcGxlbWVu
dGF0aW9ucyB3aXRoIERSTSBBUElzLg0KDQpRMzogaWYgeW91IGhhdmUgbG9va2VkIGF0IHRoZSBL
TUQgY29kZSwgZG8geW91IHRoaW5rIEkgc2hvdWxkIG1ha2UgYW55IG90aGVyIG1ham9yIGNoYW5n
ZSBiZWZvcmUgc3VibWl0dGluZyB0aGUgZmlyc3QgcGF0Y2ggc2VyaWVzPyBUaGFuayB5b3UhDQoN
ClRoYW5rcyBmb3IgeW91ciB0aW1lIGFuZCBsb29rIGZvcndhcmQgdG8geW91ciByZXBseX4g8J+Y
ig0KDQpCZXN0IFJlZ2FyZHMsDQpEZWppYQ0KSU1QT1JUQU5UIE5PVElDRTogVGhlIGNvbnRlbnRz
IG9mIHRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBtYXkgYmUgcHJpdmlsZWdlZCBhbmQg
Y29uZmlkZW50aWFsLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVh
c2UgZGVsZXRlIHRoZSBlbWFpbCBpbW1lZGlhdGVseS4gSXQgaXMgc3RyaWN0bHkgcHJvaGliaXRl
ZCB0byBkaXNjbG9zZSB0aGUgY29udGVudHMgdG8gYW55IG90aGVyIHBlcnNvbiwgdXNlIGl0IGZv
ciBhbnkgcHVycG9zZSwgb3Igc3RvcmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24gaW4gYW55IG1l
ZGl1bS4gVGhhbmsgeW91LiDCqUFybSBUZWNobm9sb2d5IChDaGluYSkgQ28uLCBMdGQgY29weXJp
Z2h0IGFuZCByZXNlcnZlIGFsbCByaWdodHMuIOmHjeimgeaPkOekuu+8muacrOmCruS7tu+8iOWM
heaLrOS7u+S9lemZhOS7tu+8ieWPr+iDveWQq+acieS4k+S+m+aYjuehrueahOS4quS6uuaIlueb
rueahOS9v+eUqOeahOacuuWvhuS/oeaBr++8jOW5tuWPl+azleW+i+S/neaKpOOAguWmguaenOaC
qOW5tumdnuivpeaUtuS7tuS6uu+8jOivt+eri+WNs+WIoOmZpOatpOmCruS7tuOAguS4peemgemA
mui/h+S7u+S9lea4oOmBk++8jOS7peS7u+S9leebrueahO+8jOWQkeS7u+S9leS6uuaKq+mcsuOA
geWCqOWtmOaIluWkjeWItumCruS7tuS/oeaBr+aIluiAheaNruatpOmHh+WPluS7u+S9leihjOWK
qOOAguaEn+iwouaCqOeahOmFjeWQiOOAgiDCqeWuieiwi+enkeaKgO+8iOS4reWbve+8ieaciemZ
kOWFrOWPuCDniYjmnYPmiYDmnInlubbkv53nlZnkuIDliIfmnYPliKnjgIINCg==
