Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D569AB44B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 18:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B742910E6C3;
	Tue, 22 Oct 2024 16:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zZXjmITK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF0B10E208;
 Tue, 22 Oct 2024 16:46:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y4L9pr57o81qm3Rz1aiKlubpPtI4qxVf7uob3bvcyvIVQpaBtR1AQ1+uiiSrU3dWcUHWo/CTo6gkA83HS5qsrhTz7j7KqBHL4kiw0nFP+IuICago352Mf4wIy2t5Tm30QPv99CDPtvJntV6SnMx/vsII3TJNyxS4eWOhjF0MXK+v6riagWqxsdhGhQnl3RKwjopdznop8tZTwgGzmfZeMkBpOKAO+EnJXnR27h+Rj8WU6ctwmIvHxpR/YlI+LKKWxGtoiaqOWncpB4tuBt1660HhqkIQoDUKPN+iclou+b0n08+v2oWHMw1GOYJnCbbcmeMcpcOXh0vGdtkHwCMn7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDSOdf/BPKkUQ88smuF3KRMKt1LqUuikekX7sLuXxBE=;
 b=ZCKpG20tJ69pKroR/NTiirWuomJvcohJTJnbG70zHGyyCfVSIsAI8giY/rEn/+ayPjdjjm3Y7d6ISlUBUl7P6d1qLubfZksJre3FNFuFjIljMZuA7jBsx08ZDim24uardaff6HvOPBV073ldBXFp2icKEeV9pGGDc+f5IvhSptSxjDHQfskn5Jc9Y//v9eXNkP3MmIovnRtsRhaOqt2MqGSrn9KEBDTUibyVNI524yuwBJFRsLgKdJW3rjjv7Am7AG+GNQ2El3mSU5snBy/hYyymVjDnhZ0OHAAiP/lj5fvHb9Ji9q1CQpcy74GtwTo5/DSQq8SGpBsR22YKI3B0Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDSOdf/BPKkUQ88smuF3KRMKt1LqUuikekX7sLuXxBE=;
 b=zZXjmITKR15YldU3j2zGIcaa7Cu58NhOk4ZbOxGcPpZRSzn0EvoE4RLrppj8BEKPtgTt7x0M2RWYwQcSj9DyAh6WkXdTRfe35VqGwBbgBKAeFBgl3wJSzPZ72Xw1isbN5h1zKqmSTZlh/htrXH8R+ijWsBkrb3BLp2C1YiOizXY=
