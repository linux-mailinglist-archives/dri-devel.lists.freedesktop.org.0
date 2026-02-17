Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCA4A4jWk2l79AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 03:46:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E7A1488D7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 03:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCFA10E42E;
	Tue, 17 Feb 2026 02:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="k7lgCSvB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012053.outbound.protection.outlook.com
 [40.93.195.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D346610E42E;
 Tue, 17 Feb 2026 02:46:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DSSta9WcFx7ETmWkAKPv+4uJBZPVdiSSdXd3KR3CRh1ZbEnxY1Li2EV9rf1i/h6p0ebBiSxh2B6WjDR/DDd49Yvakchv/a7fIb3oWYAt8nIJsnZZjEHSetOdqeI/4a5X0gKqfgvFtrVPKOzrTNFvPanuLl7nXQXjxTT6/bLEvwfAuBgaZni0IO4germDzmvWCJQpe15nxYKBGy6AQ7Nk+r6LoHRuc5VreBy+alOsVEdmH0oeuJQiCZ50UDA6O1GRO2Q8hXH1MLzJWNjA+ainXTt/t4UX9NlxYIHPlObUhOx4OkgWe/Zuyumose+0wDpkZPCpsOMFTfWeWdhMrQsLRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/Y9PaoZ8Vpecjs3GN3ARpEx8h9R956WmXtaOf394/E=;
 b=fX0Z6R047LHB6ZMPhaCzDNYW6zVkU8X6HfIBDxXyjBlsGCfE8+Avzu/vSYEpBmCIC4+Ip3T/3b3wpKoI7IaSCSsR0TosfeVXVNBKsQvKiA5RH3wsZR2C9uxNeFF0SLevk/kxJlBES/nWh5+mJX8//6n/nDhyMqQAPfJtD9IPcsQ3WKBsr4G8uqVIKihlXQlv3zBdYeWqKiVZexYevS8oLHIxe1LATCagD3ylj8REpeVLg3SxJ5h0lNhMkzsWLcEGSIqH6j9rB4AQndWLFpUZM0MNiZcUZ7e4Y/4BHk1KKV4IoabuP5ttc8O/63HenOraiU3XqD8tkT04VSqaC2GTFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/Y9PaoZ8Vpecjs3GN3ARpEx8h9R956WmXtaOf394/E=;
 b=k7lgCSvBqpP2sj5zASOogGvu0W/Qh1FgUpkBhzVaaHo/7m0/eoPUuOz+e+0Suw22si/0pR/xceMoeBdXBha5bX8rGgcyeRxQWfSG61C1aiYBrsoS7OtQ9RQJ7tSyQCfwdf5y2BeEdX0QFY70qJn9DfzXjFaDtZc0FRvAXQjcO4iCbu/Z4lEgii8G/gVzSNxBz/kqsNX1NSh6g4edTxImNndY+kxqHxRZSiuWUHgb2GDSZjmywGqsTgnnYZlTjsk+uvzHmSoemq0XmO5yFy9WwZwzTFziaGQhrlzTub8sObH31QtNPKzHYsj39wFRLgwLJYcwPwK4XeUcAvxZWXKqbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB9476.namprd12.prod.outlook.com (2603:10b6:8:250::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 02:46:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 02:46:25 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 17 Feb 2026 11:45:56 +0900
Subject: [PATCH v3 8/8] gpu: nova-core: gsp: use available device reference
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-nova-misc-v3-8-b4e2d45eafbc@nvidia.com>
References: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
In-Reply-To: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>, Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0043.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB9476:EE_
X-MS-Office365-Filtering-Correlation-Id: 8778b99d-e1da-45c6-5cd2-08de6dcebe10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zlkzd3FuVkNpME96byszQlY4Vk9qcHlKeHBwSGVpNUxtR1p4bzZiTWFSaWNU?=
 =?utf-8?B?YkoxQWNlUEdLZTVxc2wrNm9SL2xHK2dVVHRZTTBUaFlubGRUNzlaV2p6bUtz?=
 =?utf-8?B?ckNjQnlPbVhkZCtzZ1dlbkFCUHVNZjArQ2VSbVZnMDVsa05VaWdlV1ZnbW96?=
 =?utf-8?B?TzZ5ZEUxdFdBRzV2UkZlR2M3bHFST3AyLzUyRTAxV0JhMldINmxJQ0toN05J?=
 =?utf-8?B?aXBLYS9WM3NrTmZGTHF4Y2JaM05Ndmx3bzFYYkNNUVhSTmpRQXd4aHBzbmNm?=
 =?utf-8?B?dGN6alppSzRzZVk0YVNRcGJFVmlWbGNzRm1wV0dsQkxIMEhIRWptaitzZTM4?=
 =?utf-8?B?cU5FUEJwR1JRQVdUeUpUQXNFYm9zSGhSbTZIekpjajQ4WTJwRll1RVR5Y1VL?=
 =?utf-8?B?dXdVTk1tSzJmRGgvd0ZoNHpUMXNESmVqWmlmUWdoalVLYVY1Y2tYa1Z4OUxO?=
 =?utf-8?B?dUVxOCtsOU05cTR1RVozV2Judmx1WFFNTjUybExTaDdwWXFzK1k5Z0ovVStk?=
 =?utf-8?B?Ymx5U0xqVGpWSjJLMWlVWkJXblZjdWNIQ2d0cnVEM3dIVU5DZ3FWdWJIOFVl?=
 =?utf-8?B?MUFHSTIreU5VbmY3Uktma0NpcE1BYjFvZDBiOVRmQkR1SnFaeUNBNUUrN1Fw?=
 =?utf-8?B?VHpZVWROdjErUmRpbk1pY09xTXhVNmZqeUpGYUw5MEpPTENlRWl6bzdyTXV0?=
 =?utf-8?B?WEhlN0xHQ21zWWo3UzJlU2s3M3F4NnhhR0dXZXVLQ1NvTk1SeWN1MG9lR3V5?=
 =?utf-8?B?eWU1WDYzbmxrS2hZYWM1aVluSjl0OHVrNngycFBNay9rdlQ0bFBQM2w3b3R3?=
 =?utf-8?B?WFU4N2lQcWg1UlhhVHVRRW15WFp0a3BKd2sxMU90cld0RE44NmZVMjJBckFo?=
 =?utf-8?B?WkNlaXQxOUtZa2pJT0FlYlJzcEpqRmkxaXlTdTRpcFdiSWYrUW9HUGNvMzJV?=
 =?utf-8?B?bHlVMzVjdjBDZFd2NVBDdm5kSGFjcFlIUlZmejlJTlJ6SUszRThOMytxaStD?=
 =?utf-8?B?SWFnVEtnd3d2RlRxckx2NFZZMnpGV0k5cHZ1QW1iVys5elpXSGY3ekh2WWNQ?=
 =?utf-8?B?c1hUUTdzUTRvWmQ4TzBUTXdsOEJ2MUlIMmtBaVU4YytPeWZnUEFqQnVzWjRw?=
 =?utf-8?B?bzBaNk1BL2wwNTJ3ZHRtbHRyRXd3RmVFeG5nc2ZYdjJzV2tTYWtpSVBEekxR?=
 =?utf-8?B?TnNOMmZMSlVuc3QxaDhFR2N2dWxmMDNaK2VNYWxKQ3YyU3hYdzZuaXZISG1W?=
 =?utf-8?B?Y0ZTVkFWWDFPRWczaUV3Q0t2TzNXdGcrV2N3L2RZME81c2d3Q3NrdW52bU5O?=
 =?utf-8?B?bTdEY0xuUTIyRkcwKzc2blNGK2ZUTHpuN0NnZjY2WFNhTm9yNjNXalZaK1dq?=
 =?utf-8?B?ei8yTklYU1VSVFFSaUFNTFoxUDV2N3lQb3NrY0krT1p4eUFzRSt4T09oVy9p?=
 =?utf-8?B?L3NpRTN1OFZ2OWQvUlBnZnVjbWlCT21GTk9SbGRWR0ltR0VpSlpPRWFPMTBI?=
 =?utf-8?B?MkNKUDNidVlzVkNybkRHNTg5NEY0MWo3SjM3OHRmN25tZklyYWJodXhvNitQ?=
 =?utf-8?B?ai9ZNktnQVVvcWFudVNreEM4TmJ6TGNuNUEydk9ubGFYRW11dE5NR0xXbElX?=
 =?utf-8?B?MUlBTFY4RUI1blpoR1dFcklLK3B6SFlkSS8vakVIbEhFOXpBc2VqNG1xeGpR?=
 =?utf-8?B?TkZGSUhrYUU4VkJZT1N0SUxOWDFKaXp5TWdTVzNmaDdOOUw2VHVlNXhMZ2FM?=
 =?utf-8?B?Y3g4ZlRRcjgzL3V2MnVKbzNaMncrK2ErWHlwcHdhSUg3eE5OZ3pJRzZYL3lL?=
 =?utf-8?B?a3FabDU1WjcrOWdyQnBZdktEMmxYL2p4bk52MlplOHpqUG1Fbm9WU0FDRVBZ?=
 =?utf-8?B?VWpPUW5nQmh2bS9wSFdManIvZWx1bFhTNFUzWVBQVkFSMDRMVmlBWWpZR24y?=
 =?utf-8?B?aEUzdVRnL0dla3VRbU11ZjRHa3FwZ0lybHlvM2VOSFhxSk5YSkVZUTlDNHVh?=
 =?utf-8?B?R3l1bm8wWnZHM3F2ZnJZS2NubDFjWmJRcXJSY3NmSlNYSGg5VlRoYitBWFlH?=
 =?utf-8?B?by9XVG9yMjFUSHl0SGdwbFdpZ1VKSUhsdkk5amhPRlVDOG5EODhQQzFJektT?=
 =?utf-8?Q?tqCI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVcwOE9hRGVqQXh4dDNEL2ZBbWdtTjQzU0J3UnBYTHRRK0Z3dzVTQWhZZ3ZV?=
 =?utf-8?B?M1F1NkJTNXB4Z0dmbXVaSnJGcTZEcGJ3THdiTlV4OWNSOU40RTBScUNMSGVs?=
 =?utf-8?B?d0s5ZkYxSGdxVWRLSG1uSFBIS0RZam1DNHZVLy9HZ3pFWVcxbE5NTGF5RHRL?=
 =?utf-8?B?cVN6VEliRkx3dS9IUE5TN1UyVU1mV25TeU1DUFBEN0NlV2RnTElOVlhzZmRa?=
 =?utf-8?B?UTRqV3J3bm9ZRGhNaUx0ZDJZcGd2ZzdQQWZ1bFZ3Si85RnFhTjN0MWpjaHd3?=
 =?utf-8?B?Q2FvaWxPZFUxendETks1VGhrWnoxd2xNOHF0TUQzS0NFYWMzcFBTeW0xVWR5?=
 =?utf-8?B?QTl5ZU9BMXZKT3JvcGxqNHBjT3R2WTY1dnFrVnNqWStZMVNOcTJxamlGTTdQ?=
 =?utf-8?B?cHZSWm9CY2FzZFpXNlgySXFOVHUwajZoZHNaVE5wbDdPd3hpVWtJWlpMYlNr?=
 =?utf-8?B?bWNycUhBdUtzM084dnVCUHVVbXNsTVJCUjdqTlkreDJZVmFNOTBJc25Wa3hn?=
 =?utf-8?B?Um5ydStJWndraCtvODlGYWg4OU15QlQ2Z0lhN1Q2WVhQdklXMWlCZVhnQmhH?=
 =?utf-8?B?eTgxUDdmKzFRbHRCOHU2SkZRcVVwQW9vT1JHTW1YRjRFNysrZkFnSTBTQzdW?=
 =?utf-8?B?L08yeUVQa3dOckU2Znl2Nk1WZDE2bG1kMFBXQ1VuRjlJdFlKRzdBQXpucnNX?=
 =?utf-8?B?K1JacXhzT3N1cEN6UG9jUXRZNVhkNjYwSWkwNS9hcHNjNlFwUEg2R04vc0JG?=
 =?utf-8?B?UWpla1BTTlk0enlJZVhZMEVyck8yMWYzZm03T3dIdUk3NFFaOWR6Rjl2c2lI?=
 =?utf-8?B?eTltbjFMMitIS2lUVWRQSW43T2p3T1RkYWY0aEg3NXZSbk1ER3Rua2phcFRl?=
 =?utf-8?B?SjdtTnVPRjYvRU5BTG9kc043R0MvenBwMEpEZElSWTFXOExtR2FLdmlERk9S?=
 =?utf-8?B?NUg4aGJuMWZOZkdKN2czOUlVSHlLSDdCWlcrN0E2ZnBqM2dkTm1hbE1JN2xa?=
 =?utf-8?B?Zk9naS9pZk9mMW8yYThKTCtQaVNBeXA5SGp2STF6WGgxZlhueVgvcnA0LzJz?=
 =?utf-8?B?MThPYzJmV2t6U1BhV0lKTEZJbzR5MUVTdzFYUmpVcm5MbzBqNG9LSnFWVERN?=
 =?utf-8?B?QVM5WGo1Z2JYQi95b1g0M1d6VmFwS3lKZzNOQkwwdnVyN3duNk0vZXkyczdw?=
 =?utf-8?B?UlljOTkwL0FrUUVkN3RHTnpnc1lwL0pjNEQrTnlqVUFwSVByWlB1dTJMOXlZ?=
 =?utf-8?B?T0EzWkNrd0x6VTZsZCtxSytGM1pFZ2J6anhwV3N2T3pXMWlUWk1KdTdiZVBD?=
 =?utf-8?B?VG1RcjF5a01RdHk2dVFWbDVxOWJCSEM3UUlYWkh0SEJCbDYwZ3EwWWFWOTAx?=
 =?utf-8?B?TE1HQUs1T3RLVE9QaU1IQ0FxZ2lpRTNaWkxGdE9ialRpS1VWRE1PYzV5R1g5?=
 =?utf-8?B?TFJsOXlzLzJFL3lVaXI3V0NFa21GUUJFTmdJcWhGUkJmajVuUjU4bmV5UVpQ?=
 =?utf-8?B?OWR2MkRNVlo3anFjeDNNUnVsNVhhMnc4dGtGYXg5eVlCbTFzUVNVbFYzTENC?=
 =?utf-8?B?dDUvQ1ZraXYxL3JvaldwelkyM2NpVjg1eTZGSlc0cTZFRVgrWDUwaVNxaS9w?=
 =?utf-8?B?ODNGbi9jQlJ2R3hJSHlsMk55QTgvY2tlelJKQURRcjBwWGVoNm80cTNDVWNh?=
 =?utf-8?B?UkFkbFZ6OENaRzMwdVFXOHVqSENKd1JrcUVYYlo3SDVkZHU0WUZLWXp5UHBz?=
 =?utf-8?B?dW1rNkVIa2hHeHFpK1BWUkF2ZlN5NmtQRE5rNmQ4VHB2cEV6RmlGVFhPU1p5?=
 =?utf-8?B?bkdjRVNpcUFXQ3o1WklFQ2k4alpRbXZiRWVDUnZucTJqMVNpU1J1eXFCRVFI?=
 =?utf-8?B?Y01KYklYa2hZWUtrMmxjWS9McHRUcjI3dWIzT3kvWis4MUNiUnV1dWtFZ1Nm?=
 =?utf-8?B?UDk0enlIaXhTUjlsR00rUE1PUHBNQWdBZCtGb2puYUJvZkxYYzVjVHZvTXEw?=
 =?utf-8?B?bHdpL1VKcFhlY0lJYlM4MTNqUTZZRHVJRThyY3VzSEwyUHFNQWFtcytvRE1s?=
 =?utf-8?B?TmhheXhyUFd0b250NnFidTNHMmNEL2d5RnZ5L3NWbzhJZ1BZSHdzQUd1ZFA3?=
 =?utf-8?B?cW8yZUFFYmN1alUwWlM1WVNwSW1MaXBjTzB0RzRaNEd3RGZvaFIvcm9ETG14?=
 =?utf-8?B?VEF4bW00aXFtcTllUjdHdHpwRVc1aVhVYUhKUGFMZFExaG5JcEwxcDVFdXpO?=
 =?utf-8?B?WVA4YURkTzBQaGV0dStIZ082LzNKZUNpa0g0Vm5BSmpOelRNbVhlZkJVSS84?=
 =?utf-8?B?eEQ4bzZoRENJN2J5Z21aV3R2Tk5tWUw3SWthUlRXNndub1IrdjhCdEVvOVd3?=
 =?utf-8?Q?5zhQR8dO3KEzmLYYszAzC3EM2MolEVWQXCxPRJis6wcAY?=
X-MS-Exchange-AntiSpam-MessageData-1: baZG9Mj3r9fFmw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8778b99d-e1da-45c6-5cd2-08de6dcebe10
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 02:46:25.3900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2myan4Th40UqwN0ySbsoxietzX/GsCQ+03K6plQ7h6L5dOHl53wqXCJRbbupsCqKFo/y7YLcsLmyCUXqyf6byg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9476
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
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: A7E7A1488D7
X-Rspamd-Action: no action

We already have a regular reference to the `Device`, so we don't need to
repeatedly acquire one in this method.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 34 ++++++++--------------------------
 1 file changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index be427fe26a58..93651243ab1b 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -170,15 +170,10 @@ pub(crate) fn boot(
             Some(libos_handle as u32),
             Some((libos_handle >> 32) as u32),
         )?;
-        dev_dbg!(
-            pdev.as_ref(),
-            "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
-            mbox0,
-            mbox1
-        );
+        dev_dbg!(dev, "GSP MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
 
         dev_dbg!(
-            pdev.as_ref(),
+            dev,
             "Using SEC2 to load and run the booter_load firmware...\n"
         );
 
@@ -190,19 +185,10 @@ pub(crate) fn boot(
             Some(wpr_handle as u32),
             Some((wpr_handle >> 32) as u32),
         )?;
-        dev_dbg!(
-            pdev.as_ref(),
-            "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n",
-            mbox0,
-            mbox1
-        );
+        dev_dbg!(dev, "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n", mbox0, mbox1);
 
         if mbox0 != 0 {
-            dev_err!(
-                pdev.as_ref(),
-                "Booter-load failed with error {:#x}\n",
-                mbox0
-            );
+            dev_err!(dev, "Booter-load failed with error {:#x}\n", mbox0);
             return Err(ENODEV);
         }
 
@@ -216,11 +202,7 @@ pub(crate) fn boot(
             Delta::from_secs(5),
         )?;
 
-        dev_dbg!(
-            pdev.as_ref(),
-            "RISC-V active? {}\n",
-            gsp_falcon.is_riscv_active(bar),
-        );
+        dev_dbg!(dev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(bar),);
 
         // Create and run the GSP sequencer.
         let seq_params = GspSequencerParams {
@@ -228,7 +210,7 @@ pub(crate) fn boot(
             libos_dma_handle: libos_handle,
             gsp_falcon,
             sec2_falcon,
-            dev: pdev.as_ref().into(),
+            dev: dev.into(),
             bar,
         };
         GspSequencer::run(&mut self.cmdq, seq_params)?;
@@ -239,8 +221,8 @@ pub(crate) fn boot(
         // Obtain and display basic GPU information.
         let info = commands::get_gsp_info(&mut self.cmdq, bar)?;
         match info.gpu_name() {
-            Ok(name) => dev_info!(pdev.as_ref(), "GPU name: {}\n", name),
-            Err(e) => dev_warn!(pdev.as_ref(), "GPU name unavailable: {:?}\n", e),
+            Ok(name) => dev_info!(dev, "GPU name: {}\n", name),
+            Err(e) => dev_warn!(dev, "GPU name unavailable: {:?}\n", e),
         }
 
         Ok(())

-- 
2.53.0

