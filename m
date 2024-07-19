Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF00D9371AE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 02:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA5510EB4D;
	Fri, 19 Jul 2024 00:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="jImtsY3r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2133.outbound.protection.outlook.com [40.107.215.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9619710EB4D
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 00:57:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KoH6Us+ohd2GBESbsosfISNGTlF6umg8EUIs/xRe2gAkPt5deaYL1XIx/NpxQAKPsooV5Am9J4BLTxWgS0qgwFunIrmemxW7/SkmNnoc6KI8afMVfFDIQK8eE9/ij4mSvp/FpBs4U1GRSNHQBvE1YMhTWn/znPmTkUBwnX9nIlE89zW2Wvo+owIWpeRzEUsULofNKq4w0E3dyI0qACBzALMXdNRdvN6zhXHi+3AL9MZ83vUajQXASvhSEVATXNd1jS0lEP3TfcmSR+d/iBPhEKUmRdREJQe/o+g1dtbj1VauADdRjXx5F9mD14im4DmYFvno+nlLl3Wz6jDJT1Y8Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcqqOVNxLZ1PkHmsLRBxxXfsHDlOgW7RnRRENmDEevo=;
 b=su7VwUXTxWOkEy2GwNxHMKsSsj2Pa+QzVzS4+nAuFqZvdUtDIUxKa1fZLx5hFr+oRYWU6RcJ1CK6w4ONyMa+8Zx7B/rgMLGR/DGJIh4C0LqayWlX4enV07NL2W3euH1CEiziQT5rDxf9vlUhOgxSrjM87uz7DeNIalRatajsCUbMIidkqkrJ2WVR1L0Lsqx3QBuNZXh0YRY9hNd3KbgTD1JzpDf2kkKKaEyiQ51he1NUeJdxL25Y+koavHPmPngHp+LhvgMuo/nXAkREY3VMS3oWDqYW5oWuO2ZlyqAXVRJVbz0bMHMDOgXwwj0hmr0JEEoz138MYiRXEvmnOlFGkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcqqOVNxLZ1PkHmsLRBxxXfsHDlOgW7RnRRENmDEevo=;
 b=jImtsY3rxswV1JtY1xPR2Noe5G0RxD8Dv1IUmlJEXY3+1F/yjFSyWpisopaofcBATLC+lgAH1z90zAOAx7a9gMxoCqMb7cVUeaKZourcnTVCJC1qqhFfddmvQVz8tiRhrhFodglgR72CtE6eBaih8I1qYzxoIYstgyQgLsiF1hyTHPsP816f8+02UKKclLmgi8zNYHXxrltg/r8lkh5TR+FI33xoDpzVs2IsxTX+A9SMBo+ZCbg62lvYYWvvoFoJw5NrPiABEL0SklojIwx4fwp/C/gar5ECCR10WCG2n7TBOwB1agOdaTN4Qtca5J7XLOWLWv/1arrrkFm08E3ueA==
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com (2603:1096:400:45f::6)
 by TYZPR06MB7171.apcprd06.prod.outlook.com (2603:1096:405:ae::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Fri, 19 Jul
 2024 00:57:10 +0000
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b]) by TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b%3]) with mapi id 15.20.7784.016; Fri, 19 Jul 2024
 00:57:09 +0000
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "jfalempe@redhat.com"
 <jfalempe@redhat.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "airlied@redhat.com" <airlied@redhat.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Cary Garrett
 <cogarre@gmail.com>
Subject: RE: [PATCH] drm/ast: Fix black screen after resume
Thread-Topic: [PATCH] drm/ast: Fix black screen after resume
Thread-Index: AQHa2N7GhgyLs0QhOUus8ISQGciotLH8H6cAgAEboHA=
Date: Fri, 19 Jul 2024 00:57:09 +0000
Message-ID: <TYZPR06MB656848544CA7E0C457D15A18F1AD2@TYZPR06MB6568.apcprd06.prod.outlook.com>
References: <20240718030352.654155-1-jammy_huang@aspeedtech.com>
 <4bcb752a-1ef8-453f-a04e-05017920a9d8@suse.de>
 <17d35c0e-1389-42d0-b94c-82a0575102f2@suse.de>
