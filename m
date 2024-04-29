Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ABF8B5FAE
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 19:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31CF810F526;
	Mon, 29 Apr 2024 17:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mr5lrYWl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2084.outbound.protection.outlook.com [40.107.96.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D239410F403;
 Mon, 29 Apr 2024 17:08:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6hnbLePjPBoyeJXRNi1PYTSWx1mYvNGziWp4lOeAgKmWWqFjLY6C7YgiBoSxRfe9cAqV2tsKMp4IEhBtsoK3Xd37DZYgjQfPycs2+kjfaB1pUqfI6koIUB8sVKj6YryYWiRIBBQ1gKM9YJnUnI3AGTETD668ctIaWtHXlmYQjBbNnHGcZCWqPMaJAvJbttMxWublrCpVoyG/+FEhqkQhhvc8isyxkqXBvr0CCntunkEismcM+LleK6HWHJgkPXeCIfsUxUCkiUxMSKwZUMm3GhXAVGNVA210/uU2je2vLanUydi6rgCm0YhkWCJpe/KOO+BbKnMoBQc3F3X+4OTIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksSLFydu5lho1SClsTj8xpQYetx8qi+u2xC0ssySpUo=;
 b=SquS2cd/ySpC5NDxwpHgRSzybSmh6q7pzfS6Io6H4Uv8o010VWkxv85hwQPnYAfGrPgLqjorIvfR6Xaj1fRUOsZUj6lmeCU5bAUj2zD5rGWj4gOZCsm5hVpIHePQxs/bpYLCv9OQFkttWHGkCEk2v1HViEb5WdqpbRUxGz9pMC3mkwV38GcTNWPY4XnHZ5Lr10T5vxo+l0DdCOt+RDglIMrc/ZBLQoc+W9cjtejhhm4moSKvxrpoiIcdMN0LMBxFkAez99eyqu/T9wa26/DpfdL4I5EnY0WEI6R4ty8es+udFL1KYNKLBUZ6Di+cu4jmdU8cV7965OlzrYdQ1Ydgdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksSLFydu5lho1SClsTj8xpQYetx8qi+u2xC0ssySpUo=;
 b=mr5lrYWl7w8/3G5nJ9x6gvrIyLQzFMe7XGhApqJtwuFALVhhf+sYtYEg92YoXvTNP/pS6xllovHhycrGSJ97O2HLBuZqawyCE53DhRqetuC6/5hFGUlM+wv2Cdiz5upHC6Cj/4Vz+y4Thntzfjx5TeXKseRmE8+V1Zl5k+Qm8tOK8KZaPmfDWiX3rjEUf7XsnvbeEhpZIZGLgZGuSqBgrqIThfItb3lzPZvPUYuu1SrmFVVfV22NxEREFt/Wsjp9Aym6u2TKBc+DepnDb4B74mQnpsRLHIel+xBemafxPE0iaZkKjjj8PtNs1EvUBuWAlVOccnkz49npxOHE1OKjpA==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by BL1PR12MB5706.namprd12.prod.outlook.com (2603:10b6:208:385::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Mon, 29 Apr
 2024 17:08:42 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::ac4b:38c3:29cd:519]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::ac4b:38c3:29cd:519%3]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 17:08:42 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "naresh.kamboju@linaro.org" <naresh.kamboju@linaro.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "lkft-triage@lists.linaro.org"
 <lkft-triage@lists.linaro.org>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "anders.roxell@linaro.org" <anders.roxell@linaro.org>,
 "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>, "dakr@redhat.com"
 <dakr@redhat.com>, "arnd@arndb.de" <arnd@arndb.de>
Subject: Re: nouveau: r535.c:1266:3: error: label at end of compound statement
 default: with gcc-8
Thread-Topic: nouveau: r535.c:1266:3: error: label at end of compound
 statement default: with gcc-8
Thread-Index: AQHamkbneJFRjzVNo06wSErHUzR05rF/X6sAgAAbi4A=
Date: Mon, 29 Apr 2024 17:08:42 +0000
Message-ID: <8de32257786d3f062c479a8b10dcf17b775d563b.camel@nvidia.com>
References: <CA+G9fYu7Ug0K8h9QJT0WbtWh_LL9Juc+VC0WMU_Z_vSSPDNymg@mail.gmail.com>
 <c819df1c-4215-41bb-b24b-563a912d160f@leemhuis.info>
