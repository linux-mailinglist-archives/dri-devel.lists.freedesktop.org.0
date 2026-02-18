Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHWbCUCnlWkQTAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 12:49:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CD7156135
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 12:49:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED8810E5AA;
	Wed, 18 Feb 2026 11:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XeRsP11z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012019.outbound.protection.outlook.com [52.101.43.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C456E10E5AA;
 Wed, 18 Feb 2026 11:49:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FEuqwUc7yEKUJkZpyzb6TPYiVuel7ofB3pL58SDcAF4kCHLPWbklGusqJHixnzycL8K6u8iE+Bzgcz5vAxGMt7IVo8cQB67nMvCgIU/I4pEqeyuxnxRC1WBMJV/nWznXeyj0yJUbiyrTvuUlkLVhnp56ywQni4ITHYtyClR2L8XR9PgA54fdD0gnjGri7Hl3MrkGmmEadyiTz7gQquj+wLmNs2uwtz5L6J0eLnCewbCfflRpSdqLtM0FjB5MrnMs0dmkFEl9Yben+CKc3T3RBARrvZxz9MJTTl90Qqfvmo/w9NXWGcjeUEjORY1V5wAjfLD7v3dR+uBlnWnIRYB5cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIsguk9xAakbXkxIK+E1eiNOufguD/ZgNrdvY37dLU0=;
 b=Ql8H9Nc3w3NveCedV1j7p4i2wbbUQ0bBi4GCxx9A6PxUs2Nrmp9svlv2Yc4vjSL4NKOLz5q4v7rIzEotWgBjUhkDKce7p7PkV+Kw0P1QTsUqtvoTmXvnPujv+N/F44QnzZkoNVp0t+k2sOIP9TLCiMtOQJeFN3NRu4KyQAIssa6w8KUzbFG1kp/q33BRRJxYj4fpKix8+DsJB71yoAvxRSrYEaX047adyYTYzePw0xGMuC3IbCcRB1SgMRmv6dio36JHDUmbnTe05uFjSLmFxjgcUUsu5vBO2f8YiXQZAhW8TjxWzqdGwiTVGXgYcyo7iHF5Ednk6eUzrbqe6LQRLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIsguk9xAakbXkxIK+E1eiNOufguD/ZgNrdvY37dLU0=;
 b=XeRsP11zShaU6/7e4AA1x99Q8555VfRxAl+LFy/9Xd2YexuauHfgWV5YM7YO6akZ/mlVCk9ucplT0vLRTEiRMaYrwxlYmBhhfy/efpzUczWmfHasmZksJLXuekc5OZKgA123uPvR/5TZoogm9UEVQ2Oy20Rtlazp6g1a2mWbTu3mjDqIMEMBUhdgHHUOJ4laP4SbACHhV/OroOkCoIhY9xQMh0tqzwQiWhOptzaOYGaQdoMIBl3XJNz86rVai2o7+XkkaCUlKuErEGlxbJkz4khhyPzuBDKRuauT+15cG/WLElfReRInFDWrWswgJxH/hbaVRjOi54xWHJx73QlMgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 11:49:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 11:49:12 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 20:49:05 +0900
Message-Id: <DGI2BZM853AL.144XOQUNBZOZU@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Simona Vetter" <simona@ffwll.ch>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/7] gpu: nova-core: gsp: support large RPCs via
 continuation record
Content-Transfer-Encoding: quoted-printable
References: <20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com>
 <20260212-cmdq-continuation-v1-6-73079ded55e6@nvidia.com>
 <DGHWJ721IK47.2OJRIZJFIVVB5@nvidia.com>
 <DGHYQKWAKAWT.VK1MGFIOE6UI@nvidia.com>
In-Reply-To: <DGHYQKWAKAWT.VK1MGFIOE6UI@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0101.jpnprd01.prod.outlook.com
 (2603:1096:405:378::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6429:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a6bca39-f9b9-481b-2b99-08de6ee3bbdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVF2OWJkYTB4V1RaVmdKeTd1NU1UNnorcHc5aG5WeFRVand0L3pnZFViNmdm?=
 =?utf-8?B?aCtHYVllOTFPbFBMb3FITmF3bmF3OWRWSFFiUUF1dHFuczY4ZzRxdEw4bU8x?=
 =?utf-8?B?bVc1L2JZVWdZSUlJYU1NWE40djZBczZsR29CTlU2aUN3VHVXcXJYREJSRURZ?=
 =?utf-8?B?anBndHB2RE00K3czeUdESzBseU5QeVpuYlNYUTYzV3pDb3o2YTJveXJGRSti?=
 =?utf-8?B?cDBXdmNEcmJtdFlzQkU2MHJlRmIrSVQ5TlFkcDRVQTE3OGV0SjlYdzZ2Uk4x?=
 =?utf-8?B?MWVTaktWaE1IQm5SeDJPU29hVk1LckhHT0wrQXRMYnJhVDVwQnQ5ZzM0Zi9X?=
 =?utf-8?B?MVJEU09BaGRpWDJmUThIMVRBMXdGZUJ3ODU5dSt2YURGTVF4VWtyanVxRXoz?=
 =?utf-8?B?RytTdm9VN3kvVFpjQWZRb2dpOEEydzJySG1odlk5UlMwV2ZkWGxzK3ZhdDhH?=
 =?utf-8?B?eG5ucFozUUUyWkN1V1JHT2tIUFNLc25NRy85Rm4yS1c5NU1jeHJlSEdCeXJU?=
 =?utf-8?B?MmtvSzdiVmNnQU5TYTQ3dWJzOS9NY2lRSmQyUjRMelQ4QllieWFvemllSi9X?=
 =?utf-8?B?OEJKcktFTW41VllMY2w0ak1Na2VRQWxITURNVUZxZU1KQ0R2MG8xWEQ5Q0Vk?=
 =?utf-8?B?b250WTZ0VDRrc0c5MWY2U0w3V0YvUnJFZjR3a283QnNBZmNGS2o1bGtaOXd6?=
 =?utf-8?B?SjVpa3lzMVdwb2VLWVZJY05wSFlGK0VybElhWHBJQzZBTEp2YWM1WWNnRytj?=
 =?utf-8?B?cTV0emdsR3FnWTlrRkZlbnlMVzJ1eWxyUHZHc2E1OWllSTNEaWFwTS8reUU4?=
 =?utf-8?B?TkNzSTkyVXU0cXdZTm5sUm1HREQySVkrZnM4bW9JTmk5U2IrNjZPSEJzcENQ?=
 =?utf-8?B?UzF3S3I3ZWtWeHBHYnpDTG9Vcit1bG5xU1BKWnVWclIxMWxxVFpmeWRaQVpo?=
 =?utf-8?B?R3hNQythaVpHTVp6MDRMQk5qVVFCUjhlSy9jZEp1UUhXVkxrNmJHeEFLcjZn?=
 =?utf-8?B?eWk2bE4ycE9VQW5BNUI2RTladnlXK3pIaXJpMTF3V25lSDkyckxVOU1CWUt3?=
 =?utf-8?B?dEtENzhWdnhaNzQ3c0gyQVZld1luNWswV1lsVkZ3SkE3NUp5bUkxVmxrb1I5?=
 =?utf-8?B?RGJMUzRmdzNGOFdnVUNMSVZvL0IyRWU4QlpEblVpTkxweWlWMnJSR0pwc090?=
 =?utf-8?B?VnM0UC9xdGE5cVFhMmtjSjV5MzRTcUlnb3BzWFFEM3R3NitWbUk0bjV3T3ZC?=
 =?utf-8?B?N0c2ZWFNUm5jT1B5Uno1RnRhUFpBa3JGUUJCbjZSakFGRG1teGNTWlJxalFj?=
 =?utf-8?B?eXJOTitwNU00THo4QVcwZjRWS1ZXV1F0Nk93UXg4QjQ1R0xPeG4xUGhCREhC?=
 =?utf-8?B?by9WTUdKVnJQWk9qSHhMdWdxblViU0s4b3FHbGpReU4vd2lwUk5tc2lzRkxP?=
 =?utf-8?B?RGx5SmRqRGtrQWRkb1ZCWTZhYUVQMkpvRjlaLzM3enZuZHBjandsTm82bnJZ?=
 =?utf-8?B?VnExNG45aXBjbllXMFVLU0tocWVjd0haYlpwUkRGUkZIclNhc2E3VUFrbnVu?=
 =?utf-8?B?djk4LzdOYkoxODNVbUk3bWtwUTNkVXh6OWovaUw1bitEWVg1cFkvVTNkNUp1?=
 =?utf-8?B?bmIvTFpEVDhyc2ZyaGpvMmdNSmlpdi8vbEJKZWJqWXQ3YXZScmFUcXRKb2xx?=
 =?utf-8?B?OEFvQ1ErUFQwL1BMbmxqWnozb1NkdFlBZXRaaXRITE4rZEN0YmhHUlk4TnRS?=
 =?utf-8?B?b1pQTXluWUlVeUQ2OWpsc1BnM0grSmxkc2REOFZ2RUNlRHB3TktJeTRzLytv?=
 =?utf-8?B?ZFdidm5ITmxpRXNPa3dKV0ErS2tibURwWSsyK0ZmS1RHb1lHT3QyajJNbE1j?=
 =?utf-8?B?ZzNzTG56VDFLZXc2bkFaUHdmclhmVk1RR3lnK3N5YjA1TVJFS3JrYTBqUmw1?=
 =?utf-8?B?Ujd6MmV2cmVkemFkZUFUNkxtUGU4UDBCNmpWSDI4UUZqTXg1R0MrdWNDUTRG?=
 =?utf-8?B?anNPT2xrUG03Yy92QnFDOWcraVhwQ1RxRkdZWk9jZkRETTFZVDZqRkM1V1BC?=
 =?utf-8?B?KzhDcUNwUGtkZU03Q1pBKzN3V001ckRCRWFGOXNJU2lRLytNenBzNUVGR0pB?=
 =?utf-8?Q?fkag=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUlOdkFZWnpBNnRoMHFCZUkyODRMZkxXRUFLOFd1eFVGbWFFUUNwYTAzaCtK?=
 =?utf-8?B?SVFDdFV4ckdHSENmSWNsNlRBUytFVzVXMkIzTDUxUXlsUnJweW1pWkFqTGlj?=
 =?utf-8?B?TWZoVnFzZXIwRmllOERZZkVqUjJMZ2pYM2UrbkhIK0lxTkdHbG5KN29YY0tu?=
 =?utf-8?B?Vk0xY3dRQys3aWFVWjlZRi93dyszZE9hMnNXQWxXSi82M25rUm1rL3NYaGdI?=
 =?utf-8?B?Mkh4YXZTZnZrL3hxSThEZjdDVHpKazhRc0hVVkh0eUttanJ1TVE2eDQ0VlRM?=
 =?utf-8?B?OGhSZW4veiswT3lLVnVZUEVxUXpQV1FvdGtWdUN6K3QvM0tQVkV3L0VTa0wy?=
 =?utf-8?B?Z1pVUDRoUnorQm1Fajd2cVFrT3BqblBLRm5yNmw1QVFRa1Ztem9xSXEyckZz?=
 =?utf-8?B?N24xZjRXUkFIR0RVMDZWT05QdUpqMGtDOW5WSEo4YjVLWnRNMkdiM21qNkpt?=
 =?utf-8?B?QkdTMVE5T3BMc2VCYjlOU0JjZUxReWQ3NHhPRlRuSkdPZTF1cERBZi85WGRn?=
 =?utf-8?B?Y0hJVDVoSnBHUjRNWVVvak1CWnFqdW0vQjMvdHRPc2NBVTkwMDlWQ21jTkhK?=
 =?utf-8?B?aVduMUptR3VpRzJxbC83QkRFeWlhaGsySGMyVmpRUExDNnJ2eFZzSENWMmRU?=
 =?utf-8?B?WWZnYnJscTlJM2Y2cnR1VVgxVnpJSU5MUm4rVFVnclQyeEVuVk1ObzlWSHA1?=
 =?utf-8?B?bWVrY3FGaU5aSy9mMzg3RjRYUEhmdEZnK0QvYXRtSWt5eWhISTFudFgwZTM3?=
 =?utf-8?B?cU1weVJreGxLSVl6MXdIRDZuNHU0SGI4SS9yQXB3R0xCbGZVNnlIUjZzekZj?=
 =?utf-8?B?dnhzMGZQT3pkMkJQWE00TGdINVFaemZlY3ozeERENEhUWGtwd1k4TVNVaTRJ?=
 =?utf-8?B?T3VpOEM1QkdtbUVBeW9SangwZUdHWUJBdGk5aU40WTN1clhDK09IU2w1U0tZ?=
 =?utf-8?B?UnlKUWVpakhjeGhPbVN4aGRTdG1Cc3FobDBXcG9PbmtGbEhObE5ZRytPTGpP?=
 =?utf-8?B?NWRHU244b3V2eGNYemdiamtDS045amFhZENGcmZQTVlsS2ZjVWJyWkZSK0Ex?=
 =?utf-8?B?WXpNc2dGRzdiL1hKQ1hWZExuOXEwZEZ4SmVZN1RkSkFYTDNnd0VrMm41R1JM?=
 =?utf-8?B?SmY0a3dlTlh0OGl5TVBDeFZDbWtuZ2M5QVdBSWRRVDZ4U1U0c0MxSy9DVWNk?=
 =?utf-8?B?Mk0rOWVYandRN2N5ZjYvZ3J3aEJnd0RzTlJjdXNhMko3OEhhV1dQam9zM05r?=
 =?utf-8?B?T1Byb0pQUVlTK0J0RlYxN2JFWkkya0tvRklydGRzZmxUS29FM2V4SGpyVU1B?=
 =?utf-8?B?blpXT2JpL01NR0xMV0VKUUJtQlU0Tlp1QjQ5MzBtVUlFYkJxYVozQjdIQXhj?=
 =?utf-8?B?MStnYkdMQXN6cVJzbDJscEx0c2svQUozNXZzNnBkQUMzYnJiM0REclJoMEFq?=
 =?utf-8?B?YUl0QW92OXNlSi9WanR6dXRObitxeE5xdk50ekg5ZlNKc3lobGk0bGJSVTcy?=
 =?utf-8?B?WmNBZlhiaW9yK1I4UUZVRFpycS9oWmpSdnpOTlVuQ3JtZ2lRcm5ET1d3MVFY?=
 =?utf-8?B?UU5Qc1VObzMrSWFqcmIyRGk5R0wrbVVUcE5LUXlmM3FpK20vaHI3Y3NOa0xi?=
 =?utf-8?B?R1lHdVdhTWZDZWNHTVNscG1la2NuWTk4UG5BVXVpUUJZS05TU2xkRFpZS1hx?=
 =?utf-8?B?Y2FQb09ibUVPR2dxOXNHYlF0UkN4MWM1SlM3N2RYUDkyQmw4SDd0VDI2anV2?=
 =?utf-8?B?eThheWZiek91dyt2VUNKWjcxT3FFd2RKbDdIU1hzR1FSeTRFeEFNNFhYV0ZO?=
 =?utf-8?B?WndLYjNTRE5WWVpZTmt2U1VXejcrTmFKb2RVZ1N3V3JEdWdENWtQUXRNMlJt?=
 =?utf-8?B?OXNoWUlwRGlaRGIvSHA3eWRQeDdBNFJKOHkweVFZd2xocFNIRFJ4Q0FCUWpN?=
 =?utf-8?B?N0dWU2pSR2RWQXhwQ0NkTmNiZ3FYVUxhb3dLeXo0aU5KQklnM0J0RmxUZm5s?=
 =?utf-8?B?WGhNd3JSejVhUHl6bEpuN2xLeUF4T2RPRXZuMWx2cGhNWW83cW1IZHNYRHpR?=
 =?utf-8?B?bHBUR3lvOXB2aEIwcys4eUVoNW9kZWtISHlLblh4V0VlMXV4U21WbGM0NzlW?=
 =?utf-8?B?TndDemJzdm4zM1lkV2JGRGp6b0g0eEYyalY2U0dXMUpyQWttK0lPVjgzQnZk?=
 =?utf-8?B?Y1FSZWtnelI5T0dMNTNtNnFsMjN5WDRBdzA5T2hDRGFYbkJQeU5YeGhsNkVi?=
 =?utf-8?B?U0lxMGFmb0wxL09NWjJ6TDZBdHpqbXE3NDlNdGxkSVB1cW1EWDNpTWFaaHhF?=
 =?utf-8?B?QWt4QnN6S0s0Qmg0Z1Btcm9oQm9Hd0JFQ2xuSGtVNDF5VkhCVitoR1JLQUhQ?=
 =?utf-8?Q?dUlxQj1ybxfLlRtcxQghNgdN+zFeEP8Q4vpuy0zIESuCc?=
X-MS-Exchange-AntiSpam-MessageData-1: us3esVpB2NVybg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6bca39-f9b9-481b-2b99-08de6ee3bbdb
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 11:49:12.4000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iTbSbWx65PfTvjJfi6+wsOckNFkTxuycan09LX35wPOL0Yg74jq014RCLUUMonS6HY8OcByCbBmta7Ohes0tBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6429
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,self.data:url,nvidia.com:mid,Nvidia.com:dkim];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 63CD7156135
X-Rspamd-Action: no action

On Wed Feb 18, 2026 at 6:00 PM JST, Eliot Courtney wrote:
<snip>
>>> +
>>> +        self.send_single_command(bar, &wrapped)?;
>>> +
>>> +        while let Some(continuation) =3D wrapped.next_continuation_rec=
ord() {
>>> +            dev_dbg!(
>>> +                &self.dev,
>>> +                "GSP RPC: send continuation: size=3D0x{:x}\n",
>>> +                Self::command_size(&continuation),
>>> +            );
>>> +            self.send_continuation_record(bar, &continuation)?;
>>> +        }
>>
>> Btw, can we recover if a split message fails between two continuation
>> records? I suspect the GSP will notice that the next message is not the
>> expected continuation record and recover from there?
>
> IIUC neither openrm or nouveau can recover from a failure during sending
> continuation records. What failure mode do you see happening that we
> could recover from?

None in particular, I just want to confirm we have thought about it. If
OpenRM considers this a catastrophic failure, doing the same in Nova is
fair enough.

<snip>
>>> +
>>> +/// The `ContinuationRecord` command.
>>> +pub(crate) struct ContinuationRecord<'a> {
>>> +    data: &'a [u8],
>>> +}
>>> +
>>> +impl<'a> ContinuationRecord<'a> {
>>> +    /// Creates a new `ContinuationRecord` command with the given data=
.
>>> +    pub(crate) fn new(data: &'a [u8]) -> Self {
>>> +        Self { data }
>>> +    }
>>> +}
>>> +
>>> +impl<'a> CommandToGsp for ContinuationRecord<'a> {
>>> +    const FUNCTION: MsgFunction =3D MsgFunction::ContinuationRecord;
>>> +    type Command =3D Empty;
>>> +    type InitError =3D Infallible;
>>> +
>>> +    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
>>> +        Empty::init_zeroed()
>>> +    }
>>> +
>>> +    fn variable_payload_len(&self) -> usize {
>>> +        self.data.len()
>>> +    }
>>> +
>>> +    fn init_variable_payload(
>>> +        &self,
>>> +        dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
>>> +    ) -> Result {
>>> +        dst.write_all(self.data)
>>> +    }
>>> +}
>>> +
>>> +/// Wrapper that splits a command across continuation records if neede=
d.
>>> +pub(crate) struct WrappingCommand<C: CommandToGsp> {
>>> +    inner: C,
>>> +    offset: usize,
>>> +    max_size: usize,
>>> +    staging: KVVec<u8>,
>>
>> Since it is conditionally-used, `staging` should be an `Option` instead
>> of assuming an empty state means it is unused. But hold on, I think we
>> can do without any sort of conditional here.
>
> Yeah you are right. I had used empty here since it makes
> `next_continuation_record` here more consistent in that it doesn't need
> to check for None then for length anyway, but it's special casing in
> `init_variable_payload` in a very optiony way regardless.
>
> I reckon using Option we could put `offset` in there as well in a tuple,
> since if we want to use Option to avoid the special case of empty
> `staging`, we might as well use it to avoid having a conceptually
> useless `offset` field too.

All the more reason not to handle the non-continuation case in this
type. Let's keep it straightforward and responsible for only doing the
splitting of messages - if we indeed need another type to be able to
handle both cases, we can then compose one using an enum.

>
>>
>>> +}
>>
>> This deserves more doccomments, including on its members. But I would
>> also like to entertain a slightly different design.
>>
>> In this patch, `WrappingCommand` is always used, including for messages
>> that don't need to be truncated. While the overhead is arguably
>> negligible, this makes split messages pass as the norm, while they are a
>> very rare exception.
>>
>> Also `WrappingCommand` now becomes both a command and a provider of
>> other commands, which I find hard to wrap (haha) my head around, and
>> forces you to pass the command by reference in `send_single_command`
>> because you need to use it again afterwards. The name is also not very
>> descriptive (why does it wrap?). How about this instead:
>>
>> `send_command` is the central path that all commands take, so it is the
>> right place to check whether we need to use continuation records. If we
>> don't, then we just send the command as-is, as we do today.
>>
>> If we need to split, we do it through a private method of `Cmdq` that
>> consumes the command and returns a tuple `(SplitCommand<M>,
>> ContinuationRecords)`
>>
>> `SplitCommand<M>` can be a wrapper around the original command, but that
>> initializes the truncated part of its variable payload.
>>
>> `ContinuationRecords` implements `Iterator<Item =3D ContinuationRecord>`=
.
>> `ContinuationRecord` works mostly like your current version, except it
>> owns its data (yes, more allocations, but they're smaller so the
>> allocator might actually appreciate).
>
> Is it really the case that more, smaller allocations is better if we are
> using KVVec rather than KVec? It feels like it would have
> overhead/fragmentation to me. Eager to learn if this is wrong though

