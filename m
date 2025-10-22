Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA84BFB754
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 12:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E6710E077;
	Wed, 22 Oct 2025 10:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Jyy2ZiJM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012054.outbound.protection.outlook.com [52.101.48.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF2310E077;
 Wed, 22 Oct 2025 10:51:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2Y66ENqG4UPktYYOK7qkzmWGRA455s4YEJUkO4fg7WUm3Dz1BTyd4+6ududVwvCXA3Lu0luKJu4iBCoYsKw8fzyim3A3ciHSNBKJk/3cdDXSPPnA9+7gn+MKPiARDcYNg+qp5XOnPiztRPGpSnB4DfcrMtTvXkFlaIJru7nZDitbgS2IsjwQ+u0yQS1jiI+iGsjredoQd3T8QZS+klIVOGs/xqXz1pfFffIKyL9OZND0y7cTxya4svMRvLLxLQEmEpJA7hIVO5H5+Ez/9O0Vij3ps1cIIZgXL6Zu5PNu+T1r7QPEhvqTpm2yglZNH/9FR7H4VybXFBBQIgydO9bgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXN3DklzAuKxsSdANhhO6H572WSCTYC0VApC3EpFhbI=;
 b=izVBa1PdGu/ZLdUav1qX8RObsTZiO3oAYCaXEa0ZANmza6MJVVX4m7RiHIC4/TOig9WqEt50UG6UFfdS7PUSWpBGLw6FcuHIa5QfgyBKbBn8ewFzFBJNLbNDHNt+Tlz99U9cqSJB4532mkN9PDgqDPTx3F3/xMKvC+Yzko1P1fp4VnGH/7lGrZSpK7V7JB9aTBlOSFfw0G7ASzayxO+rT9XMOXFH6QSc1BmhfXxWfNmrbac8EJnfAEcHSiw3lTRHOBrnRS9g7Gv0qghpyUDWhdJZ8M5mC2DwCg6A+Ar+rjwvUuR+wR/W/9Ujva9DjVDF/Yqr0EQ71uzfjfIcDokSIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXN3DklzAuKxsSdANhhO6H572WSCTYC0VApC3EpFhbI=;
 b=Jyy2ZiJMAujZDyz4p4WLMIOlmWQmnvoMiUHaoyTR7ZvSaW7Oq7XXPDsv0Ghp4sD9wfxxX4gzMP6Iut3c7AF+DtkCluYLrgNMPMSHzzDrUUJtrHYk1W6CDiHuPIGyT2MuDMmkr3ihcqjCxpWfhMBagpo9wf6TXsnkY57skWwwsNKfXv6AbZcRpBj8oHNZ29dN03StDTAp5hYeuYB68MECbw333yA9FO0i2+IS9dV7+ylmAfPtIUIwSCSh91hHbu5XygQ0W2aBhLWa8N6oH0NnZK+cgVl/w23hSWqb3gMX8KcZSnPcoVDTAEo0YGOx8nGwlnrGh6KaeisD8umnvn9+hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB7917.namprd12.prod.outlook.com (2603:10b6:a03:4c7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 10:51:04 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 10:51:04 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 0/3] gpu: nova-core: various bitfield fixes
Date: Wed, 22 Oct 2025 19:50:55 +0900
Message-Id: <20251022-nova-bitfield-v1-0-73bc0988667b@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA+3+GgC/x3MQQqAIBBA0avErBN0UImuEi20xhoICw0JwrsnL
 d/i/xcyJaYMY/dCosKZz9ig+g6W3cWNBK/NgBKNkoginsUJz3dgOlaBg7YolbdGa2jNlSjw8/+
 mudYPH1z2U18AAAA=
X-Change-ID: 20251022-nova-bitfield-2846201b6544
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Edwin Peer <epeer@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0020.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: da287acd-b1db-4390-eaeb-08de1158e5a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDJvRjFXT1BCQXB3anFtV2Y0NFN0V0tndkZoSCtWYTR1cFZEUEIrMjBZSEpR?=
 =?utf-8?B?NjNHRFYwbGRTMU9VaDRhUm8waGgrQmtWbnhxdHV6N3g1SG1hZUpYWkthdXg2?=
 =?utf-8?B?MWNiS1VvV1RHMmc0VTE0aDRId1RZVkEzcnJzVHdEdm1CbFR3UkI0ODNIc3pq?=
 =?utf-8?B?ZHFaMDBHeHRGT3NPNTN1ZERSWjB1ZkwyRkRNdC9lTWRmYlB1WDY2MGx0cHlE?=
 =?utf-8?B?TGFjcHIvSVNDSkU1UjhpY2VsY0JvVVc3RWN0TXYwZ3FNMmp2bGZ3eC9CaDdl?=
 =?utf-8?B?alRaS2t4ZVBlR3ZsdXU0T0d0L2d0TEFSQTVDM3lpY1hIR3BiS2lYS2xGLzZY?=
 =?utf-8?B?WUxHZWx0b0VwNkZVVStLWTZOVmNsZVRoYkNtdzdtSFh2Y3RRQkRQbmQxQnpX?=
 =?utf-8?B?Z3ZicjZJV1Y0Nm1JUE1mcEZEZ1NVQ1NxSldtZ2tKZlZTODlSY2JET0tmT21y?=
 =?utf-8?B?VXVhSlh4UElxQTFmVHhVRXJ6OGFzR01uMW80RUhjWVhUSFN5dldtenUxeU9h?=
 =?utf-8?B?TlkyRTJQM3JpVmxSUFlQMlo2RkZub08wYy8rWlA1QUl0OVdxVlgxeithZ3pL?=
 =?utf-8?B?cFgwNkpvWkxRQ3VPcW1MVlp1SExGSkpYS09OVitkSzFpZkhUUHR5VkpUazVK?=
 =?utf-8?B?Qnh2cGpnd05EclVIUTdVNHEwRDB3YlNmUTZpY3JSTjZheTZwQ2JBVEFzRXgr?=
 =?utf-8?B?Q1NYU2NyMnNhR3RzZU81clViaHRUQUpqay9NR3RsaitTVHBsbDlJcitvUG1E?=
 =?utf-8?B?aDVFSGF6UjA1VGJJZDMzTHpGek4xdkdiK3BIbFF2S0FsdmJDSzNvZVZlbmsy?=
 =?utf-8?B?SkhXZmlkS2JiVFU3bGIybjg0MUZqbjA3TzlOcmw2NWJiUzVhMFlpQTVhanEx?=
 =?utf-8?B?YldCMGE3dXQ0eGx1V1NIQmV1Ymg2eXFBWmhudHg4clVKNWgvVEdmRGNhQzBx?=
 =?utf-8?B?MGJ5cUJsWlJRV1F5N2ZJOUFxeWtPZmNmdXdLaVY3M1RhZnNwbnE2Skg0Tk1k?=
 =?utf-8?B?NE5paktzVXVqdnBNQXRBVXhmT1dvWWpod1loVjcxdU4waCtMS1RROXJSZzNK?=
 =?utf-8?B?KzNjVWF1b0JoUHRIOVFnbGV6MDhBbGtBWW9Sb3pCMXRHalVjK2FPbTlUWUFk?=
 =?utf-8?B?V0R5NVYwY2xLbmM1MzA5V0xDS0lraHV4eWZhUlY5NktVOG1xb2dlYTIrUVFo?=
 =?utf-8?B?cFl0UzBSWlV3V2xYQkRzckUrNHA5cE9wQnFWUnc5QlR4Ukh4dzFKMnNiRk1S?=
 =?utf-8?B?enV6TjRxTjRHWitiWENKaTJFekZoVEZyeEFGTUV6SVBtQmk1UjhFYkV5NnRX?=
 =?utf-8?B?ZTU3dFN5b2RQNjVKbzJ6SG1KRHQrd3ZzNlpvSmJvclQ2VnlNZUtvSmJjR3ZN?=
 =?utf-8?B?UjEwc01pNDU0dmEveGorRU40Qk54bHdmQ0duNUJkSHF2SlNmZENQNTVYeTZz?=
 =?utf-8?B?M2hvSVBSVU5yRWJrZVBaRWlkb052Qnc5eXE3VFdqRjlCRkNFVjhoVkowbHFr?=
 =?utf-8?B?Nmw0cUtiS2d0RlNmaCtPbERyL00zTCtFaWthSzczbTJ6K0JxbVJLS3BGODhM?=
 =?utf-8?B?K2JnT3dnWkdKQzM5SWVVR25nZEpZWmxxdnE3N0lnMlM1NVNPWlY5Y1VVZEd4?=
 =?utf-8?B?cUExQXd6dkFCQUxVWFRuR3poSXViTDFjMXNkRFRvKzJRRFRJTkxLTGtQV1VO?=
 =?utf-8?B?S0xTVzdMcEtxMmNkV0wyMXpyNHdCQlBkOU83cFlWdk1ibTJaYnMvemxpT2Nt?=
 =?utf-8?B?UlEySis1a1NEa1EraURqZ1o1WitMZWZwNG1BdmV2UElaNHB6SnF5c2R2emhK?=
 =?utf-8?B?YUVjanErand3TVNDNWl4dnZidUxXN05xM09PdXVvVytwY0NGdEtDUXJJQ2di?=
 =?utf-8?B?K2RIcTRlSDB2S0RUbGV4OVIzOGZhR240NXRvcUc2QjlwV09SdjN4eFVQaWtP?=
 =?utf-8?B?bUZ5NFloeXhXTlpRV3BvNE1HWnFEMlVacUl0NXR4alQ0VC9wcFI2Wkx2MzNC?=
 =?utf-8?B?RkpjM3lJZjhBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkRSY2RrY0o3dDQ3QlhNVURzM3NtMWd0YVhGQ0pac2l1ZWcydkVjYlBVN0lv?=
 =?utf-8?B?czYrUUZiaDVNYysrRm0yWS80TWR0MEpJd2dLUWlVTEhpQ3NxNU1KVC9tQ1p5?=
 =?utf-8?B?YmUvUEpURUlZN0VPb0xxZ3BZVEpxdWkzMUp5Q0lGQ2dGVnBoRWczNExMYlFy?=
 =?utf-8?B?THNMSGtEK253Yi9IUWlTM0VXdW4wUlNYNElsVWF1SHJBclZyMDI4am9reG94?=
 =?utf-8?B?NW1ra2V3Nm9kTkdOR1pzbWpKdnRGcjBnVDZ1WExwZnNNRUM2WlcyZFd3OW9h?=
 =?utf-8?B?ajV3TDhyZ2tPNUt4Z2tRRVd0ZE1GR3NkTlhMUmpiY0xVaTVySVFKUWVGbE9j?=
 =?utf-8?B?Vm9Xc1gzMlBWMDZ1Y2tZMDY5ZkN2UUlQOU4wR3hqajZGb0QvN2xwVDgzakZ6?=
 =?utf-8?B?L3NUeEFVMktIOVR6N3BWSnVkSU5hY0tBdVN4M1FLaTNMQ0o2NkRHeUF5Wktq?=
 =?utf-8?B?YVNDRHJwc0djVVpvWmNUN2RiMnRZWExYeE5LREgwWHU4Y0FSUUlqdEtrd2VT?=
 =?utf-8?B?cHZwSkhXQXk3OERKVTN4UUxxRUlTNWlPOW1pYVZmWTlJUFdoc3RRWm4vUjBo?=
 =?utf-8?B?WWx1NHpyVE9GcUVSM05NcXZMbmZPeGZOeHNXUUpmWitXclZmcmJlMHJLWHdV?=
 =?utf-8?B?SWg4QWNFWnk1OVl6eXVaOUZFRnVONVJsY2l1QXFJZ1BnM2s5a1AvdlRJd2RE?=
 =?utf-8?B?K2pJZHduOWdLaFFab3Z2U3lGNEtQVXVISTN1OXh4RjRGWGNWTDYrbXhTMzNm?=
 =?utf-8?B?WlZQWXpCSndTWjRqOEdHN2d5TlpZbzFFdGZDMmczQi9OcWxrUUZIZDRkdGlH?=
 =?utf-8?B?cm1kaUw1Sk8zMWl6eXBDVTJZWlk0emhTUjArOFk1Q0tjQ2RVd2RrV1ZQVU5v?=
 =?utf-8?B?cWZ2SGMzdzhNZ0s4Qkc3WEg0Z0lqejREeHd2dXJQU2hpSHY0VUVWeTZ4VTVJ?=
 =?utf-8?B?QnJ1aTNiK1VNYVRCaWxwQU4weWVWNDQ0UVZVdTNZOVBUMnRXajgvUnFLS0dJ?=
 =?utf-8?B?WXF4TTNpQUt1ZHFoTVVvbEh0TUYxNmcxUVZ0enA4cS9JeGVab2ZCYVBBbXRl?=
 =?utf-8?B?MkF2czdoeTliRzFheHZuUUcxbUE5OGEydVZ2MDAvZ0xxekk4UGltRkVVQ1BG?=
 =?utf-8?B?OEk0VGpyNE91cXo3WXlkRVVrc05TSjVBbjNpdGNxRmpFMnNDK2lSTDRMMXNn?=
 =?utf-8?B?OVZ2SW90NW4rUUJiQ0p5c1lwamM2Rmw5MmRLNjIxMWN4NXRtK28xY0ZhRVdk?=
 =?utf-8?B?NXMvejM2VmMxSjRhdVN5dTdJcVZTYi9UTEVnR3hRYVVPc2UxNkk3YnNhT3VK?=
 =?utf-8?B?REtkRDlZNlcvODNaa205aUZWSTdhaXNrOWJLalB4S1hVUHNYSUF4K1BpRitz?=
 =?utf-8?B?NjRRQXUrTkRyTG1NdGUzdnBPUUJzbGdub0ZpcEVrK3hJWGxHd3ZTNG91UnNq?=
 =?utf-8?B?SExlZFNjQVhZVTliNFIwdVBqeGExaWNwUnAyNDFqelpBdzZqdnJRZk9Vc1RC?=
 =?utf-8?B?TzNpNEhKTjNSTHRjemNBT084VmJYdGdIWk43RE5uc1ZoZlFDRnRqQkllVHM3?=
 =?utf-8?B?ZUNlT3hkTGs3dW9welZ5Z09JNW9OaFRBMmwzNjBROGF2ZFNNV3NDYVV1ZDdO?=
 =?utf-8?B?R2dudllEWVprQnMzM3hjc1lRM2RCVWdmVDlGNko5eGJUdFlRVHZOVkZuOFJP?=
 =?utf-8?B?ck5aejdXdUg4T0dBQ0tlNlVLZTMrNCthaHJjZVFQR2c3VVpubGxJamlwcENa?=
 =?utf-8?B?TVIwOTVVYWp0VHhva1RsMUJQT29WZG02YlRGODI2YTBZb2FYWE9aUHlic2lS?=
 =?utf-8?B?SERMYlNMY0w4WHpNSlQwWGx3MXZDU0tyZCt5YVdoZFd4bGVqT003eS8zTDFS?=
 =?utf-8?B?ZjdCV0lRODkyZDAveUFwZDhVL0dQeGYwNkFnK0pOejhXa2dlRndYVXBWWXRs?=
 =?utf-8?B?TG5pQzVKNlBhYzMrN3RKTjA0STJ1RVNuL3NVcHYvdnRyN2RkNDRZa0NoemVv?=
 =?utf-8?B?T2lkZUs1cjI3a3Q1WWUzWUkvMzg5RHcrekhqOHQxRmZ5QUtTRUVlN0c0Z0c1?=
 =?utf-8?B?dVZpQ1Q3aFdUaFdsdlNSdk91VTNBMXB5L1dPN0c0VHFCTTltR1NncXAxRnpt?=
 =?utf-8?B?U0ozRHRFOFBPMFViaU5sTFM3WXBEby81eGRNM2YxaU1BVUtTZklCNHYyTjhG?=
 =?utf-8?Q?jc+T1z+da1wfjipW7582yhZihm0GVOe7kfw1SwY0Bn36?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da287acd-b1db-4390-eaeb-08de1158e5a9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 10:51:04.3689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8O9P1odrwhx24N0FrDdeMu3xct935homoexDVtuHyIXlNlpcJXKnR/VarYrgQ7WIPPPC9N+2ughffIUO3tEAXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7917
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

These trivial patches fix a few issues reported by Edwin in [1].

[1] https://lore.kernel.org/rust-for-linux/F3853912-2C1C-4F9B-89B0-3168689F35B3@nvidia.com/

To: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
To: Edwin Peer <epeer@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>
Cc: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Alexandre Courbot (3):
      gpu: nova-core: bitfield: simplify condition
      gpu: nova-core: bitfield: simplify expression
      gpu: nova-core: bitfield: remove BitOr implementation

 drivers/gpu/nova-core/bitfield.rs | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)
---
base-commit: 5ae65bdcb867555540169ef57876658262a67d87
change-id: 20251022-nova-bitfield-2846201b6544

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