In-Reply-To: <c819df1c-4215-41bb-b24b-563a912d160f@leemhuis.info>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|BL1PR12MB5706:EE_
x-ms-office365-filtering-correlation-id: f35af8a1-af86-4aa8-ecfe-08dc686f0574
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|7416005|376005|1800799015|366007|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?QnZtUmRHMWNIUDd1OFZneHo0WnpnbDBqbVVOc2d1djJsTjBlRjcxTGNyYzd1?=
 =?utf-8?B?dVdsWWJ0SHZPejdHcmgrL1BRVndsQjhCNENVdlgzS1JNM2J6Y09BUlN2UFBw?=
 =?utf-8?B?NTBEZkNYZWVRNHI5ZnZwWVpDNk5KZjYvVG5DelNxeUVSS0dSWnBva0piL0lr?=
 =?utf-8?B?ZEhuZUw0NWYvdXoreGZIUE1OVGQ4ZHVnRXhjSUR2ZVhTRnlRekk2em4wdG5z?=
 =?utf-8?B?TlR1UGM4OTlNZkJNVXVhSFlwbFhCT1BmajdUeVpGcU1xK3hKTzBYOHRPbDlK?=
 =?utf-8?B?UGRKdU9CY1RlVit1N0Fyc2pvSHNWdmJUelFNKzREY1oyOEdOeDRrcjNRVEMw?=
 =?utf-8?B?R01jUTdZZVlXd2RKQk1oVXNyM21vUUhpa2dBaUJpVzk3dmVPNHhhSjRqV1VT?=
 =?utf-8?B?ZjBLSW52YUd1VlFBMHJMajFtUUFzMFZSNDc5c1RnbVpZUUFmaGhPVm55eGZX?=
 =?utf-8?B?ZWo5blgwakxCMHBpODlHVjkxcGhyOWFCZVNRc25Tak15WFJmVk01SEZJZmRk?=
 =?utf-8?B?VnNvb1JNazBFTW9KeUUwdEpmNC9sK1NOL0FadGhxNjdCMWZDWGZvYTYvcnJZ?=
 =?utf-8?B?WVhudXVndFF1R1Jha2llbXkrZ3daRWQxNjRidlkrOENYQXRDK2NuMys0dm0z?=
 =?utf-8?B?ZWV2QU5WRERoUU5MWDcwN2FxdkhIWVI3ek42NEtTaE5QanlFZFZ0NUhaNkF0?=
 =?utf-8?B?LzYvZW1RNUl6Q09NSS91NlpFUEV2NnpMaXEzQW8zSmFsbUtXczFXT3dVTDVW?=
 =?utf-8?B?c0kySDJuaEJLUjFtNURZYVlSZ05BWjdTWDRURjVrNmg4ZzFHTmRFKzg1SW4z?=
 =?utf-8?B?Z1ZZS0QvWUN0bUJlWGVXbUdDRmNYenpaRnVQa2tMTTJtbEZtU1pWckxDWk5q?=
 =?utf-8?B?QkhOTGVPVUFpQ3NxS0hSeDB1U0VOYXNtdnV6UDBmYStUMzg1ckdyazR2d2tS?=
 =?utf-8?B?ck1NbVhrc0JYK1RldFpia3hYeWNtZy8rRWxtVzF5Ukgxb2ZsY0g1SU8wR055?=
 =?utf-8?B?c1dYaUJJdDdRODJUTHcwNFRRY2k3NFlzZyt6bDlTUE9yaVdOQWROSUlPbzV1?=
 =?utf-8?B?MHpvbzQrSHBCWVFZamd1NnhtZ3VIZml0bnpmSEhkdVova2phM0tLZW5zbFBT?=
 =?utf-8?B?RTMwSm93UFR3SGNPd0lBRzBzdUVzNU55MmNqNktxUmVLbkZCVFFYTlJHOGsx?=
 =?utf-8?B?SjNwVEswb1BjN09PUGIrQUM3ek52eTFJbzRJNFRwN2JhRFc4YjZYaUNSVW5Q?=
 =?utf-8?B?aFhTVWFYMnM2MnI4U3RSS0dCYU0vSHVmR1g4RTFreHhra21MWkxpcEthQnBI?=
 =?utf-8?B?SENSeGRieU96dHE3cXNtblNpME9rVlYwVmJCU2wxczVROXQ5b09Wc3pYS0Ji?=
 =?utf-8?B?UWYvVFhVakZPYWI2VUNURFc0UENUdWhSSUQ0Mkd3Q2tTdmZlTWp1ckEwdjdv?=
 =?utf-8?B?aUZLNW5JdVY0MEJQMGYrTmVjamJVVHkwWUhHVlI4ZEdGWGJOd2pBNzhMSmxX?=
 =?utf-8?B?Y1RmNUVqN21UWGhEUnF1R3ovMzlKYzZhc0VQSjNucm5GVTVQSURBc2NGN01B?=
 =?utf-8?B?dk1qK0xqK1d6UkUrdnp6Qnd1SzNZTnI2b0I1V3RJK2lFT2hlankzR1h2YzUz?=
 =?utf-8?B?V01lTkVzYnVLdWZ0Z0hOQ3J6dXpBSGVUTjdhQ1NkQ3dhNjZpM3F5TEc2Tms3?=
 =?utf-8?B?akJaY3EyNW56TU5rK2hDeUlMakxRUGZpNzA0V2J2aWNLSis5NlRETzBuM215?=
 =?utf-8?B?ODFsMkFIK2pYM09EVStiVWt3L0dVWmd2VDhQR2Y1VUN5dEpBRjJtcTh3NTU1?=
 =?utf-8?B?dFExQzhnaTFOZW9nSlE3Zz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(1800799015)(366007)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGNJMllKOWRzSEJEWmZUYmxQVFhGNjBOc2Rib1BuT1hmSGJuL2ZOWmoraUhx?=
 =?utf-8?B?ZG9GSTl4VlZJRzVUTUxHYmh1RVhRSmducEZQQWpCbHNoQnVlejBGZmRLU2hQ?=
 =?utf-8?B?YkdKaFhOc1lrdk1hZngxRC8rRm9CMGI4YWtOMUlYY2pCSC9welVYQVdqZXZt?=
 =?utf-8?B?USsvQStmUEdicXJVbDZTZzdXMzVLTTIzYllHYks0d0pkUi9uTTZaN3VrTVZu?=
 =?utf-8?B?am5qbkFIWThzMDF2dzhSQnVsTjRtRTBYSU1XbCtyYUZUUzhRcGVHYnpqRnNJ?=
 =?utf-8?B?RGdpRzJZaDZ3WHhkUmdPeVRyU0sxdldoTDBrYnkzYTd1SytqdWNXLzRsQm1V?=
 =?utf-8?B?ZCtBbkVOci9tK2MwZ1NMejc3VzBKbGNBckV4NmNSTkZrNFdaNkR4R3ZGNjg0?=
 =?utf-8?B?dEVBTC9aSTdUREJ5cmtxVzI2MXViMnpaL1h3Z2FCOHFpamZEMzBqVEJWMEMy?=
 =?utf-8?B?SVFlakNCcVpvQnlyaHY1NzZKWkw1MVo1d2pETWIyT2ZENHdPdUhRTjFFVno0?=
 =?utf-8?B?RmFtYWwxZHU3aWZZMzZJcW9EYno3U1oycGxkb2dlaDFYZFRrSXRCNE83SWJH?=
 =?utf-8?B?RHhWUk5PbGxBbFc1clZBM01WUDBxZVJGc1oxRVlrbStsNldPL1pPcHl6WDQ3?=
 =?utf-8?B?YVFyQ1NET1NkaURtWjc2cE1reW5QbWlzNzFYY2dmb0ZrVlNGc1lkWS9PZDgw?=
 =?utf-8?B?K0VZOFhFaU1RMUp1bXhRU3h1MlFqT1YxaDRNRlVXN205NFo1VHROMHppdFQw?=
 =?utf-8?B?V2R2TDh6YURhdnVLaW1RMGRUQTZVQUJPSngyQjl1OS9jdDFXWkJUcFhBSVVB?=
 =?utf-8?B?c012MTYvYkVUL3ltTkRqZEk4aFVhNUNjZ0o0dllvOVVXOHpFZTZRcW90T1ZD?=
 =?utf-8?B?NTV1ekJGYlB1d0xGZm9Ma3JuMU1wVzVHRWhDZWxtMnZQd0RzVUJqZzJaaHNZ?=
 =?utf-8?B?WVYydTdOMzVoTll1VVZQeTFUNnByWTJJNkFMUzRIZjFUTXhNUzRaZUpiMWJs?=
 =?utf-8?B?c1NjS25Sb2U3RzhHWXNpVkw4MEdlcmlDQVVzWnZFdEQ0OVF1Zjk4dUViUWd0?=
 =?utf-8?B?a211bEtwOVNqY0ZuRDVNYVluZXdkNjV1NVBnWG9wWGhDcFNZemZKbEUwc3Yy?=
 =?utf-8?B?MFYrZW1VdlVwQlhqbDNQOXp5Rlk3L3k1Rkt6eXBCaFI0QjVzUC90dXo3TUZn?=
 =?utf-8?B?TGNvZVowU1RJTURPZ29sMC9jYVJBQmhIU0t0TXdsU0luUS9sVDVJVnJyaE5h?=
 =?utf-8?B?WitMSEFRZEptcVFhTXhtb2hMeEd0UFQ1Y0ZZRlIvZHI1R1d2aWFKaDYvdlUx?=
 =?utf-8?B?WFhOV1IxL0N6ZGRhWmM1b202SXVFNFdCdERJTldXaFcraytiajB4akJPQzhH?=
 =?utf-8?B?ZzYwY1NnNVo5SzA4WjFDYk0vN2J0SXRFTVBOVWxlL2dPOExGOG1vM0oyMzND?=
 =?utf-8?B?M05KSHNnQ01VZnZEVEsxdjVySFp5ZGdZTzdMSEppRDBTUnV1QmhTb25hZU5p?=
 =?utf-8?B?dFdxb2J3TkMxeG9yZ0ZqMmhVT2JaR3NkYnZsQ2QwQUtlR3hoQjdGTXQ0T2lt?=
 =?utf-8?B?MDExcXovMlhyMktEMVR5YTZOT3VwK2VPc0wvZzUvNU1yZVg5TzRXT1JVbDY5?=
 =?utf-8?B?YWRiQ0RxK3pLTko2V0pnOUxYckliRXowSGFNNllzL29jMjVrRUIvV0JyM1JW?=
 =?utf-8?B?UEU3azZybzhybXphUzl6K2JaU2FnM3FDTU5sMG1zRHhKUVZoODU0R3NDNnFu?=
 =?utf-8?B?cmsyV1FsL3liN3h0T0h0QzFPWHNDOERBREZpbER3dnc1dWZ6bnZaTUMvMjVX?=
 =?utf-8?B?Ym5uWDlKK0owaDhZNmhZclNQRG1acHJsWVpENkMyZjBqNzY1dnhNUFJWeHJa?=
 =?utf-8?B?UjV2V2IvNkkvQ1I1bGhpbFBJcDNnQWNqbjFmTy9RUTc0VXYzRENrMEpIeVZD?=
 =?utf-8?B?TjZjNTEzTHVZUjlMNkdwNjNFQldFamk5K09TZHFsdlZ5QlkzNWRtVVE5eVFz?=
 =?utf-8?B?Ulp5MEdQMVpGY2ZJRUphSXdUTC95NUp1UjQ1VzRSbVh1cG84dndpZVpsb0dT?=
 =?utf-8?B?QXk4aWtKQXRBVFlpTEM2SWpkeXdRZFJNZUNNQWZOZit2VzV0am5vNDVzQUJE?=
 =?utf-8?Q?iwE0O7JJKxMyGMcg4R+MV8DOW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <39B285D341219949A9AF9A2E6D21344B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f35af8a1-af86-4aa8-ecfe-08dc686f0574
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2024 17:08:42.1461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6dtNVRp1T7XzpudpkxacMDaSc3EdUWcBWLCzxvFTGWgVltExd2hngEVrsHWROxr1BcEovvSZVIKhP/E8Mzjc3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5706
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

