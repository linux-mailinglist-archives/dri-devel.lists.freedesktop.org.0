Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2358DA7E1E3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 16:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B26610E4A5;
	Mon,  7 Apr 2025 14:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NisW85LC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA82C10E460;
 Mon,  7 Apr 2025 14:36:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3cn/AihDpdON+9dFfVOp0QihIFSfERsmHXN1HPom2M8HfnftVjYtRq3WOdQzXF3YBvY6MH/Fr6k+u4MmkpIwT0T+tMUZbJSB7S8rAQ5somGHdsjHloTntzhtMtUKM387LUoSSQQgiOAI1AMKiqA85oZSK2TEtNGm+x+yoZL5XrxcUSnOQPVp9lD1QwWFh8v+YAVj398w2GogPzyujVcaWbaxCisauyV1k24Nkng0NmaT30RZT5fusVCQhaBWO7oBTfRD21yVj+sLQfvv+YVSaH5lt8kMvd4xCpH5s4kSoBK0jhaAYXDhu7LYhCqgOr0ir6HNCE+Jmrc/UPSg5xGUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aAcUweTw3pEmjBbZG4N8kUaGAqhg7giZpbi0HvdlHEM=;
 b=BKame75eEIT+aaVlBAEmtdXxQ+7WyMq2wYCXqmwqtGf5Ovym7gohCeTCIO2HuET74dyET4ld9QQg07AYddbPIA0VgSanM8YRQtXvRMeHo9EezxUEQ8Or7P/JmWjJ7zu6N1rawNau9CnAJU+IfzPC2GHLnnu07nbCwHxGXxiYfp3kHvRQAsaHyBGFoNwHviSRpD6g0S1c8MQZllTfEpoFArConEZn8BJkLrPZgU40eyTRmtloMg3U7AFUXwlCpg9d2Whfk2cORGwg0NUuPRignZ9kfES+hY/8Va2ZRCvmiVyJyQrsYSV9pzeLHvMn8BRcSWZASACwdGkDu4dsG1WiuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAcUweTw3pEmjBbZG4N8kUaGAqhg7giZpbi0HvdlHEM=;
 b=NisW85LCBHpMDqI6KDIjjYUBBvYxsrlbsSY1xB8RqAb21HTHLVhcuGniCV26Ll73VOsXd7XJ64YRrKFfWaRuAIbr9E28xazhmFZRCQrOZUg4gBV5RMV5Y+Qwzqs/qG6x/+FDPq/+1Ty1MFyzygHBGGaeYLqzF488wU+KLn4v0tc=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by DM4PR12MB6616.namprd12.prod.outlook.com (2603:10b6:8:8e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.45; Mon, 7 Apr
 2025 14:35:59 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%6]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 14:35:59 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "kernel-team@meta.com" <kernel-team@meta.com>, kernel test robot
 <lkp@intel.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH RFC 4/9] drm/amd/pm: Avoid open-coded use of
 ratelimit_state structure's internals
Thread-Topic: [PATCH RFC 4/9] drm/amd/pm: Avoid open-coded use of
 ratelimit_state structure's internals
Thread-Index: AQHbpN2BM+ySY16V60CIoYSnrwfOMbOYSpCw
Date: Mon, 7 Apr 2025 14:35:59 +0000
Message-ID: <BL1PR12MB5144A3990501E76BB96F9557F7AA2@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
 <20250403211514.985900-4-paulmck@kernel.org>
