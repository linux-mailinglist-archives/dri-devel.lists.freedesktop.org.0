Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C451505EAC
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 21:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934F110E180;
	Mon, 18 Apr 2022 19:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2073.outbound.protection.outlook.com [40.107.212.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3176210E180
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 19:45:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOByz95n4zKmz9/VaWIeGkl9IhGskmYYZQ9qehiKwXrQC+EVJPn7kmt8Uj90leYtgBOKnx4ImF6pHDuVZ6KpAFPQ6ZiqSAdKcDIPJ9R1lMMs30SERugHSL8fY3Lkljmy8/6qq1AlyDgJ6OcWxfXK2vgT6RtKDiQ/A79oczrpISty2BVTydrdkhbz1WiavcavjY0JZjl94I7/KpxDRbPC4UxhTWAsSrqBu7rIARtdCWojmWUpFI6oxJa5Pf0wssb1K/fHzO+yJxsmtEASIrET8b7+CCcBYf721NZaWEMz2YyT1LDW+y3jhRaPexVh8OmO1wK/wQIJTIQyklWM0A+9WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KEcIJILx127yB1qw67rfaEzQ/zBxxihICxC5URhPbQ=;
 b=Qm8v0H+gfiuy2T4l0qPwyEmtwRJ/5jH3/2YyTYHjzbAec8tPYUKtctSAv9w8ya+EEsFp+94b5PvovGcjqkOv52Qrm8cZFtEwH8E5USevGqi+JlBo3toH2VbKXOwRKlJMsUdA3pOZF5WvDyWw1/wDzRl7HJvLORmb8BsbjxTDuAQcXTlpvmJ7EX/Cblf7CavQ9QWWUGiNhnVqU0SDia3GaqGcVmPLXL35Yw3DalgtUEMSzz4iMQpUmqR/zWbWx0Jh5xsI0s6nMpuhnRots5hb9zssp/c4S0skODCGEVMNcQ5VTMVaNjVneJRi7xMuP7c1s6SrviXRzMQeQG8Vn7PNCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KEcIJILx127yB1qw67rfaEzQ/zBxxihICxC5URhPbQ=;
 b=H04sjQVTME8npmvvsQEnlvlwwtajhYIlkmdBpgPFNM7AkvAqu+jQo+R70JjN0BeeSgURScT++oFefa5M+VzP7sUKod2Hx98sw0SiH/ReLW6JwYZ5Vz9mjP9ffU7vMfvyW+VEDZrbxAsLj9jq17x2LdHZC6PCngOCG4FyHUHG3hw=
Received: from BN8PR05MB6611.namprd05.prod.outlook.com (2603:10b6:408:57::15)
 by BN6PR05MB3443.namprd05.prod.outlook.com (2603:10b6:405:45::36)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Mon, 18 Apr
 2022 19:45:36 +0000
Received: from BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::2cee:3759:958:cf21]) by BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::2cee:3759:958:cf21%7]) with mapi id 15.20.5186.012; Mon, 18 Apr 2022
 19:45:36 +0000
From: Zack Rusin <zackr@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "bob.beckett@collabora.com" <bob.beckett@collabora.com>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 04/11] drm/ttm: move default BO destructor into VMWGFX
Thread-Topic: [PATCH 04/11] drm/ttm: move default BO destructor into VMWGFX
Thread-Index: AQHYQ1yThVt1ZPYoVk2Dj9fvUZGm+Kz2MwSA
Date: Mon, 18 Apr 2022 19:45:36 +0000
Message-ID: <0bf65f196187d5e0c87ae000908b1f19654096fe.camel@vmware.com>
References: <20220329110243.6335-1-christian.koenig@amd.com>
 <20220329110243.6335-5-christian.koenig@amd.com>