In-Reply-To: <17d35c0e-1389-42d0-b94c-82a0575102f2@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6568:EE_|TYZPR06MB7171:EE_
x-ms-office365-filtering-correlation-id: 5e4435b6-f1ec-491f-daf0-08dca78db807
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RDdSTW5VeXBRZHVEcjlETGs2aHZzM0J4RVF4am1xekdyR01aVDlqL2krN3Fj?=
 =?utf-8?B?WHdEQ1hIcVAxemxQZWZOemJMM2V1Q0xSR3BDVzRUcjlJKzMwSUdvcHE0dVZM?=
 =?utf-8?B?Q1ZIUm5Ga08rUldzM3VsSTNoaWx0SS9GdXQ2Vmx4MXJkTnppM1AzTlo4cmQ1?=
 =?utf-8?B?Q3Ribm9MeEpnSG0vNTlWc2JyUVRrZ05iYzgvTys4ZmpPdXhhV0RaVUkzT2RJ?=
 =?utf-8?B?ajZ1dmtMSFlEL252U2lOUjNETmZNMWNmYXpieHpGbmFhTWJza0xXcFVaLzUr?=
 =?utf-8?B?SVhiaEV0M1UvK3N3cTVhNllaYThHeEpGei9ja0lZOXZ6QVNpNTRyall4cW5G?=
 =?utf-8?B?SEhra015bmdFbVV3cC9HdWZMclFSd0c5aVpKTVA1bmNNQlBoRndETjl2bm9H?=
 =?utf-8?B?Q2pGZ2pkTHYyaWNFY3NNYmlQaEpvYThmVnhkOXB3U1JraW9kUGYzTXlWVkc3?=
 =?utf-8?B?dFUzRy9vZENQMVpxS0h4MXU1Slp3c2J3QlpFWG43SjJIaWRnZkkvK0pLZG50?=
 =?utf-8?B?UTd6S0hXbDNVR3dTUHlCbTZiM0JreFVyLzQ4OFdlN2NCb3lQRlJBKy9hbTZL?=
 =?utf-8?B?NStWeGZMT0xrekExYjZ5dlhvRk5CWnBTdFI1eGtHNzdPbzRJdThobUc5Y1J0?=
 =?utf-8?B?WHN1WkdQby9WK083MFdZdGJOV0tkSGtURTBtTU9YMjZ2TVgwaG9jWm1mMXhH?=
 =?utf-8?B?NVFTanl6YkpKYVBoNlU2Nzh5M0NGcmc4MWtqLzVXTXAzRHZVZ2ZaNlRVRkFC?=
 =?utf-8?B?cklCaDV3U0xJZ0l1S1U2OXBUZ1lxOUpoZVdUL3c4QjNvcHlES2xIbFVPcFhk?=
 =?utf-8?B?WkNGcXAwQUs0RmsyWTJFcUhNbUppTFQ5QnR4bCt3T3krY1BSblY0ek4rQWg3?=
 =?utf-8?B?VE1TdWhUR2dzSmhSMjVjRWxheU9kMDdibTU0UkFIbTVmVWpQVVVLOHJMSUtF?=
 =?utf-8?B?WkRHamNLOFBqa21DWmwwWloyMFhXYzJ0a3lkcmttVmNoQmh0RU5rMURERnQz?=
 =?utf-8?B?ZHpzcWFxOW5Hc3BBS1dqRVovOTdOUlpoQ0ttc09XSXpuNjE1OS9BYTlXaSsr?=
 =?utf-8?B?L1l0TW04NDVORi8vcE5mWjFiZmJpRWNyU0tEQkZGVTJyemg2ZVVnalNrbTRN?=
 =?utf-8?B?NDVaUFZnYU5RakJQOUJaTENFa015S3AyMEJKWjJma3RxSjlNa3poM1E2azNL?=
 =?utf-8?B?L2QxUGR2V08wYUJLcXl2WTlGL2prdWxheURVK2dpS3hVTW9objRsS2Vzd0Ur?=
 =?utf-8?B?c2xhakVZT24vck44ZjhSWjdaaGRhVnhkYk9QbHdGUVJCV2dCQ09iUktPMFFm?=
 =?utf-8?B?TjFHSmZXQ01IQWtHSEN5Q2dzTlJBNENvVXdFUUtIeFpmN1NYR1VWSW1Dc2tk?=
 =?utf-8?B?QkE1S1lOK2wvRXVXMzc5ZWdYMG94VWMxT0FVblJJQlJRWEF4RmI0cDNOcUJV?=
 =?utf-8?B?TmtkdjBPOE9aMWI0aFh5MEM4ZmFEWkhEdGowWngrUkVibnRZalh3VUNuSVdw?=
 =?utf-8?B?YVh3bTRoOWZEQTE1eUN1ZGptendSRytFWXRXMkg5ejgzZWNGdG9vcmJGQlhB?=
 =?utf-8?B?bWxTVWRiWEdDWGc1Yjk2ZHc3K3dmalJZdmVYYnQzcGo1V29Ya0VDblVMTVQv?=
 =?utf-8?B?cmxSY1QvTnFBRUZ2alNYL1RUcTdJTjk1NytNSW5EZ3FwcU5GcXFNOVU5RVk2?=
 =?utf-8?B?ZG9oQXFsbFRmN2FXakVycmF6alIwRDJsM2x4eDRhZ3FpYmhGT09EdHd2OGFC?=
 =?utf-8?B?NnFrQXFwVTRLZlJxR1NwK296cHkvNWVKNXl1VjZZZWg5RzAwTFBobkZHdHpi?=
 =?utf-8?B?MlRmemFHZEdPS0pYdmcxTVhOakZvM1V2bUcxU3Jha1l5VG1TL2lrTk92UTZH?=
 =?utf-8?B?WU8ybWkrZTV1Si9iQWhWYWt3QW55OEtib2N5UGZBNk9teVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-tw; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:TYZPR06MB6568.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGdyUjdOcFg5THo3dlJJdE9vSkFTRlpBQ3VCTWMvM21KZy8rYnB5dDVRNldM?=
 =?utf-8?B?MHFXeG9CVGt1MGp4elllZnBJMW9VNi8wYVdYcEZ6T1IzUEU0QmdjUnJFSUIy?=
 =?utf-8?B?dVZmbnhXRjBzdVdIbkhmSzRVM1V0Qk1KS3ZsZi9qMlpiRUNMUkRPb21LbE9V?=
 =?utf-8?B?VmhITk8rcW1kNURvYmtsUHVwdlVaa3FUNTUxcDI3R1VhbFpNTGhGMlFGLzV6?=
 =?utf-8?B?Qmd3cEJTc0U1ZFk3dUt5NFZlVkJMYnRmY0M5QVp3VkNpWFFPdHlPTnNpeXp6?=
 =?utf-8?B?VU1Ib1JhMFRDYzVxREdpOHVsRFM1dmRMc3ByYnowZUo3d1JkbW94VzZCZFFz?=
 =?utf-8?B?T0V6ZFhGR0ZlT1A4K1B1QVVPbXFmbCtkbm9keDJSdkM0dUg3dXZJSFBNeHZq?=
 =?utf-8?B?ODlLL3lObDVVTkpaYWVzbEM4REFVcnVDMmpHcEl6Q2dvMnpyZWo3SjRoYk0r?=
 =?utf-8?B?UXBQazUvZjdoaGcxb3NaL0JBMnB3RkZkbERPSlMyREdQNW9EUDJQazdyVTg2?=
 =?utf-8?B?eWJYZElPalA1NldoVTNTWFlLeWZqS05EeU1XQk1WeDZVWjBsdXBjRDlQOUIz?=
 =?utf-8?B?dUlPN3VWSWpqK2k1amx0UWVkalUxQk9jb000VkNTUm1RZHU3Ykk1Y2FnYllj?=
 =?utf-8?B?cmUyYm11UHdFZ0xkTlQyUHRxU1N4bU1nSXFVOS9jNmRYeTEvR21oV1MxcC9v?=
 =?utf-8?B?MEVGVHBWbDE2UVBZR3dabTF2aDdRSldBeXhCVDkrQjBpRmZBaHNBZUlQektt?=
 =?utf-8?B?ZGlCcERmYStwb1QydVNObEllanFsZlIzUEpQckdMMEdoOEJwWVNxV0xkQnFK?=
 =?utf-8?B?cFp4WkNBeVlrMFNTZjZ0aERydWJmSys0a1MvUWlReW01NTFRVWlnQzkrOWl6?=
 =?utf-8?B?MTNMRXdWZGN4cjdmRlhBU3AzSE9JOFVKU0FkbmdvSHBweVpSbUcxUTd2Z01M?=
 =?utf-8?B?NVI3b3FDVytJdmxYaUU5bE84OE5EYVIzN2NwOU5PNDF6QmIxRTFpTkw4dDZv?=
 =?utf-8?B?eXZndjQzZUJTOG5mOHQ4dTNZbGRzVmVod1ZDNkxUZ1p6K21xUWk5UnFmUUpZ?=
 =?utf-8?B?a0VnZjJiVS85d0F5WENEMll4bU44R3U3SmUxUWNmUzdOdE1DNUlGQnZVMXI3?=
 =?utf-8?B?ZnFGb1JqMVZMQXZsQWtKeVQ3cXRZTUljSUNlcU5yMHNRaFZiWloyOFJFeDR3?=
 =?utf-8?B?VFQxT3ZvN1RrSXRrWWZ5OE5ZZjZJbldOZlN0MGR3R3Y0QlFQUHZYL3dUL1BB?=
 =?utf-8?B?L1BFZ1B3TDloUkVvOFpJalJzUzFIRGNHSCs5aVFObGFiVWVrOFp2S2NrRm9z?=
 =?utf-8?B?WGgrTnlwVWJoeXE4d2RwemhLY2NvSmVQQVpGZzRWeTdGUGxwVlN4L3ovaDlr?=
 =?utf-8?B?SXpkTUJlbHBVWWl3RGl2MTlJaWE5NDZiNFRNcFhqRFZJVmFUazZsMFhlWnF4?=
 =?utf-8?B?YnJiVUhQSjV2ZnBITHF3Z3hUNG5Ga3FXVkNrNFJvdjM3NXlBWkE0QW5GVVk1?=
 =?utf-8?B?LzdaZVVCK3VBeUxDRFNVbFJkRGZoNStMSW42OFBOd3BVK3J0bjVWQm1NcytN?=
 =?utf-8?B?UUxQcXhFU01HT2ZHWnkvWXlFbENSTENGbXVUWWp0aWVBWGRYbjVWbnBGYmJD?=
 =?utf-8?B?dXZnRDRYajFKSHFRTFlYL0E1S00yZm9tMWdSKzZXMmE3eG5MOWJsc1Z2dXFo?=
 =?utf-8?B?aldMQXFwL3RZcWdkKzYzblgvdEwyR2ZybmlzQlQ2QnZsK3ExbVBNeXpXbkYv?=
 =?utf-8?B?ZHJJVGx6bVFZVFJMQjR2Ukp6R1VyelZPY1lZR2NTRWdSaUZpT3RKZ2l6Nk5k?=
 =?utf-8?B?Qmp5cGlaZHpadHRRZmJyaGJFc2hFOUlYSks5dFZUWUpWM0ZxOTJhN1hmWThM?=
 =?utf-8?B?VCtTYWI4VmQ3Uy9DNzBnNHRDYkVvYUZHUzk1dTNlNm4xQmp5NjNMM2JHV3By?=
 =?utf-8?B?TzJ6NXJJRVBXY0tiZUpJM0Vqa2xkNmlrRkoyU3NzOTNHb0NSS1dMRXhkRHJW?=
 =?utf-8?B?MHcrY3Urc3JPNTVqYjJqS2p4YVNKeTd2ckJNa29hVXhVNWY1OEh5aU91eUR3?=
 =?utf-8?B?UVFSNWM2UUNsQ1RXcGFYQ1pxRWxZZXE3bTMxTVpneXF2WWttNVRNV1U5R09T?=
 =?utf-8?B?WWcrMGg5UTdraDIwSXFNaTJWRzlpbFNKT1hpWWVKQ2lnUnlXdWkxVnlRQUdE?=
 =?utf-8?B?cFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6568.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e4435b6-f1ec-491f-daf0-08dca78db807
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2024 00:57:09.8938 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pl3t/WJd+ALr9ard10thY/f3fXm2+OeWhb+CCV2kWYJ+d8MswleakrsDId5veVnr8oOH7w9vxwhL78JhjT5006poRKXhtrpCOVwob7KB+IA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7171
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