In-Reply-To: <20250403211514.985900-4-paulmck@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=3204a20e-e3ff-475b-8e30-f90999a49467;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-04-07T14:34:32Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10, 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|DM4PR12MB6616:EE_
x-ms-office365-filtering-correlation-id: a068706c-15b2-43e2-96db-08dd75e183bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SC9UTVUzWmxrWmFDZGZ5SEdyTzB0NXJYUEUxZFJYSTJFSTV5M21TdDJVUFdq?=
 =?utf-8?B?MXdLZEFPRktFM1JsUHpBTWsxSlJJRi95NGIvd3c2U0l0UHRTSGVDakd0OElx?=
 =?utf-8?B?cGVyWUtNYVd5cDRLY1I5UjdtaWxYSzdEam53SE9WSUpBSVZ5Y0xkUEl1Q3M3?=
 =?utf-8?B?RnptMllXdDFvZ2NvZWo5cGUzMHRxRW1PckJoWmoxdmpoVkVKYmRrTm9QQmtD?=
 =?utf-8?B?dkZ6SExzTXloc0lhR1VjdTdHZHcrYVJaaFZzeFBIZ2ZzaHVYNHdiQis1TE5j?=
 =?utf-8?B?UXA1VWNkbkpXTzlxLzZxZ3A4dHJjWC9DVDVDQ0Y1RnQxKzZMT0RlRmprNlNn?=
 =?utf-8?B?RGprN2VZNy9IcWZKSndQRHJnNlBGYW5MdUwyYi9ZYnVlNVVGUTIyVlE1VmdQ?=
 =?utf-8?B?RS9oK0NMeEk5WG5kY1ZHM0xjV0NpTGZxVFp4RGRsajd2OXZpbk9Ka2dIMUQw?=
 =?utf-8?B?Skx3TzJBZzlIVlk5OXRodktSeSt6NzN1eW0yUFRUc1MwYk5nZ3lZU0pFQm44?=
 =?utf-8?B?WEpCMThWRkpZYTVnKzBCSmE3NzB2dUs3aW9TcHZaSmI3clYyS1ZRU3ZXWWk0?=
 =?utf-8?B?Wm9oTGltSjVpbnlqeE1PY1hiTC80MTIwc2JqZkVjZU9iVzNtMFJKbTFPMnM0?=
 =?utf-8?B?UzNUZlRIMnpoVEhhQXNWQ243WmcyV1VWUXVnb2tRM291bStOeUEwamJ0d3FZ?=
 =?utf-8?B?S0hxalc4RkdNSkJreXNNTXlxVEVReVBwcThGNnlqL3F2UWNNVXE0bHdPSWE3?=
 =?utf-8?B?MHllaThma1R2MGlJcUhVaVQyVzg4d1loZDA2alplTzhFU3ZxdTdMTkdyUHJi?=
 =?utf-8?B?NW1zUXhmNzdxcTBJUnh4US9oNUtnL0NnOW5OSlRDQnh2b3M4N0ZvSFoyam50?=
 =?utf-8?B?VkRjUXdZQ2I5bFJIQTF3N0RQcmhUSXV3TUt0T042a2VyczFHVloxd3VIQ1Z3?=
 =?utf-8?B?Z085V05OUUkrUFV1VEt6VW1EZzNCS3JiWXQ1QVRHRkNZTWZoU1NFTHl2NWVY?=
 =?utf-8?B?azFrQXdTOWtMV2g3a2grZUM5ZmY0bGswUm9ZNE1KekkxVVByZDN6VFBjRXpZ?=
 =?utf-8?B?V1djSjFEVXduRUIxRVd4SHhsNUZkWVZ1ZDNyaytJckZiOGl6TDVrK1hHQ3A0?=
 =?utf-8?B?UzZNRUZWODNSeG51d1pIeFYyRmdCdG4ySHk2VmF3SGpFM0Rqb09LUnpaU040?=
 =?utf-8?B?aE5VMktXWUcra1VodUxiKzlpNFJyTjNpajFDbzliaE1MaDUzT2FVM3YxNjZm?=
 =?utf-8?B?WVpLdzZZdnZZUkRXTXVIYnZFbDRlQ1BObHpNdUE1czY5V3dOY0RqOUZoR3pj?=
 =?utf-8?B?czAzeWhyd2k2dnIxaW1VOUR4R3NwdG94THZVR3h3aVQwcnFxcWJwY201cm1j?=
 =?utf-8?B?MjRCb044akV6NkRFZ2JoTnFkQStvbk9DQ0lwdTg4M2d5YlREeWk1RVZLeVVy?=
 =?utf-8?B?S0d3aFVwc3NsRitNSXp0VXFKLzBOcnpRTkhSZGx3eUpzNmJFb1I4T1BOUzhp?=
 =?utf-8?B?UG5TelI3a1hTb0dIV01rdGxNVFVnOStqckxFeG5od0s1MnI3bityd0VnRmVY?=
 =?utf-8?B?RWJrR2oxSnZSMllGMWpWOUYwWitpL0JUVnJiZDhtc0hneXI2VUdQTCt2ZENi?=
 =?utf-8?B?dXpSRDZZazZqNjFUTHVLSzJZMHRMQlRxV3dmOXBWNkEwcjRWU0RUMUlFNWcy?=
 =?utf-8?B?V2U1cFhXR3FiMUVXRmhUeFNWSk9MeSttMkZLOGtjM1A5dmY2T1ordCtIQ05E?=
 =?utf-8?B?WXRkaFZsQ1BwQkRnZWxjNGlYZjZJdFltOEhqNDRGUEYwK2czMGxMRjRuWjNx?=
 =?utf-8?B?Q1I5QXlxMWVIUkFLTHhmTzM3Nkp1NG5wVis4ZVZQc25RK2dUYXYxbW50b1ND?=
 =?utf-8?B?bXBSdVl3b0V6RnphV09FOE0zU1dyUC83ZUxjUXdjbXBIOTBubmoxcFNyRkkz?=
 =?utf-8?Q?8HrZt1dkuWCJXpLjuZD7Lejh6/qTF8x5?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWIyZEYwYUtLcXhhV0pUMWI0NlZlQTNKV1dpMnhITG1zcW5oVGFKQS9oak5I?=
 =?utf-8?B?emZ1Z1EwWUZoQ0lxUFFkU0doeXltUE1acUh2Y0ZUN1RDaDlNZXBFdy9Wd0hN?=
 =?utf-8?B?Z1d0R1dWU004UU5FWXEzamFTeHl1K0R5bUpKak9sOTZPMG9EYkJCM3RzMEh6?=
 =?utf-8?B?bUNCYVYyem5HOWhwWXhKWW1VVXJ2ZjRISDQ4UmJPaUtCTjBrdStXLzhXTmZS?=
 =?utf-8?B?ZGthdm5vbXlBMm1UUkYwT2wyZ0ZwSG1zbHZMRmZtbm44OEpuMWR2Z0J6NVMv?=
 =?utf-8?B?cXJHZXN1N3VKOGliUml4T3BEUjB3cFQyemVrWkZhaUJKVThsS1cwQlNuUC9y?=
 =?utf-8?B?Y0FQVFVxQTMyaUJ6WkJZekp3QUgrcmZLQ1dOYkdVU0Y5LzdjRjEySHMyYksx?=
 =?utf-8?B?Z05kbE8weUp4ME9EeS9NSkFUY09xZ3U4WTRDYTE2N0hLVHJWY2ViVzgyVWZk?=
 =?utf-8?B?Z0NsS1JlYzRxd1p1Q1NpUDhFT29NbW1nSmhMWEI5b1RseDZ3cWNoSzBFb1Uv?=
 =?utf-8?B?RWlvdkl3dWZuUm1KWUwvaUxZTTVuWUpWc1ZzdVlDb29SUXVTREtjdUxRUGt4?=
 =?utf-8?B?L0xXc2pVNmEyOXNubExERUowZ0QwclpFZnF0cHVQYUdodG1YZTNiN0ZTMEYz?=
 =?utf-8?B?MkQ4aG0xUWJQQktkQWFPM0RQTjRuSkVpNTJkYnZERzhxdVV0Vi9FQ3JmRHRL?=
 =?utf-8?B?dVJBS1RiYWp6VlJ4ekZLQ2xOQW94Ny8vZTVKdjNHejh1UDFQam1nd1pUU1Ft?=
 =?utf-8?B?OUh4aFBqZWREOUhpcHhHTDc4ZW9uTzRtZDBPbHVCblhvNitrMWZJWVd3OENZ?=
 =?utf-8?B?bngrWkVFTHlad3REVEkzL0lqbUFRR2ZwVFBSV2tadzJUNXoyTE1EYUVlUFV5?=
 =?utf-8?B?akFid1huMUJLUnpWVExaWk5vNlVOQmRtRThOYUU4Ni9OYWRUclFLUDZvMUFi?=
 =?utf-8?B?VkQ2UEtUaldkK3htYXlpZjZUd1E2KzlYWEtvd3FFWjJFdG5WRlpVSmtETWpq?=
 =?utf-8?B?VzQydTNnbWxEU2Q4b3I1SC9zdCtHVGJHWXZ1cDJNRW93YUdNVktHY2pVWEha?=
 =?utf-8?B?dnBzME8zY0xxSlhZQlc5MFFXakdpeEcvcVhPRm1yWHJxc2ZVMEZ6QS9Gbk9h?=
 =?utf-8?B?T3NhUnk3VTd3V0xDQzY2OSt5c2hINDdJN2EzVE5WMVVSOXowVWwwcjFTQ2ZJ?=
 =?utf-8?B?bnVscDdTYkh4VE5SVmQ1dzliRS9ydmFwQmwyeWlYckpzMzd4SlVKblFKaENN?=
 =?utf-8?B?SjNxY3hnME1OeVFYb2VmcTRNOGlja2hJTjdJRm5HMTBBM3VsSTRURDEzZUlZ?=
 =?utf-8?B?V1dsQmRSWHFyWEZzVzE3OUZRNmdNcGJFMHlTc2k0Y0xqS0NoYTkxWlBGelBZ?=
 =?utf-8?B?RUZSU2p0RzRuM0ZmWUswWC90aDlKWkVnMmgwalBrRytNZnNLZ1RaVXRhc0tv?=
 =?utf-8?B?YmVuTFh1RlFFTXFMZmQ3ZngwTmFmNXdKQzZUTURrWVZvdHlpdmh1Q0R0SUh0?=
 =?utf-8?B?bWt0NVBRQ2pDcmRFeG9qaEhBTUUwdytZbm9USWM2M2dnK0krWXRRTWNTVDVr?=
 =?utf-8?B?NGFlbFk1NHp1VmlpcytVRXlER3huMEdSVHM1YVdjNkdFWG9pMXJ6N2tVeXFY?=
 =?utf-8?B?VGhLUHM2R3ZIWmNJa1NRRWsrSHFxVjc1c0pTeVhoY1B5UGJOeGNXLyt4TGNC?=
 =?utf-8?B?a0JJaXA1S3QvTzIzaEU1Tkh6YzJnQ3RBWElmblJCdHhSaDA2K3NaaGtyeUUr?=
 =?utf-8?B?a0NJaEwwVjdtcXhLaE9EZ1piL3BKaE1SSy9ON1hLdnhUNkJpZE91OVhWSHdJ?=
 =?utf-8?B?a0JnQXROK3JkMXNzNU8yaytXODFXMG45bEJPOWJmNzQzOTVyZEYvR0wzamp5?=
 =?utf-8?B?NlR1VklhdEZvTUlZVUVCYVdzYVBjdkNGd2EwM0Nqbzl6VldXQ0tyWEZZUHJK?=
 =?utf-8?B?YUNVWFNRUFBnZnQ4OUEvb1NPRldmYTdRQlBDRlZhTkdwanMwcFV4UTdMVVpw?=
 =?utf-8?B?YnJ6UjdvMm42VHN0ZzZBb2pUQnZ6eGtkOUpaWjFaQ1J4SHRpNDMrV0g5SGhy?=
 =?utf-8?B?WTZvRW5XZHdheEtMdlFwckNWY1Q0dHRpOFhPYW1YbGk4NE0yYktnMEZMMlNz?=
 =?utf-8?Q?2j4E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a068706c-15b2-43e2-96db-08dd75e183bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 14:35:59.4372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z1XCGOUGcq/rhwP8fLI92MQZpBvr9qmj4sEFtO4N+UxLqGG+XsLRhx464F1P5nSkTsLm0luEsELs5JWspentHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6616
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

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXVsIEUu
IE1jS2VubmV5IDxwYXVsbWNrQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCAz
LCAyMDI1IDU6MTUgUE0NCj4gVG86IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6
IGtlcm5lbC10ZWFtQG1ldGEuY29tOyBQYXVsIEUuIE1jS2VubmV5IDxwYXVsbWNrQGtlcm5lbC5v
cmc+OyBrZXJuZWwNCj4gdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT47IEZlbmcsIEtlbm5ldGgg
PEtlbm5ldGguRmVuZ0BhbWQuY29tPjsgRGV1Y2hlciwNCj4gQWxleGFuZGVyIDxBbGV4YW5kZXIu
RGV1Y2hlckBhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4NCj4gPENocmlzdGlhbi5Lb2VuaWdA
YW1kLmNvbT47IFhpbmh1aSBQYW4gPFhpbmh1aS5QYW5AYW1kLmNvbT47IERhdmlkIEFpcmxpZQ0K
PiA8YWlybGllZEBnbWFpbC5jb20+OyBTaW1vbmEgVmV0dGVyIDxzaW1vbmFAZmZ3bGwuY2g+OyBh
bWQtDQo+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4gU3ViamVjdDogW1BBVENIIFJGQyA0LzldIGRybS9hbWQvcG06IEF2b2lkIG9w
ZW4tY29kZWQgdXNlIG9mIHJhdGVsaW1pdF9zdGF0ZQ0KPiBzdHJ1Y3R1cmUncyBpbnRlcm5hbHMN
Cj4NCj4gVGhlIGFtZGdwdV9zZXRfdGhlcm1hbF90aHJvdHRsaW5nX2xvZ2dpbmcoKSBmdW5jdGlv
biBkaXJlY3RseSBhY2Nlc3NlcyB0aGUNCj4gcmF0ZWxpbWl0X3N0YXRlIHN0cnVjdHVyZSdzIC0+
bWlzc2VkIGZpZWxkLCB3aGljaCB3b3JrLCBidXQgd2hpY2ggYWxzbyBtYWtlcyBpdCBtb3JlDQo+
IGRpZmZpY3VsdCB0byBjaGFuZ2UgdGhpcyBmaWVsZC4gIFRoZXJlZm9yZSwgbWFrZSB1c2Ugb2Yg
dGhlIHJhdGVsaW1pdF9zdGF0ZV9yZXNldF9taXNzKCkNCj4gZnVuY3Rpb24gaW5zdGVhZCBvZiBk
aXJlY3RseSBhY2Nlc3NpbmcgdGhlIC0+bWlzc2VkIGZpZWxkLg0KPg0KPiBOZXZlcnRoZWxlc3Ms
IG9wZW4tY29kZWQgdXNlIG9mIC0+YnVyc3QgYW5kIC0+aW50ZXJ2YWwgaXMgc3RpbGwgcGVybWl0
dGVkLCBmb3INCj4gZXhhbXBsZSwgZm9yIHJ1bnRpbWUgc3lzZnMgYWRqdXN0bWVudCBvZiB0aGVz
ZSBmaWVsZHMuDQo+DQo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVs
LmNvbT4NCj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIw
MjUwMzE4MDgyNi5FaWVrQTFNQi0NCj4gbGtwQGludGVsLmNvbS8NCj4gU2lnbmVkLW9mZi1ieTog
UGF1bCBFLiBNY0tlbm5leSA8cGF1bG1ja0BrZXJuZWwub3JnPg0KDQoNCkFja2VkLWJ5OiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQoNCkZlZWwgZnJlZSB0byB0YWtl
IHRoaXMgdmlhIHdoYXRldmVyIHRyZWUgbWFrZXMgc2Vuc2UgZm9yIHRoZSBsYXJnZXIgc2VyaWVz
LiAgT3RoZXJ3aXNlLCBsZXQgbWUga25vdywgYW5kIEkgd2lsbCBwaWNrIGl0IHVwLg0KDQpBbGV4
DQoNCg0KPiBDYzogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1kLmNvbT4NCj4gQ2M6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4gQ2M6ICJDaHJpc3RpYW4g
S8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiBDYzogWGluaHVpIFBhbiA8WGlu
aHVpLlBhbkBhbWQuY29tPg0KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4N
Cj4gQ2M6IFNpbW9uYSBWZXR0ZXIgPHNpbW9uYUBmZndsbC5jaD4NCj4gQ2M6IDxhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZz4NCj4gQ2M6IDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vYW1kZ3B1X3BtLmMgfCAxMSAr
Ky0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlv
bnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vYW1kZ3B1X3Bt
LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2FtZGdwdV9wbS5jDQo+IGluZGV4IGU4YWU3
NjgxYmYwYTMuLjZhZGY0ZTg4MjIxMDggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG0vYW1kZ3B1X3BtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9hbWRncHVf
cG0uYw0KPiBAQCAtMTY2Myw3ICsxNjYzLDYgQEAgc3RhdGljIHNzaXplX3QNCj4gYW1kZ3B1X3Nl
dF90aGVybWFsX3Rocm90dGxpbmdfbG9nZ2luZyhzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ICAgICAg
IHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ICAgICAg
IHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gZHJtX3RvX2FkZXYoZGRldik7DQo+ICAgICAg
IGxvbmcgdGhyb3R0bGluZ19sb2dnaW5nX2ludGVydmFsOw0KPiAtICAgICB1bnNpZ25lZCBsb25n
IGZsYWdzOw0KPiAgICAgICBpbnQgcmV0ID0gMDsNCj4NCj4gICAgICAgcmV0ID0ga3N0cnRvbChi
dWYsIDAsICZ0aHJvdHRsaW5nX2xvZ2dpbmdfaW50ZXJ2YWwpOyBAQCAtMTY3NCwxOCArMTY3Mywx
Mg0KPiBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVfc2V0X3RoZXJtYWxfdGhyb3R0bGluZ19sb2dn
aW5nKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsN
Cj4NCj4gICAgICAgaWYgKHRocm90dGxpbmdfbG9nZ2luZ19pbnRlcnZhbCA+IDApIHsNCj4gLSAg
ICAgICAgICAgICByYXdfc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnRocm90dGxpbmdfbG9nZ2lu
Z19ycy5sb2NrLCBmbGFncyk7DQo+ICAgICAgICAgICAgICAgLyoNCj4gICAgICAgICAgICAgICAg
KiBSZXNldCB0aGUgcmF0ZWxpbWl0IHRpbWVyIGludGVybmFscy4NCj4gICAgICAgICAgICAgICAg
KiBUaGlzIGNhbiBlZmZlY3RpdmVseSByZXN0YXJ0IHRoZSB0aW1lci4NCj4gICAgICAgICAgICAg
ICAgKi8NCj4gLSAgICAgICAgICAgICBhZGV2LT50aHJvdHRsaW5nX2xvZ2dpbmdfcnMuaW50ZXJ2
YWwgPQ0KPiAtICAgICAgICAgICAgICAgICAgICAgKHRocm90dGxpbmdfbG9nZ2luZ19pbnRlcnZh
bCAtIDEpICogSFo7DQo+IC0gICAgICAgICAgICAgYWRldi0+dGhyb3R0bGluZ19sb2dnaW5nX3Jz
LmJlZ2luID0gMDsNCj4gLSAgICAgICAgICAgICBhZGV2LT50aHJvdHRsaW5nX2xvZ2dpbmdfcnMu
cHJpbnRlZCA9IDA7DQo+IC0gICAgICAgICAgICAgYWRldi0+dGhyb3R0bGluZ19sb2dnaW5nX3Jz
Lm1pc3NlZCA9IDA7DQo+IC0gICAgICAgICAgICAgcmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUo
JmFkZXYtPnRocm90dGxpbmdfbG9nZ2luZ19ycy5sb2NrLA0KPiBmbGFncyk7DQo+IC0NCj4gKyAg
ICAgICAgICAgICByYXRlbGltaXRfc3RhdGVfcmVzZXRfaW50ZXJ2YWwoJmFkZXYtPnRocm90dGxp
bmdfbG9nZ2luZ19ycywNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgKHRocm90dGxpbmdfbG9nZ2luZ19pbnRlcnZhbCAtIDEpICogSFopOw0KPiAgICAgICAg
ICAgICAgIGF0b21pY19zZXQoJmFkZXYtPnRocm90dGxpbmdfbG9nZ2luZ19lbmFibGVkLCAxKTsN
Cj4gICAgICAgfSBlbHNlIHsNCj4gICAgICAgICAgICAgICBhdG9taWNfc2V0KCZhZGV2LT50aHJv
dHRsaW5nX2xvZ2dpbmdfZW5hYmxlZCwgMCk7DQo+IC0tDQo+IDIuNDAuMQ0KDQo=