T24gTW9uLCAyMDI0LTA0LTI5IGF0IDE3OjMwICswMjAwLCBMaW51eCByZWdyZXNzaW9uIHRyYWNr
aW5nIChUaG9yc3Rlbg0KTGVlbWh1aXMpIHdyb3RlOg0KPiBUV0lNQywgdGhlcmUgaXMgYW5vdGhl
ciByZXBvcnQgYWJvdXQgdGhpcyBpbiB0aGlzIHRocmVhZCAoc2FkbHkgc29tZSBvZg0KPiBpdHMg
cG9zdCBkaWQgbm90IG1ha2UgaXQgdG8gbG9yZSk6DQo+IA0KPiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMTYyZWYzYzAtMWQ3Yi00MjIwLWEyMWYtYjAwMDg2NTdmOGE1QHJlZGhhdC5jb20v
DQo+IA0KPiBDaWFvLCBUaG9yc3Rlbg0KDQpUaGlzIGRvZXNuJ3QgZmFpbCBvbiB4ODYtNjQgd2hl
biBJIGJ1aWxkIGl0LiAgSSBhbHNvIGRpZCBhIGNyb3NzLWNvbXBpbGUgdG8NCmFybTY0IHdpdGgg
dGhlIGFybTY0IGRlZmNvbmZpZywgYW5kIGl0IGRvZXNuJ3QgZmFpbCB0aGVyZSBlaXRoZXIuDQoN
CkknbSBndWVzc2luZyB0aGlzIGlzIGEgY29tcGlsZXIgdmVyc2lvbiB0aGluZy4gIEknbSB1c2lu
ZyBnY2MgMTEuNC4gIElzIHRoYXQNCmp1c3QgdG9vIG9sZD8NCg0K