Received: from SA1PR12MB8599.namprd12.prod.outlook.com (2603:10b6:806:254::7)
 by PH7PR12MB5878.namprd12.prod.outlook.com (2603:10b6:510:1d6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 16:46:34 +0000
Received: from SA1PR12MB8599.namprd12.prod.outlook.com
 ([fe80::25da:4b98:9743:616b]) by SA1PR12MB8599.namprd12.prod.outlook.com
 ([fe80::25da:4b98:9743:616b%3]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 16:46:34 +0000
From: "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "tvrtko.ursulin@igalia.com" <tvrtko.ursulin@igalia.com>
Subject: RE: [PATCH v5 4/4] drm/amdgpu: track bo memory stats at runtime
Thread-Topic: [PATCH v5 4/4] drm/amdgpu: track bo memory stats at runtime
Thread-Index: AQHbIWJhHP+NzSvtr0Wud0WRwWwvcrKSaWAAgABzHCCAAB6NAIAAATtg
Date: Tue, 22 Oct 2024 16:46:34 +0000
Message-ID: <SA1PR12MB859939F759D6B661D49FC924ED4C2@SA1PR12MB8599.namprd12.prod.outlook.com>
References: <20241018133308.889-1-Yunxiang.Li@amd.com>
 <20241018133308.889-5-Yunxiang.Li@amd.com>
 <1057097f-02f4-4f0f-9ac5-37aa84570b47@amd.com>
 <SA1PR12MB8599E3DD01B4A45AD7CA71FAED4C2@SA1PR12MB8599.namprd12.prod.outlook.com>
 <53382fc0-0686-46af-9285-0cd6aec314ae@amd.com>
In-Reply-To: <53382fc0-0686-46af-9285-0cd6aec314ae@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=00aa766e-115f-4755-900f-f2f00fc4a3c4;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2024-10-22T16:45:15Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8599:EE_|PH7PR12MB5878:EE_
x-ms-office365-filtering-correlation-id: ac861c94-b489-4a34-0cc5-08dcf2b916ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YmtNRmlzNjQwbFRmV280WEN6YWw3dDlrVGI4SzFXT0VyZGN1eEx1RFRiVUFN?=
 =?utf-8?B?M3VrWStlWE5wbUNWNjdFV0U2TlJ1eHdzTzJvNDAvNFFMcGRrVmlORnVEM09B?=
 =?utf-8?B?Y1ExT1V0LzVtaUU5N0VCUjZSM2I1TVhKSzhYSkI2SVB6SG52VVFhUThaK2RS?=
 =?utf-8?B?TTdweWpiVHlibU4zbEhWUVlDbERqY2lxQkttYkJxZUQ2bTNkY2gyTStOajdm?=
 =?utf-8?B?QW92eUl0RlNkRnVEMk4rWmN1K1d0eHdkamhPYUFyVVpWMmhhSjZRQlYzR3p1?=
 =?utf-8?B?Rzh6dGpxWEpuamk0Rmg1TWs3Mm9lTW03ak9hbnltRmlZTjJ1K0c4TDRCUlg2?=
 =?utf-8?B?a2x2NUpWR1dmMUV0V3JLVDBqeEw5Zy8vSHkzaTBsNjNiQkpEZlpFUzdqWHA0?=
 =?utf-8?B?VTE1OE5kY1dQVWFKL2pwRWpnZU90OTdTK09DbFVRdFVlTUpKV3l2c2lNUzN5?=
 =?utf-8?B?dXdDdyt5RkxDVGM0c2tCdzZUMjdUOENDUHRvc3RrZm1oWE51S2oxaDJkL2Jx?=
 =?utf-8?B?c2dIS2hlODVCRFV1M21EWVZtdUJVNHl3eXdsOWZXcTRlb2N4d0EzTWRjbHJv?=
 =?utf-8?B?R25nQXFzN3cvUTJ6dDNLY2hxQURJVTg3d2ZYU2dHTm0zaWcvVEZMSTY2dUI5?=
 =?utf-8?B?eURtNGFXNHpBTU1aL2w1ZzJFL0RNUVhUZ3FrdzdYeThNQWRyK2p0UXFubmdk?=
 =?utf-8?B?TG9Ebk8wZTUxNXBQOXV3QjRrVGk5cGliR2hNUis3S3JuVzlpdUM2S09ZaG55?=
 =?utf-8?B?RXh4WFV6Z0J6QkNSOXQ4MXcxNlphNHYrM2o3SEs2U1lhMlpsVXBrWGJNWnNV?=
 =?utf-8?B?ekZzY1ZYN2pBaHNrNElma2pjcWVMaUY4eiswUWNKYTN5RlZnSzNxWjkwK3Bq?=
 =?utf-8?B?MUYyaSthNHlxbjgvOXdVWlVXTEJYcTI4UWo5THVyeGhReDl3QlZEblZCVFg5?=
 =?utf-8?B?ZXNqUytJbktQZm04S0gwRTBaQmZwMEw5b05QMWh1aDlwdDVRUWx4SkVQRzJv?=
 =?utf-8?B?emhnOWllWC9OMlhXYWJTNk9aOUgyMkY0UXZWeHluU0M1aTd1QjRraUh6a0Vq?=
 =?utf-8?B?dzFSeHp0cnZQMU02MHB0UGZjQVFEQ0JYNjFuemFYdjVlZ1NlTkhaZlRRQTRw?=
 =?utf-8?B?cWJnWDZ0U3hyUDFDWTJYS2NsSHlKUWtpMmpsV2p4NnN6bHYxQTRLYVdRVUMr?=
 =?utf-8?B?clM2RWRWYUk4djhkUlVQOVZBM0VzUzB1TitaZG5DZGwzUmpqREk5U3VQVHV0?=
 =?utf-8?B?UCtTbFV4ZVYwQXREVTNyNVF2M1RxOHEyRHlJT0lidis5VXhNZTM0YkRPMkRt?=
 =?utf-8?B?eWhISVpXNmo1YXR0SWJKRGpDb2J1MUZ0YTRJTU50dHlJVGVDS2FadVAxVG5w?=
 =?utf-8?B?dnVUSkhmdXErZ3o5dWZaSEtYM3R1NDFFU2ZGMEg2dU5oNU16WXRuZ3JRVTlQ?=
 =?utf-8?B?SmZtaWVMMzBMb3A0emNaWURDcm9DVGxPWUFzTUlVUFNkVWFRaHBiZ1o4ZVFV?=
 =?utf-8?B?Q2pXOUlZTUc4RmxKNTZIRWhZUmgyYUQ2WCtmS3RwMUdQQ0NxNTdGcWFBU2tx?=
 =?utf-8?B?bWVMd1ozRXBEaE1hdFRxM2ZVUERKWjRqWXZJOXFBd2FxZm16UVBLMnVMZ3F5?=
 =?utf-8?B?YjkyN2t5aStqMW1SamJ5UWhua3E2VUpMU3VCQ3RSNmRMWUtIcUQyKzRsYytv?=
 =?utf-8?B?RXVGczQvTFhRUCtGZjdibnh5OUoyR0JiQTUzMWhJUU0vcU5MMEdkYTAydmta?=
 =?utf-8?B?TnAza3hNbVdOTWFMVUxEUnBYdVhkRmNYZE1YSHdRWS9xUWhMbmE2NU1jR0Zn?=
 =?utf-8?Q?pFG2Zf4Rvg5rF/NMXAJfFuX14fmqMG09VXNhc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8599.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2NUQU5iWTEvQTN4L3lLT2pmRWZHOVhuTnR0dlM1QXpSUzR0OHpJV0dGNjlT?=
 =?utf-8?B?YUtoVkFHSlhkNGV6ZitUZFNMUWRCSDlmdmdoSWpmRWNncElRalUvOTQvNFJx?=
 =?utf-8?B?NXV6UWMwK2cyWDZkM3c5RkdYNENocWFLeW1CcmtHWG5KQitET2hVZ2lqWkZC?=
 =?utf-8?B?ZkZEbFBxMXBLTUFaZnFUV0JHYm5sVVBqRjhPdjVVRXp2RXdrQUZWYk5Jc2VB?=
 =?utf-8?B?TldVNGF4K3FYTnBxMnkxZExXMjJWS0Q4UGk2MmlnSHNQUW9KMFhERDViUzVX?=
 =?utf-8?B?dnZSazRrbFhCRmlXS2t5czMzc0tTSStub1BTa0tDMFBpVERRT2pDOUVuUFI5?=
 =?utf-8?B?eDFJYUJxdG44WFdkYlFRWkVCVHhGS2lxQjFSMDNINVdwYUdZcnV5VVdWMG80?=
 =?utf-8?B?NzZpMnpRNnRCbFJ4T3B1NjFpQ20rdHB4YXdXcDZhYWNQeFBMSElkTEQ3aHZ0?=
 =?utf-8?B?M1hKTDA5dTl4Nld4eHVNRGtBYnVXNkk5K2Z6QmtGd0lUZnRxYjdJb0VuNmlZ?=
 =?utf-8?B?blpEYldiY2szUXA0aFowYmh3dFhSMVVIK21oZlliZnJLY3RzcnJGYmw2SUxp?=
 =?utf-8?B?S0VpZVN4OWhDZ0pCWENVZmtVeGhhQU5OY0xORjdWeHhzYndMRFdOMVFVQlRn?=
 =?utf-8?B?TktWeWpWdDNIeVZHRGxDckp6RFVDbjduRjFOWlBvNmlod2tXK2Q2ck5Eb3dj?=
 =?utf-8?B?VTdvSDBiYXlGVHZ5YndicnA5VWh1eENNbWJzRE1iaXNxOEJ5blkyQW9FeUNE?=
 =?utf-8?B?cEF1QWRsc0h3T2R6VThMdHBSVWgyMXFnc2lEcGk2emJxb21mTWZVa3NKZnlj?=
 =?utf-8?B?RkRCdVVpeC9Bell6aGhxbXZSb0JUN2VJb2MvU0dyNlAxSG1PUERmTDl4aUZW?=
 =?utf-8?B?bVBjeGg3dXFPd0dMTHlpdFdEN1c4OFN2a1ViODd5aVZMQWYrSlBIM0ttcHdY?=
 =?utf-8?B?ODdXSEJmRVE2RkVUN0VzaXp2S2kxZkQzSUx1dzlvdDZWdU5EQjBxQk1La21T?=
 =?utf-8?B?VlpBWnJHZmEvbThWMjJSNEtjOHB1TzVVSDJCMHNYTTJCS01GSFpjNCs3cXBY?=
 =?utf-8?B?RytsTTg5enM2MEpYeDYwempyeFJIREowUXN0dmVTYThpUlI2QThZNW4xSFpz?=
 =?utf-8?B?OElWUGtTMkNkbkJja3NaaW5OdEtySUdYM2EzTmhCU0MyOC9tSTRGUDlFdmU0?=
 =?utf-8?B?UFhYU1hvUjVtMjVOQXRNeTVzczgwOGFSWFNyb0QxWnd5ekc1V1IvUVE4azdv?=
 =?utf-8?B?Yk9nNlVuajJtUFNoUmRtc05lWUVmTXZTZDF3aEcyeWtkVXdXUlVwNExRSnB3?=
 =?utf-8?B?azhBQjRJclV0N3hEVFR0c2VydldCNHZ2YWN4L2hvMFhPcWFJY1U1eDlkWmw3?=
 =?utf-8?B?V1NTQlc1VE05NG9vbjdvSzdZN1J1TmZTMG9mR0NGeDhXYUZBUzhJelJ6cktB?=
 =?utf-8?B?Z1d5RXBSTE1WYXQyTTJBc1U0SWorV3g3RWJqd0RyK0JWeFh1Rkl3UXpaUUsw?=
 =?utf-8?B?blNFaVBBRksyOFZkMnAyNXJUSkFRcmxzS0w4TWhlajl3ZEpYelZKZG5OTVMz?=
 =?utf-8?B?bG5IQTNvc05zM2MwYzlhbjc4Q0tMdHo4UEI3UEdGbTRodGJXNFk0aUJydDBK?=
 =?utf-8?B?aVpHQ1VrVmpOUVBkdEdaVUFROUdhcUR1Rm9BNVpDVUJPN050NnhpSFhlclRY?=
 =?utf-8?B?RlJWMEZHdzRYSmU3RXY4QzRaK0VwbzlaeCt1Yyt0THJHUE82VWRkTTc4OHZn?=
 =?utf-8?B?YlJwb3I0em1CaVRSWVRYbS9veXVRd3ZqcU5HRFJBU3hCZGo2Y25oOFR5UkFn?=
 =?utf-8?B?Skg1VXMvRHlmbUZrTGY5OENrK3BYV2tEZ0ZoRVUxUld4RnlpTElXR0pGUTA4?=
 =?utf-8?B?OXd0dG1iZTJCemRQL1ZZaDFVMjBjbGxXVm9qY2V4MU5jcW1taDhyOVQ0YW9r?=
 =?utf-8?B?N1hZYlNZN0RJNHFNWDF4NERTczBxQU1TYVc4Q0VxZmZzdVFqQ1RidlB6c0M3?=
 =?utf-8?B?SDB3UXcvTExqUWNNTDVZWnJHemNqY0FjbU9Ud21BeG5QYktaVXFhWkMya0FH?=
 =?utf-8?B?Sko0aEV1T0RoRTMyWUZJUFdnaGdRTUJNaXhCQW5TRnRlZm1QcDVnTW44eUE2?=
 =?utf-8?Q?sH84=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8599.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac861c94-b489-4a34-0cc5-08dcf2b916ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 16:46:34.7089 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6VcjNXaOpBzjCsY47Rrt31A7DagM/o545oWkG42hy7sokU24xYdElTNEMzgNf8v+nAG0R9pwgtifaZCZxpgQxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5878
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

W1B1YmxpY10NCg0KSSBzdXBwb3NlIHdlIGNvdWxkIGFkZCBhIGZpZWxkIGxpa2UgYW1kLW1lbW9y
eS1wcml2YXRlOiB0byBjb3ZlciB0aGUgcHJpdmF0ZSBwbGFjZW1lbnRzLiBXaGVuIHdvdWxkIGEg
Qk8gbm90IGhhdmUgYSBwbGFjZW1lbnQsIGlzIGl0IHdoZW4gaXQgaXMgYmVpbmcgbW92ZWQ/IFNp
bmNlIHdlIGFyZSB0cmFja2luZyB0aGUgc3RhdGUgY2hhbmdlcywgSSB3b25kZXIgaWYgc3VjaCBz
aXR1YXRpb25zIGNhbiBiZSBhdm9pZGVkIG5vdyBzbyB3aGVuZXZlciB3ZSBjYWxsIHRoZXNlIHN0
YXQgdXBkYXRlIGZ1bmN0aW9ucyB0aGUgQk8gd291bGQgYWx3YXlzIGhhdmUgYSBwbGFjZW1lbnQu
DQoNClRlZGR5DQo=