Ah, for some reason I read KVec here. KVVec is fine, and thinking about
it, we don't even need one allocation per continuation record: just one
for the main command, and one for the continuation records iterator
type, which the individual `ContinuationRecord`s can refer to using a
slice (basically, your current design).

>
>>
>> Since `SplitCommand` is only used when there is actually a split needed,
>> `staging` does not need an empty state anymore, and the code of each
>> type becomes simpler.
>>
>> By doing so, you also don't need to pass the command by reference in
>> `send_single_command` anymore.
>
> I considered putting the continuation record logic inside cmdq, but I
> feel it's nicer to keep it out of the core command queue logic as much
> as possible, because it feels a bit noisy to have in the cmdq which
> hopefully can just concentrate on sending messages, not how those
> messages get made or how/when they get split.

Fair enough. Are you suggesting that we use a new type instead of a
`Cmdq` function? If so, that looks good to me, it's basically turning
the tuple return value I suggested into its own type with a constructor.
That's arguably cleaner actually.

>
> I agree that it is a bit odd to have a command that also provides extra
> commands. By the way I considered doing an Iterator thing for
> WrappingCommand, but felt like it would introduce more complexity
> than it was worth and make it more confusing on the command that also
> produces commands front.

Ah, with the `ContinuationRecord`s borrowing from `self` it is difficult
to implement `Iterator` on `WrappingCommand` indeed. The current method
is fine, it's preferable to doing another copy and thankfully we don't
need the full power of iterators here.

>
> Another benefit to pulling the logic out of command queue is that it
> makes it a lot easier to test AFAICT. If we want to test the splitting,
> if the logic is a private method in the command queue that feels like it
> might end up more as an integration test.
>
> But if we just want to avoid having a command which also produces
> commands, what if we created a separate type to hold the split state /
> decision and it would return a SplitCommand plus either an iterator or
> the iterator-like `next_continuation_record`, while being testable
> separately. WDYT?

So basically, the simplified `SplitCommand` and its continuation
records, which we wrap into an enum holding the decision of whether the
command is split or not? That sounds fine.

I'd like to also keep the continuation records outside of
`SplitCommand`, as this will let us pass the commands by value to
`send_command`, which is a detail I like as it ensures we cannot send
the same command twice without explicitly cloning it before.