In-Reply-To: <20220329110243.6335-5-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4-1ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c8eb671-0dc5-415e-060e-08da2174024b
x-ms-traffictypediagnostic: BN6PR05MB3443:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <BN6PR05MB34439332838BCA51CEA1C0EBCEF39@BN6PR05MB3443.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i3QoxGSQNw0ubDuZBbkm5YDG34Uc+QSV/bMz9mrOyhKBu1lRUd74WdVK2n72pfpSiY+MFMhGb2Uqt/KRrp3WBigiUSCXkSx+os6Cj0C1eiURBpvhI9RH+a+sUpN1Ix7AAjLN7P+0Do6Hr7N2OsygrkSotnVnp0ZC0cgZqwTWjmEqYDfinFH1O1Z35Irl1n+6s+RfIk5gLZ7zI/ovCPFJQ+4FRHXkP7qA7+Ep2ZdAV+2dmogWh+N/+whOEVUjySDU9OM0hP2z9iqcVQJf8tDxdCFygDG+l4lYpWwc2MbZSxjt4DwYw1WXtDUc9wGzMlhy361IFnBMP2sfTw6DxCXbONhvxfnIA+sO7L4KWDGkbsmnPECdOpVzEgWPTe+QncxuhbF3dFiY1FbhlJa9DzxVpSo+iENyDKlT4HxyU14bn/Imt/XJBTw4scz4Z4lu6ZRRGZUMrcn4bI56PMNEdUxoiMazaJTN66eNX3PydlfRDvzUvUji/SFl60F372oS2uq8eCc9kmkJnCde/W5A2psBD8i+7o5ilR7a8mM4KQJn1te/RPobApAx7CwIHdvaXZ0R/wDvveF9WBaaEdY/CHiClxube9qAGDT+VdKcA6sYm0lukfy2J6Kn2HJwdZ3XTbTYzIcEHPqmtIHYTyMFafNJ/MueCb/klBnzsqLpv6olvx4w8Wt62RU1rwKlZYEqcYVcWXI/SqeGQTj1KqeafLP2x/bW/iY3xbyRJMYHLZf3vFqIwrE8FlvEC24cc6jOdE8S
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR05MB6611.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(26005)(2616005)(508600001)(36756003)(8936002)(6486002)(4326008)(122000001)(71200400001)(83380400001)(5660300002)(86362001)(6506007)(66574015)(6512007)(38100700002)(8676002)(91956017)(110136005)(76116006)(2906002)(66446008)(64756008)(66946007)(66556008)(316002)(38070700005)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUtMRDJjTTlLUllqSGVwMGtaNnRHNXk0dTAvKzI5R29GMTE0QW5YNjY4cHNP?=
 =?utf-8?B?cHl1Z3FUVEhUNmdoVE9WckRTSWQrRFI0YlllQ1N6dng4UjB4SVpLcHNFQlJn?=
 =?utf-8?B?elJnMWF0NTdnaTNxelB2MWN1VzNsMnVlY1FxQVZnSnArdXpsOEtNN241cUNt?=
 =?utf-8?B?ZWw5dC9INGVlZCs2ZHJicWtWM2FTcytHTDFVaUFIRGo2aEJ5YnlXdEg1dXFq?=
 =?utf-8?B?L0NLUm1qcm0wbHVpMnJncWROS1hISG1nQ25zY0prUm1EcEZnTThHUHdTVlJz?=
 =?utf-8?B?T0NiZGVYWFJvKzd1dGFqQXJrc2UzUTMyQ2dWOEdsRHkwQVFEZ3hjQU84b1pK?=
 =?utf-8?B?WkVkTTNkUnpWTzkzVVF4VHJTWG5qOWtZbXQ3UEtES1VVekJxeTNlbjF6SG5U?=
 =?utf-8?B?eW4wUk04SGEzSENrQ3owQmR1VHlObktlNXdQREVRbkF0Z1Rhd2ExRExpWWwv?=
 =?utf-8?B?V3FwVndSaDFGS3RWT3ppZjJtOHd3YlE2dE1ZcERUVkJpTkg4c3BLV1VtT2Rm?=
 =?utf-8?B?RlJudnhOd1lZWXRNcmRBT3hxKzI5WllLWnN1a0VObUZ3cmE4TkNZOHh5Ylhw?=
 =?utf-8?B?Zy94cWdYWXM1a210SHJTV1d5UytBN3ZSMUplakFVVGk0aTVwUlh2bllVQUdw?=
 =?utf-8?B?VklraTlVVHFZQkJJR0JScTVqLzRGUlBQUWYxdWlDN3JkN2tsd2J0WGJzZzgr?=
 =?utf-8?B?cUozTDZwdVNyRURpRWQxaWR5UHBtRk52aVZERkdDdG1XYkFNYWJldDZnWWpJ?=
 =?utf-8?B?clFLcXJwcVZDQ2NMMEVnUlBiRnBZNHhjMlIrdXU3eTZpb29rdWxnOU43QVJT?=
 =?utf-8?B?YUZNcjdRMkUzbE1la1F0S1pzU0V4cG9ha2U3Zm1EL24wNG5ZaC9LcG1JT0NK?=
 =?utf-8?B?bWZURWFwZkptWVp4dkZWYmdsUjE5RUlPK2Q0OEZzUWI2Q1J5enRtcllhczhS?=
 =?utf-8?B?bk54THp3ZW1ZYmpmdTRRTm9sbHRkYk0xakZFT0xkRXl5ZEkrc3RKWjJiUE8w?=
 =?utf-8?B?c1BEYVpMUW5kMG85bWg5dFFyNnpsLzM3cVRRWnh3ekloNFZuN00zeUZVajA1?=
 =?utf-8?B?UXJVVVZOTlZDRC9QLzJXUjJ5MFlwdklMaExIbDZCSXc1UVpobW0ydTBMWXp5?=
 =?utf-8?B?QTJkaGt1L1U4TVZRY3Zwd01QZDllcmZPWjRBTEtLc3ZLemtyOGhmZTM4M2ZB?=
 =?utf-8?B?Y1lsNkZiYU9ZdTBsZnNUSWw3VnBrMFBhZjdiN1N4czFRcW55RjIydWVKY1Rk?=
 =?utf-8?B?UGljd0hNbzJHSHczYWdlZ2Vlb1VNNW91eXVYOEpuYURramY4dU56QzE4WDho?=
 =?utf-8?B?aFkwSUVOZDdsZW0zRFV0RjBhRVpKTVNOZmt0V1MzY1B3dWZYeDcxdmJrajU5?=
 =?utf-8?B?VEtrR1BEMlJyT2xwZDZNNnRuUGtGSnBKazA4Ykt4ajZ1Y1U2cm1lbzB1SWVQ?=
 =?utf-8?B?aWJmODllRlpXenl4bHQ5Q0thcEJzUHNrWERVVEtuUHI1YkZEbnZ3MmNrbUNw?=
 =?utf-8?B?bEt5M2dNWlFCVjhYZVFpNTlmNk9rZUphVEg3eU4vNHJMd09CMTI2OXNINmNl?=
 =?utf-8?B?Q1E0bU5ZV2UwVlFYckVVNitBdzF6anRjbSszWHI0b2R3VStJdS9HOVo5bXBK?=
 =?utf-8?B?aGxTNkpVdWthN3luYXFGTk1rWFlEcHNKWHNNNWlaKzZRRml2QVA5MmZNUmdm?=
 =?utf-8?B?M3c2cFZNTkt4bjR3OXNTT2NYQ2FLSUFtTTBpaDVhSWlxejJiSW5oMUEyUlN5?=
 =?utf-8?B?blhIL0lEN1BXMURoS09YZkYzVldsc2EyR1EyYjdRSGcvT0VyYUMzZjdyUTkv?=
 =?utf-8?B?RUs3eEQ1dW41VzJ5dkxEcjVjOUZtdjR4bmt5enMxQkV6QzFjdTZFbWxsUEZC?=
 =?utf-8?B?N1I4MWFXUmQwVE5LbkZFK0ZYUmJONGExeHNBanNMUnBLZnVoSzVvWk1URjRp?=
 =?utf-8?B?K0Vzdzg2dVAzUlVsVVEzMHA4dlljSXo0S0NhcjgwOGl6TTByUkJwN1F2WGVw?=
 =?utf-8?B?MXZUTW5tVFlEMmxkcXJXNEVvUmhDMlVQV0JNMkZYL2NQYk1ybFYwWllYbk8z?=
 =?utf-8?B?WCs5SW9DbzF5b01DK01GazZySENaN2RtR3Nkelo2TWxDdmNtSGxVWUlJY2J2?=
 =?utf-8?B?ZVdSRG5OZS9hOEhtalhYYVlXLzRjV3pzZmo5M0M1dlhpUXZDM2UzV1BET3ll?=
 =?utf-8?B?eU1GNDV5dDBzYS9NQ1lBVmx4VFBRallyRDZ3WDlNWVMyUnVuOVY4T0NDbS9q?=
 =?utf-8?B?REZ2RUNyTUc1QXhHbXV1eGZTL2F3L0FHSkVxZDFibWkyK2I3a3M0eDlBR3pl?=
 =?utf-8?B?a2FMMTcrNE96WTRneVpCSkRoNTdkRVpUbTZ4THhUeWRNMnY5L0hzZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <36A2F63B5882E247BA80F0F8412CDBB0@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR05MB6611.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c8eb671-0dc5-415e-060e-08da2174024b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2022 19:45:36.4271 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CDl/MqXbE7OM30HqC0pTFaCdln9hRV0Ke0BUQEHUkWNovgeYfx1nQBwdORHzd3bVRHoxEgd9JwShofyl6BVKEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR05MB3443
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
Cc: "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIyLTAzLTI5IGF0IDEzOjAyICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Ogo+IOKaoCBFeHRlcm5hbCBFbWFpbAo+IAo+IEl0J3MgdGhlIG9ubHkgZHJpdmVyIHVzaW5nIHRo
aXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgoKTG9va3MgZ29vZC4gQSBzbWFsbCBzdWdnZXN0aW9uIHVuZGVybmVhdGguCgpS
ZXZpZXdlZC1ieTogWmFjayBSdXNpbiA8emFja3JAdm13YXJlLmNvbT4KCj4gLS0tCj4gwqBkcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jwqDCoMKgwqDCoMKgIHzCoCA5ICstLS0tLS0tLQo+IMKg
ZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfYm8uYyB8IDExICsrKysrKysrKystCj4gwqAy
IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiBiL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvLmMKPiBpbmRleCBlNWZkMGYyYzAyOTkuLjc1OThkNTk0MjNiZiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm8uYwo+IEBAIC00NCwxMiArNDQsNiBAQAo+IAo+IMKgI2luY2x1ZGUgInR0
bV9tb2R1bGUuaCIKPiAKPiAtLyogZGVmYXVsdCBkZXN0cnVjdG9yICovCj4gLXN0YXRpYyB2b2lk
IHR0bV9ib19kZWZhdWx0X2Rlc3Ryb3koc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKPiAt
ewo+IC3CoMKgwqDCoMKgwqAga2ZyZWUoYm8pOwo+IC19Cj4gLQo+IMKgc3RhdGljIHZvaWQgdHRt
X2JvX21lbV9zcGFjZV9kZWJ1ZyhzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgdHRtX3BsYWNlbWVudAo+ICpwbGFjZW1lbnQpCj4gwqB7
Cj4gQEAgLTkzOCw4ICs5MzIsNyBAQCBpbnQgdHRtX2JvX2luaXRfcmVzZXJ2ZWQoc3RydWN0IHR0
bV9kZXZpY2UgKmJkZXYsCj4gwqDCoMKgwqDCoMKgwqAgYm9vbCBsb2NrZWQ7Cj4gwqDCoMKgwqDC
oMKgwqAgaW50IHJldDsKPiAKPiAtwqDCoMKgwqDCoMKgIGJvLT5kZXN0cm95ID0gZGVzdHJveSA/
IGRlc3Ryb3kgOiB0dG1fYm9fZGVmYXVsdF9kZXN0cm95Owo+IC0KPiArwqDCoMKgwqDCoMKgIGJv
LT5kZXN0cm95ID0gZGVzdHJveTsKPiDCoMKgwqDCoMKgwqDCoCBrcmVmX2luaXQoJmJvLT5rcmVm
KTsKPiDCoMKgwqDCoMKgwqDCoCBJTklUX0xJU1RfSEVBRCgmYm8tPmRkZXN0cm95KTsKPiDCoMKg
wqDCoMKgwqDCoCBiby0+YmRldiA9IGJkZXY7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS92bXdnZngvdm13Z2Z4X2JvLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Jv
LmMKPiBpbmRleCAzMWFlY2M0NjYyNGIuLjYwZGNjNmE3NTI0OCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9iby5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Zt
d2dmeC92bXdnZnhfYm8uYwo+IEBAIC0zNzgsNiArMzc4LDEyIEBAIHZvaWQgdm13X2JvX2JvX2Zy
ZWUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0Cj4gKmJvKQo+IMKgwqDCoMKgwqDCoMKgIGtmcmVl
KHZtd19ibyk7Cj4gwqB9Cj4gCj4gKy8qIGRlZmF1bHQgZGVzdHJ1Y3RvciAqLwo+ICtzdGF0aWMg
dm9pZCB2bXdfYm9fZGVmYXVsdF9kZXN0cm95KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8p
Cj4gK3sKPiArwqDCoMKgwqDCoMKgIGtmcmVlKGJvKTsKPiArfQo+ICsKPiDCoC8qKgo+IMKgICog
dm13X2JvX2NyZWF0ZV9rZXJuZWwgLSBDcmVhdGUgYSBwaW5uZWQgQk8gZm9yIGludGVybmFsIGtl
cm5lbAo+IHVzZS4KPiDCoCAqCj4gQEAgLTQxMCw3ICs0MTYsNyBAQCBpbnQgdm13X2JvX2NyZWF0
ZV9rZXJuZWwoc3RydWN0IHZtd19wcml2YXRlCj4gKmRldl9wcml2LCB1bnNpZ25lZCBsb25nIHNp
emUsCj4gCj4gwqDCoMKgwqDCoMKgwqAgcmV0ID0gdHRtX2JvX2luaXRfcmVzZXJ2ZWQoJmRldl9w
cml2LT5iZGV2LCBibywgc2l6ZSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0dG1fYm9fdHlwZV9rZXJuZWwsIHBs
YWNlbWVudCwgMCwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZjdHgsIE5VTEwsIE5VTEwsIE5VTEwpOwo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgJmN0eCwgTlVMTCwgTlVMTCwKPiB2bXdfYm9fZGVmYXVsdF9kZXN0cm95KTsKPiDCoMKg
wqDCoMKgwqDCoCBpZiAodW5saWtlbHkocmV0KSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZ290byBlcnJvcl9mcmVlOwo+IAo+IEBAIC00MzksNiArNDQ1LDkgQEAgaW50IHZtd19i
b19jcmVhdGUoc3RydWN0IHZtd19wcml2YXRlICp2bXcsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOwo+IMKgwqDCoMKgwqDCoMKgIH0KPiAKPiArwqDCoMKg
wqDCoMKgIGlmICghYm9fZnJlZSkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib19m
cmVlID0gdm13X2JvX2RlZmF1bHRfZGVzdHJveTsKPiArCgpJZiB5b3UgY291bGQgY2hhbmdlIHRo
aXMgdG8ganVzdCAgQlVHX09OKCFib19mcmVlKSB0aGF0J2QgYmUgZ3JlYXQuCmJvX2ZyZWUgPT0g
TlVMTCBzaG91bGQgbmV2ZXIgaGFwcGVuIGhlcmUuCgp6Cg==
