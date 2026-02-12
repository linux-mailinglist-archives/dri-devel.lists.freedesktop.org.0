Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHteE8KOjWl54QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:26:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0084C12B45C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E4110E6F7;
	Thu, 12 Feb 2026 08:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ldnGhsfR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013059.outbound.protection.outlook.com
 [40.93.196.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D343F10E6F7;
 Thu, 12 Feb 2026 08:26:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ui8tIsXWv6M0cnHJKvWBHTt/xefClInveXpjxPt86BrOVF8uKuiyRal+VGcTchUMZDtK+MA/MdDiKwgOK3dxxiPXAiJRQ0RPctmDMjEsCon5MAguOGFnp/bD7ItGmxl8lP9RF0Oz8VrJUBjVevzRFOE6d4ZKBF1qzzVTmGNvoHEBCRLY4vOC1tmTBDY7STX+5MhtklR5+oSL2hb3iFxBPNuDOVdf6uAUIhpM8CbIhKLTQKA/rBZ90yWiaz9pDoHkZfAoAMllXLh6rjHQa7kye6mEs9es5p+AhewS2fI7XAZCAhTsMCRaJnX/P+D2MGGvjFTpY4VIzK6jEU5uSA4QxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKmy9Rm0VgmITdOrjGQ9mIut7aFo0EeO2y5Vvhl7apk=;
 b=R+8sssZn/Rv1Wy6JKnRD5R6PpXqzBpTgH+oecmeq2mX7oWKWFogScUhKFgPWp65RUqAt7/xIICJ3cokKy7mAQMqxS+TqD7xpgXAKPvWzmZ/wJ6MEWzIhvvJjh6VSo0V4ifujA4OgB3rz130tVPK+aJo1iTiiwO458ZjWV2E4kOulWbee+BBibsB/08OMZ8EBEvrvlwxLVaG/asHZi9PywrzwsUtAFLMaKxUsvWwVP/GN1EnOdey2L8MScTHLGVCcmLlwOpkqp0rOUoubvFUjHzksxh9p+uOIqTd4/P6zLlJeVOVYIISb+d3Hy9fPxlaXgi/35dQy8mwqIpfDV30ZVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKmy9Rm0VgmITdOrjGQ9mIut7aFo0EeO2y5Vvhl7apk=;
 b=ldnGhsfRjBDv89Croubks2ga1d4foNeSsFX8cxdrgiv7Wus82tVaPzDsk693eoiWkqjfmiin4GcEkz7lcRAE7A8R+7s7S2skBeIl5uQtN0pAPmazovZz3jyF3ipWHIhqtCsJ3mIXbZaUVIpgnNmxW5VGW84ZM3TVX9dHQNSvfTUwHzrrCYghyJD8AcI8u+2J+tidQXKRt10VZN0hPtCVZcE0FQaFdELwDscBgiBndKWfjtWDak9ur5VTQq6S5Jur7NMDNDNH1aTIhfXP3mPDFNE2c4faI+XKkxjngr50axUTF1OsfQEFn263u9NwLtRVBoUJctPcy0SeeVWMYpzsWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.20; Thu, 12 Feb
 2026 08:26:36 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 08:26:35 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Feb 2026 17:26:20 +0900
Subject: [PATCH v9 3/9] gpu: nova-core: falcon: remove generic argument
 from dma_wr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-turing_prep-v9-3-238520ad8799@nvidia.com>
References: <20260212-turing_prep-v9-0-238520ad8799@nvidia.com>
In-Reply-To: <20260212-turing_prep-v9-0-238520ad8799@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0123.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::9) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: 7778fc9d-81b3-40f2-14e5-08de6a106f57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0lOOUhiamZ2WmN6UUlzdFpBMTdiN1cwa1Y4L3hNYU5MMGNjcmVUYXZyWER1?=
 =?utf-8?B?TjU0L3dzbDFRMFgrOXhYOWY4RWtjWXZCOXh4Z3l5UVkzd1dwMDlkV0gxOENw?=
 =?utf-8?B?RW02cXdKYUpZc0M3ZldyZEZoWG1CM2Rzd3ZMUzN0cU1reU01azRrTFc1UCt3?=
 =?utf-8?B?OCtOd20xU2ZNUzVOTjM1R3V6STEyTzJOMytoOGRFcFFlTmNKMlNZNWlURlZC?=
 =?utf-8?B?UFdiZEhQR0lWd3k3WXAxWGZTbUZRL05NSVpaTGxiQlQza00vaVNuY3BBeWhO?=
 =?utf-8?B?SkEvOWVBUlFXcFFMY09pR1htekFyK05DMDdPTHNmQmlYQW9mVTNXeUNQald0?=
 =?utf-8?B?SVcweEljb1RXM2cwMjJ1SFhUaVIraFU3QmpTU0hKZ3FHb01IQnZnaXFnMzZt?=
 =?utf-8?B?TndJSWJlanl5Rlo1VWFJZGJNbFlvYTlTbXh0TFRTMHdkWVVNeU5oUTdscWdC?=
 =?utf-8?B?eHZuZzJUWDNMYVB2R2tuYTZNMGNFSEdWUjl2enRqK1dhQ3lmNDR6anRLV0tI?=
 =?utf-8?B?aHBYSW51S08xS1ZBT0xtNThaQVZwMzZlaURhZjdQYkt1N0FibG85eVZ2NEVZ?=
 =?utf-8?B?RXJrNFdtQUE3NEtjeUl2RTVGNlBZdFA4MnZ5OUVTTXl2Y1F6YXllMUJNUmJa?=
 =?utf-8?B?ME8wUE85a0t1R3RXRXZXb1pEbTBtakphUnl4SHo3eWpSYXZpVlgvek1BZkh4?=
 =?utf-8?B?WFlnTlViTlRZTVFkWFE3emU2QzNGTTdaaG9iZTdhVVkvSEd2enRpQmhERmpz?=
 =?utf-8?B?R21ZS1hZV3ljMHFZRXFuS2pWRUpTUkYyV1BtSmg1b0RJdmxRQVlPMXloYnJh?=
 =?utf-8?B?Q2pVM2NDUkdEVmpjaE9hcGNVRzJXT3hOU3FtUnBDeWRkWmtFUVp2dVlVbHY5?=
 =?utf-8?B?WlZMVmxVK3dvUkw5ZDRZN05PbWh0NG84VVIybWZJTXBlODM0Y2lJQ3R6T3VR?=
 =?utf-8?B?cFVldjFTcmNqVG5XOFp4TFZlRnRzbFdlNUg4cjBYNjBPb0ZsenBQcGNFM3po?=
 =?utf-8?B?eDd0UGVYMGw1eVduOHcwOXo5ZWF0K2dFeEF6SE5vVisrc0MwSnAxcWJBUXRY?=
 =?utf-8?B?OU9kUXVpVWIwNmlER3Jydyt4QnRJUFQ3U3VZc2Y1YWpQUHYyNGs4czJjYVA4?=
 =?utf-8?B?dW9CTXU5aU1pRVRRZkE0NFJUcXlYNmoyR3puKzVmVU1BVytqeWR5UnFxYWZX?=
 =?utf-8?B?Zkx2T0NjajE5UTVROTBpUjM0bHRMeVhrT1orZUZpaER0cDdYWFJ5Nk1Eak5p?=
 =?utf-8?B?bTZYZVJ3UEhEZEdmSlZZYlFXb1pjNDlnNEJNTjV0Y0kvZVRLZCtJbEJmWlFP?=
 =?utf-8?B?NGROUVlDcCtVMHJWUmFxUGFPSWxPTmdhMVluTVgxbEVQUjN1L21nRWlCUnl3?=
 =?utf-8?B?L1dlTTI4azNwb3FEQ2kvNEMrTGJDSVJId1Z5UmRSN2lFZ0RDbVlaYWJDREVz?=
 =?utf-8?B?V3NDdmg4ZDZqSlhLM01BWng0aFUrM2kxS3hja0N2djNTQS8yb2xSNkFRL3NY?=
 =?utf-8?B?UUdXcndBcnZMVHVlYzNaVkxOZjVGMzBOSTFYa0FhVzFKekFBMmMxcHhGY1kw?=
 =?utf-8?B?Y2drOUx6ZCtUN29HcjJnUHdoVUhrTVgvTWhqbFJSODhwdC8xSmRVTk0xS1FJ?=
 =?utf-8?B?UGI0b0VnVmJMSnlFWWJrUEZ0blJkUzJvQnV1V3B2Y3FnUXNqWUtpYXUxdmpa?=
 =?utf-8?B?Qk5FaXYvTGkwNmZJUmZMWDFjYlZNckJrWGl5a1o5aE1CTnhYZTBQZnBPMTJ2?=
 =?utf-8?B?UnBVMUtJNHpWVkkwelVKZTBMUTJEQXJMV3ZGanZlK2s5TnpocFBzSSsrZ29i?=
 =?utf-8?B?OWNJdFRrYTFNWU9JRWJwVWswVnVkUUZvZWJkVXM3ZDJVOXEwWVNJdGxDU2cx?=
 =?utf-8?B?OXVqL3ZudGJWQ0JuTmlVQmZVWW1kYmZ5NG82TzEyVDNITmszVUZIQTRaTGw0?=
 =?utf-8?B?ZmlhRjhQYTJpaTBRbGRCcXg3aHl5NWM4c001MllHK3NCalJLMjJWT29TdXR6?=
 =?utf-8?B?UmxYUUtTbmRESnZ0VzJsTzU2bnY4L1c1Y09zY3l0RFdKYzloWndaWDJYdWVz?=
 =?utf-8?B?V1didVYyRGhUbDFzdUV3SGZHa09QNnU2UWlVelNNb2lMZmRYMmdXQWs2eWVN?=
 =?utf-8?Q?CA60=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VURwcVZMWlVKT3o5Y2FjaU1hZnR3REloUDFseStZUktvUVZKTTN2WWhONkZS?=
 =?utf-8?B?YU04bWF6UFRncXI1R2pvdmdCR3NGNjJHSDlBbml3dkg4Qm8zcDNodTNxa2Ra?=
 =?utf-8?B?ZjhHUWZ2TGtibHVGWEVYMkhMZU5UR3Q5Ujd2SGNTWjlCWU5rbHZ2SE5oUVNE?=
 =?utf-8?B?N0NoVkE3U1RZRkNIdkNCZDRRYmY5Y0dOUjdlYWFyZzFsMmdpZDBWRXdzSGVC?=
 =?utf-8?B?TzdKOWcyL0VGYU9QbmR3U1JUT1l3cUFkaHdMSDhGMXRRQjZZdmxSRGtmL0JY?=
 =?utf-8?B?c3ZiYk5KK3JVcGoySUVKZGNVVHFObHlCWTRnRE9saUcyMnl2alRTcUJOMS9E?=
 =?utf-8?B?RjZLZXp5dzJZQ29MWExMOWNVM09YTU9zMzdKYUV4UEJSZkd3Q3IvOXZHRElI?=
 =?utf-8?B?V25TOXhrblBwUUNUbTZUOExzdFI0Y3paV2NnTmNjSUY1cGV1amcwR3MwQ3BP?=
 =?utf-8?B?QjNkYksyMVMzd2l2MXUwbXhlVDk2OFdHWmhZZjlVaEcvOVEzN2h0eDVmcjQy?=
 =?utf-8?B?TkdUUmFSOFVRcGM0R3NSdGhicjRLN0dodExJYW54alFRRlFVTDM3TG9UL3dL?=
 =?utf-8?B?VGk5VTI0TGhqTXpDWDJkU3ArdjhYdVVvdW85aE8yQ282UDJWWTNxbW1ERjUy?=
 =?utf-8?B?VzgrbXJ6MlJKV3g2TFBCTVp5VHYveWlyMXJkODcycUF4N1dGMHM2UFJvUTdP?=
 =?utf-8?B?SVUzSldNejFXdlNCNzZkNVNISTN0VXRvdkV5elkxK2JtcXNoakZYVXZpRzZB?=
 =?utf-8?B?S1lrUHMxWXZtdFJ3TWkzSFo5dFVFN01PeFVvS3QyR0dyQXFrUlhhTjR2blZ5?=
 =?utf-8?B?a1hrUmN1ZkZXSXFkS2p6dkk0TVEzcGtTbUUyN2p1RXZkc0dHRlRZbG9ZV3Rt?=
 =?utf-8?B?Nk1ZblpyRUxDR2JYR2MzdnZVbmFzMkx1MHBYOEVsQWVTeGpYS0J2L2FjcUZM?=
 =?utf-8?B?clVDK2dpenkxaGhhVzJ6ZDVnakFmSHVrbXlJOTc1QUtiSTd6ZjJkbmRjU050?=
 =?utf-8?B?SVdyeWpJdUxlcjhCTk1yamVqR2hSdW5aTEcxVXFjSjV6K3ZndkZWWkNzSmRa?=
 =?utf-8?B?Q21UaFNYOE5wcFZJaVg1a0hNTURVeWhhMFFRYTEyNGR5K0JWMGVPRlBSN1BO?=
 =?utf-8?B?SWxPcFhkTHFIdmR1ZlQ3aVdsVEVycHBMcjBGQVI3RGNmQjlaVEZCTTlPZnJH?=
 =?utf-8?B?NndPNVB5WDM2Zmw4aVZjL3JHVUM0U0JETUNxRXBmUzJmNlRsNURiYjMzWDUy?=
 =?utf-8?B?L0dwM3ZaTGVkM1A4Tm4xYi84Z2JlNEZTaFh4TExPNVFGOU1ydEJUZzdKT2RT?=
 =?utf-8?B?UDF4Ri9xT21WbEV3cnlaMk9OcC8rWmo5c0RDV1NPQXZ0LytWVW5LcS9uaEpk?=
 =?utf-8?B?bGFHNHQ2VnpCZXNxQzB0SWFRbmIxWmF0Z0RjQ1hocGJvdFFacGM1QjhFS0ow?=
 =?utf-8?B?UWJUYzZ4TEtRdkcwVmtlUVlzUnFBeHlTODFyMW9zcW1HQXNoVm4rdUVoV0or?=
 =?utf-8?B?TGZ6bFBrZGdueWxwVUpGNUJaUkNnaittcjZjTEZUS2Q3aXBsUDE4aU56eC9J?=
 =?utf-8?B?ZjlFM0MvOU1keHBHbHUxVHdKbkdaVVFzcXBhNDB6YjI2a3h5a2lLMmxlU0RW?=
 =?utf-8?B?NnF4UHhtRXp0OHY5ZzI3T1cyL2R2M0xvTW5CdmtORGVEbzA3bUVZYVhEbnJj?=
 =?utf-8?B?bGUycEhneTlMamwxZkFpbHNxQVlBYzhxck9yMGtoOFVwWVcyMUJueWtHMmhq?=
 =?utf-8?B?OEQ2MDl6UldBR3VaQWJFcGpsdzBsWmRzUzVpYUx4V284aklOV1BWUEhQZHF5?=
 =?utf-8?B?THR6TTRqdDNpNkZ1VGxpdXlZR0FheFhDY3dySDVQL3JVc0ZqWVBGUVh3OUx3?=
 =?utf-8?B?TGNkRENUYzRqZGYxUGtSNEpmOFl4RzltcExHcXhoMFF6TVBTcnQydzcwbWUz?=
 =?utf-8?B?YXdER0JxdkN4YWRJZmVpT3dFcnFNUVRYTDJEUzBQK3J6ZnVBemZrMlFGa25T?=
 =?utf-8?B?NFpmMlIwLzJhUUZTTXp1Q0x5TVNTendZdkhpcVI2UmhQbkpCd1E5RXU5bS8y?=
 =?utf-8?B?RWhMRkx1dGdkSGlNRnJuU2VUOG5iNGFEcjlxSWs2Rlh3TFowSk9DTzdoeGVr?=
 =?utf-8?B?c01YZVJiakZhUWVlSnhpdjkySmRLaWt5UWlzT3ZKRDNwTVdUc0dGQjlBeDd4?=
 =?utf-8?B?UnI5aHZjWnlaRjcxMXFna0psQVhKbGtCWHZMMFJVMk5pT09ZY3ZTNEVrR3J0?=
 =?utf-8?B?RkRtMTBSWldtR0ZCQitnQm1Oa3pqNUtVV1dBRmtmN2ppeDZTRXlDU3V0RkpC?=
 =?utf-8?B?UU5yTDBlVURJQ3RzZkQ0RXZ1SjZ2WTRHOVFYbHNCcWJ1UG5tTDNkdVhwaXlL?=
 =?utf-8?Q?mlhxHrfdeDkb2dm7bWhDlJWFDv2LaJluktlTWkYmOtlqC?=
X-MS-Exchange-AntiSpam-MessageData-1: q1D9MjKYYGG57A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7778fc9d-81b3-40f2-14e5-08de6a106f57
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 08:26:35.8578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6B0i9jaylCNL262HsBB9BIR13Mvf2VNJ+gxvbPcVCDljJmBSHhKVw3rK9vQ+vJsijfEXBnowgIO3yBpCxtqVxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8800
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 0084C12B45C
X-Rspamd-Action: no action

This method only needs the `DmaObject` to copy from, not the whole
firmware.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index d2f27847f533..35744f7c9cb2 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -416,10 +416,10 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
     /// `target_mem`.
     ///
     /// `sec` is set if the loaded firmware is expected to run in secure mode.
-    fn dma_wr<F: FalconFirmware<Target = E>>(
+    fn dma_wr(
         &self,
         bar: &Bar0,
-        fw: &F,
+        fw: &DmaObject,
         target_mem: FalconMem,
         load_offsets: FalconDmaLoadTarget,
     ) -> Result {

-- 
2.53.0