SGkgVGhvbWFzLA0KDQpTb3JyeSBmb3IgdGhlIG1pc3MsIGFuZCB0aGFua3MgZm9yIHlvdXIgaGVs
cC4NCg0KUmVnYXJkcywNCkphbW15IEh1YW5nDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gRnJvbTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IFNl
bnQ6IFRodXJzZGF5LCBKdWx5IDE4LCAyMDI0IDQ6MDIgUE0NCj4gVG86IEphbW15IEh1YW5nIDxq
YW1teV9odWFuZ0Bhc3BlZWR0ZWNoLmNvbT47IGpmYWxlbXBlQHJlZGhhdC5jb207DQo+IG1hYXJ0
ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbTsgbXJpcGFyZEBrZXJuZWwub3JnOyBhaXJsaWVk
QHJlZGhhdC5jb207DQo+IGFpcmxpZWRAZ21haWwuY29tOyBkYW5pZWxAZmZ3bGwuY2gNCj4gQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc7IENhcnkgR2FycmV0dA0KPiA8Y29nYXJyZUBnbWFpbC5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0hdIGRybS9hc3Q6IEZpeCBibGFjayBzY3JlZW4gYWZ0ZXIgcmVzdW1lDQo+DQo+DQo+
DQo+IEFtIDE4LjA3LjI0IHVtIDA4OjUwIHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+ID4g
KENhcnksIHRoaXMgbG9va3MgbGlrZSBpdCBmaXhlcyB0aGUgcHJvYmxlbSB5b3UgcmVwb3J0ZWQu
KQ0KPiA+DQo+ID4gSGkgSmFtbXkNCj4gPg0KPiA+IEFtIDE4LjA3LjI0IHVtIDA1OjAzIHNjaHJp
ZWIgSmFtbXkgSHVhbmc6DQo+ID4+IFN1c3BlbmQgd2lsbCBkaXNhYmxlIHBjaWUgZGV2aWNlLiBU
aHVzLCByZXN1bWUgc2hvdWxkIGRvIGZ1bGwgaHcNCj4gPj4gaW5pdGlhbGl6YXRpb24gYWdhaW4u
DQo+ID4+IEFkZCBzb21lIEFQSXMgdG8gYXN0X2RybV90aGF3KCkgYmVmb3JlIGFzdF9wb3N0X2dw
dSgpIHRvIGZpeCB0aGUgaXNzdWUuDQo+ID4+DQo+ID4+IEZpeGVzOiA1YjcxNzA3ZGQxMyAoImRy
bS9hc3Q6IEVuYWJsZSBhbmQgdW5sb2NrIGRldmljZSBhY2Nlc3MgZWFybHkNCj4gPj4gZHVyaW5n
IGluaXQiKQ0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBKYW1teSBIdWFuZyA8amFtbXlfaHVhbmdAYXNw
ZWVkdGVjaC5jb20+DQo+ID4NCj4gPiBSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+DQo+ID4NCj4gPiBUaGFua3MgYSBsb3QgZm9yIHRoaXMgZml4Lg0K
PiA+DQo+ID4gQmVzdCByZWdhcmRzDQo+ID4gVGhvbWFzDQo+ID4NCj4gPj4gLS0tDQo+ID4+ICAg
ZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMgfCA1ICsrKysrDQo+ID4+ICAgMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FzdC9hc3RfZHJ2LmMNCj4gPj4gYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYu
YyBpbmRleCBmOGM0OWJhNjhlNzguLjQ1YTljN2JmNDljOA0KPiA+PiAxMDA2NDQNCj4gPj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMNCj4gPj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FzdC9hc3RfZHJ2LmMNCj4gPj4gQEAgLTM5MSw2ICszOTEsMTEgQEAgc3RhdGljIGludCBh
c3RfZHJtX2ZyZWV6ZShzdHJ1Y3QgZHJtX2RldmljZQ0KPiA+PiAqZGV2KQ0KPiA+PiAgICAgc3Rh
dGljIGludCBhc3RfZHJtX3RoYXcoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4gPj4gICB7DQo+
ID4+ICsgICAgc3RydWN0IGFzdF9kZXZpY2UgKmFzdCA9IHRvX2FzdF9kZXZpY2UoZGV2KTsNCj4g
Pj4gKw0KPiA+PiArICAgIGFzdF9lbmFibGVfdmdhKGlvcmVncyk7DQo+ID4+ICsgICAgYXN0X29w
ZW5fa2V5KGlvcmVncyk7DQo+ID4+ICsgICAgYXN0X2VuYWJsZV9tbWlvKGRldiwgaW9yZWdzKTsN
Cj4NCj4gQlRXIEkgZ290IGEgYnVpbGQgZXJyb3IuIEknbGwgZml4IHRoYXQgdXAgYmVmb3JlIGNv
bW1pdHRpbmcgdGhlIHBhdGNoLg0KPg0KPiBCZXN0IHJlZ2FyZHMNCj4gVGhvbWFzDQo+DQo+ID4+
ICAgICAgIGFzdF9wb3N0X2dwdShkZXYpOw0KPiA+PiAgICAgICAgIHJldHVybiBkcm1fbW9kZV9j
b25maWdfaGVscGVyX3Jlc3VtZShkZXYpOw0KPiA+Pg0KPiA+PiBiYXNlLWNvbW1pdDogZTlkMjJm
N2E2NjU1OTQxZmM4YjJiOTQyZWQzNTRlYzc4MDkzNmIzZQ0KPiA+PiBwcmVyZXF1aXNpdGUtcGF0
Y2gtaWQ6IGEwM2EzMzkwMmYzM2JjYzM4MDkxZTJjZGNlOWQ3OWY2MzA0NjRjMzANCj4gPj4gcHJl
cmVxdWlzaXRlLXBhdGNoLWlkOiA1MDU3NzlhMWUyMDk0ZjJlZTJmMmE1NWFkNDRhYWM1Y2QxZDUz
NDJmDQo+ID4NCj4NCj4gLS0NCj4gLS0NCj4gVGhvbWFzIFppbW1lcm1hbm4NCj4gR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KPiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgN
Cj4gRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCj4gR0Y6IEl2
byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbiBI
UkINCj4gMzY4MDkgKEFHIE51ZXJuYmVyZykNCg0KKioqKioqKioqKioqKiBFbWFpbCBDb25maWRl
bnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQrlhY3osqzogbLmmI46DQrmnKzk
v6Hku7Yo5oiW5YW26ZmE5Lu2KeWPr+iDveWMheWQq+apn+Wvhuizh+ioiu+8jOS4puWPl+azleW+
i+S/neitt+OAguWmgiDlj7Dnq6/pnZ7mjIflrprkuYvmlLbku7bogIXvvIzoq4vku6Xpm7vlrZDp
g7Xku7bpgJrnn6XmnKzpm7vlrZDpg7Xku7bkuYvnmbzpgIHogIUsIOS4puiri+eri+WNs+WIqumZ
pOacrOmbu+WtkOmDteS7tuWPiuWFtumZhOS7tuWSjOmKt+avgOaJgOacieikh+WNsOS7tuOAguis
neisneaCqOeahOWQiOS9nCENCg0KRElTQ0xBSU1FUjoNClRoaXMgbWVzc2FnZSAoYW5kIGFueSBh
dHRhY2htZW50cykgbWF5IGNvbnRhaW4gbGVnYWxseSBwcml2aWxlZ2VkIGFuZC9vciBvdGhlciBj
b25maWRlbnRpYWwgaW5mb3JtYXRpb24uIElmIHlvdSBoYXZlIHJlY2VpdmVkIGl0IGluIGVycm9y
LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgYnkgcmVwbHkgZS1tYWlsIGFuZCBpbW1lZGlhdGVs
eSBkZWxldGUgdGhlIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIHdpdGhvdXQgY29weWluZyBv
ciBkaXNjbG9zaW5nIHRoZSBjb250ZW50cy4gVGhhbmsgeW91Lg0K
