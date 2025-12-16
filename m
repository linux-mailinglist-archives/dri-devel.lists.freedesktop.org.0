Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73801CC0E1A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 05:27:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF92710E68A;
	Tue, 16 Dec 2025 04:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="b2vDaO89";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010047.outbound.protection.outlook.com
 [52.101.193.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47C410E36C;
 Tue, 16 Dec 2025 04:27:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPBoQgELGximoe01qFSsvS6KBd1IW1s+D6dppD2oDi46KX/AdyYKDCNwCPIZ6/eHY7THBmekh7eEPbEjmQmQeU+jPoisk5aH5Qy9n3ohoPawycpfcGbQ2DhY2xtXHv1GROvx+88J1OTPXiXjkkWj0yIafJCqROIXn522TwlHI2vjxADnLAH0slM/WotHo+juozjBEYALDq4taqOZ7N/lIFKz7MsOec+2aL072ByL7EIxkVC9Xd+gpQHYOBVhkQVN6CS+63A6qWs7YZIHGaBGcc9mNsQ2MexNeo4Btu7sY/axGxwQEu31qoRZZCIa6qvzVDpi/G+KR/emV2Y/ibvwIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udhNcsqgzt3RqGKMHk58pJEPFIodrlH0V2zfYOFwIxM=;
 b=ABmZ0deM+3nspaTNaiQqNVqNz6vESTjbgpkYfbImcm1C1nhe+ka2WPO050sJfgXjWzEJkuH4ZtLFqy3ON4P6VI11uMF2KyiqOPITPsWs2UkHupxtAXq3c36lTIG9zwcOS9b2x3BPBNMND7kbr2uEiFUVljydOyPMpnek9M0VmYENbJXlb3yG1e0v6CqcMaG5cI+wa4wfF4J2OYcE7wN7IcLCvFVyQEq0LqEDhiKHp/VsEYPkOlawmaH5UAIW1KRvPa/Hl0Cn0J3paVXRRpM6dERVg0hAYZKw7v/UY1MYEL9+bmxWx5Wbjw2ILE/jSefCcDAiy2bSl5S73Gwn4sf2Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udhNcsqgzt3RqGKMHk58pJEPFIodrlH0V2zfYOFwIxM=;
 b=b2vDaO89QsZjby8j19HmgmIb4XShn/Zdo5xo0YlyipJcE0bXsQtddU/BJk+aD1JzSVYAERX61mpUEmJLtIqO+soZ1KIQ13JhR7bQadW05N0JNyUuVw9sL1LmYeBoI0obPMckRZKraSX4Y48jva+XMgQHQP0sZbN6u+Ek4qQ56eKmyrU0xo4B6orfCIYvH8RW983yAvJnxPlW3RajHc8ICaPqpHwbaS3nGCa5gZQUC5h+/4DkMO4yDwYAQkXy6m/sH0PO+K1nvwADqQnPb9X1J1KUTyuNZ9/3vEtXvsEW3Tci4Ihg7znsgFhuC8nfNlXVOqXnjujp/nuOqsnNjKxWGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8754.namprd12.prod.outlook.com (2603:10b6:610:170::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 04:27:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 04:27:30 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 16 Dec 2025 13:27:21 +0900
Subject: [PATCH v2 01/10] gpu: nova-core: gsp: warn if data remains after
 processing a message
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-nova-misc-v2-1-dc7b42586c04@nvidia.com>
References: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
In-Reply-To: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0182.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bda0bfc-a3d6-4ecb-6560-08de3c5b6d01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0JtQ05hSEw5SWZYNTUyaFJDdStheDQxaEZIRS8zYUFWS2NSbFlPQWJyNFZl?=
 =?utf-8?B?ajN3VFI3UGNlK0IzdmNXK1JLaGFaUmlrY1pDSEpGemZoOGpXOE1XN1ZDZ1FB?=
 =?utf-8?B?K1kvaUhFMkhTOWw0b3hhcTJya2FOTlFNV1lQMzI1eVlkbWZ3Szk1Rm1yZFFh?=
 =?utf-8?B?ZUd4N2tMa0dVc2xJRnNZL2ovZkJBS1E1dHNRdDRZTjlXeEpGUWhSZFR3WXY4?=
 =?utf-8?B?TU1iejBzbU5vNXpFcXloODhCQzVzRk1CcVZZVVl2YXI3ZTlsZlYxQkt2NFQx?=
 =?utf-8?B?cDJFNEVDZFF1SU5BWUcrM1dUakpFYS9wOEFXakIvenIwRXI5eERiOVFqeitV?=
 =?utf-8?B?OWk2OVFPRUp6NWtTYUNEbVhCR2tIcGNXQnB0dUFXYUF4YTVFWjdZY3Mwamh3?=
 =?utf-8?B?ZXg3K2FFd0RtMTVKUXRnYTBJdXZjd3BJa3Era2F6clBJeXN5U1gvMEIxWWhX?=
 =?utf-8?B?VTMwc3lldVVyejUvbkVYTE5ha1Z0UTdOVTVmMTF5anJqMEJUdEJWL3B5MlEv?=
 =?utf-8?B?R0trTCt6ekcvVzhLemV4SjF0TmNsUzRGM0poR0dBUzdvSkwvYWppcFpFa1pZ?=
 =?utf-8?B?cDRsWk8xUUNyK0xTdUNvTVlMdFN2eS9sdldvdlhaa3ROczZObjhKTitYd0ow?=
 =?utf-8?B?dUMzbExGTTAxRGtYMC9EMjJ4VlVNdG1mV0dnYXk2UDlKV2N0aGhsUWdZRjRz?=
 =?utf-8?B?UDZiQ0p6NTRBNjJFNm9PS0k4aFFvM0cwNytJSWdOZk9ObHY3NTNkdWEyOUUv?=
 =?utf-8?B?Y1g1RU5neUJPdk00ZDB6eHl0Z0g0Q2wrelhUUlo1bGFDYjdyRFVHRXJxaTla?=
 =?utf-8?B?RHl4cFdjVnVqR3l0dTk4MnMvaGl1V0hnSlgreDVQVmdNSStHVUtqakdzd3ZS?=
 =?utf-8?B?TS8rM0pBVGdNKzE4SlhsZjJWT0xzRTRvb1JsYkFiWEFRSTU5UjNQZk1SbFNQ?=
 =?utf-8?B?MnRNd2grYTlmYmp0ci9TTHZnN0FzbHd5T0xveC9YeDQrZFB6VkphWjZkbmxo?=
 =?utf-8?B?WExXdGdJVWR0TkI4aUcyZHoyMEU1YzNlaHRNVTN2a2ZyU2F4ckZlNUt3Q255?=
 =?utf-8?B?QkhPOUNoczV5UjlMcGlObXpiajBKWmVZcUFlR2Z1ZTFXUGgwZlZiZkZaV2dk?=
 =?utf-8?B?alBaeVppK0RNWEZ0NzNkajFlYUtVdHIrT0RvVDZ1UFNmeElFT0svMDQxL1Jy?=
 =?utf-8?B?bVdUTmxtWE9PdDVyUk5abEtRRVhPTDJtOERXQkNsTDJCN2hid0lHK3FYZlNT?=
 =?utf-8?B?UEg5ZWhHak96ckREbFNkcHFrcnE4OUhYSVRDNXNWTnY0MXFOL1NIbEVjQ0VX?=
 =?utf-8?B?WlBmYUMyNDBydFlGb29qY3JXMURNSXdLTFJlczZ2QkUxQ0lZYlJuTU9xdzNC?=
 =?utf-8?B?VWQ3SUxNR2xUNWZGTzFwQ0tObm9UNnZKUk5yTXNaUm1LbEdFOElPN0ZiQkJK?=
 =?utf-8?B?VmhoK291VVJoanVMdHRuNlpTd2l5NDFqcmZGZ2hDUUlEMG1UVERES2h6eWdN?=
 =?utf-8?B?Q25qcGY0YkFOQWNwVlpTMTNIeWNjQWtubU5KZWVvZXJmRXNBRjc1cVV3Q3JP?=
 =?utf-8?B?OEtwaU1jY2ZIQ2duVStlM1dPNUtwYURkUFdIbThyNno5Y2dTa0FpRkdHR1Rm?=
 =?utf-8?B?N1BvdnY5Rm9heVZ1dTJmYVUyNE1WeGZxZEYyMjBxQkVxbGZjSUVyTjZpQWxu?=
 =?utf-8?B?M1ZDZzA2L0dJc0ZHWDNyOHFoSWlkLzZ0a1lmR2lwK3lqZnBUQzF3a0Fkd1RG?=
 =?utf-8?B?QzZvNHBJQmVKTjdWU3YxZ21iVnE1Vit0WWVMc2ZKOXVLVVp4UWNUS2JxQzRn?=
 =?utf-8?B?WDhKb0VaUXN3VHViTEx0SEF1UUpZd1o4cytpKzFOd3Y5OEhMWHM3YThCNjNM?=
 =?utf-8?B?a2c1S3owc1lPZy9VRzVzV0Zldk9lWmFxNlFsUTBvSmZ5RTdkY2VVU0V2aCtF?=
 =?utf-8?Q?1BJweqQTAN5X4pED6Cq6t+ECyx5rVUOL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlM0eFdLaWw2OERHTUpDNVBtbGFDcmpPN042a2lQcHczVlhIckhCVDZIS2Q3?=
 =?utf-8?B?RkRoemJqTUJnSFB6Mm8vcG1YdnFZYmJjajFxMlNIdTk2UEFjVlBYbkpFd29s?=
 =?utf-8?B?YkhLVkRUZjZoV2xiZ2lZYmJ0RVVJNUdvSFZBUU5WelppK3Jpb0thOSs0SG1R?=
 =?utf-8?B?N204eVdwWTVMSXZjMzNubUtoRXg5MmpOMlpma3dRbWhBckdoUlh2eWluR25w?=
 =?utf-8?B?MHNqV1BuNUlTcEpYZTd0dVJrQTFEeW0zdjY0NHR0WlB3Zi8xMGRmYWFFZ29N?=
 =?utf-8?B?elh0WWt3NmZxdHYya2wyWmRDSGp4SmsyZXl6Q3h5Nk9CRk5LbTRVVlhkNjVW?=
 =?utf-8?B?TEE2eWVTRnlWVEFWeGxuNFk5dkt4QWJKNUhrdlZDL2JjYTBkZ2xkZHdUQXpq?=
 =?utf-8?B?MnVJV0dUWVBRNHp1eGppaTFMVjdlNlFxV002TlRDaVJ4cWNFN0FIdVhmRVFO?=
 =?utf-8?B?aUtzN294YXE0cHJFcERvOWJZRmJZZjc1TmFvNUNzRDBueXJMYzk0cWZNa042?=
 =?utf-8?B?RGp0eU85eXZYRUFZZEtuN0V5TGIvaUVKOWc5YlRSTVJLcjREY2xubXlWdFZx?=
 =?utf-8?B?c1VZeWNJVUNLenY1RzRSMlc0enlueWg4OWtNQ3FtZFhkaXJYdWxubXZKMjRT?=
 =?utf-8?B?Q3BlVWNlYWFzS1k1dk9CeVZaQlNXV0hsTldVT21IK3FaRThESitQSC8veUpS?=
 =?utf-8?B?OGYwL2puZ2lqT01mNGdTdE1UdGpiazQveWFDSThtcHdZaml3Yjc2RHVDS2Ix?=
 =?utf-8?B?akRXa2kvbGtYVU4vM2xwVUlXNWloSVkyRmRDbzZQc0pvdzBWRW5WbjlLR0Iz?=
 =?utf-8?B?UkQvQ0MxMWZoMEJJS3hJeFA1cElZZnNaenh5UWxjT0hQTHhuOW5uRGZEM0tt?=
 =?utf-8?B?U3FlemJLZ1UvU2lvYlNxUXdUNzBEaUtEY25PNzF5SWdhaTkxaTAzbm56WVRZ?=
 =?utf-8?B?TG5veFpXM09sMjUyekpqNnBWSnFIM3FMTFk4eG1jZ1pTL2pVTmU2SmFMWnlq?=
 =?utf-8?B?bkdjdmRKVUVKZWorWmRlcVVhb2pSOWcyNUlYL1ViZWh0TmVweWdlK3F5OStF?=
 =?utf-8?B?U0ZzQ1hadEgycTNoTEhZTzRramdWQmpHazA0Vi9tb3V2YzZYL0x0VFNuVDNs?=
 =?utf-8?B?c1ZFTE9Ia3JzbThJLy84SFkybUpJSVZCWERzdkgrT3FmbjBpVHVQTmhacmtz?=
 =?utf-8?B?VmxMMy81TDZMNFg4RERiSDFjYkJoZDVmZ3NsajJJVUpkZmpTSEFsM3FzT1VZ?=
 =?utf-8?B?OERuMklTRDFtS1hCUWdpUHJvc2hNM2g0STQ0dDJmbHJodHREQU52QU4vZzdl?=
 =?utf-8?B?eUZUeE9tbTFLbUpJNE0veVlwWmlLV3lGT1FGZ2dsVXdRK3lrU2hLNXlDVXFw?=
 =?utf-8?B?aDQvTDlxTzRIdTBIUkY0ajM1bmQ1dHhHU2NHSERvOTFXSmtseXFweFhzaHNM?=
 =?utf-8?B?OEYrbEZZaytJYk5SRFprayt1VllocmhFd0NZSjRMdnM5R0diNzNEZlRpQXBU?=
 =?utf-8?B?bi8vdUt4VEpNMXU3LzE3eFFjRzJlU2R0ZDQ3b1hGaklVNDJ0SCtJcGRUSFZN?=
 =?utf-8?B?K1RvZHlFWURncUdvZjFKQUs3RFdNMUJlWnl2RjhFL1ZTRnp1Zy90OWdUSFJS?=
 =?utf-8?B?UXI2RHJXR0U4cWI1dk1uREdhdzNnbThqYWFEdXF1akZXQ0xJL1N3VkpEWSt2?=
 =?utf-8?B?bzhVQzV6b3VVdkRoeHN3MXhMMEpWQkZ0VFE3SksxRmRqTUhyQW1TWWZWSy9q?=
 =?utf-8?B?Mjd1VHVobUIzd2JRWDd6Z2lWbE9HT3RWQnVVTXV1UkZReUpUN0drZ0lKbm1E?=
 =?utf-8?B?TUpiNUllYUlab1BoNXB2WHFndjl5YjJVZlBCbjA4b3psZmJZMXhlZDZjVkdE?=
 =?utf-8?B?cFdKc2ZTOEg2dXM2Q1F1RjVkMkZ4Nlk2eFpxMEFVdTNxa1puMjUrNjBMNTJu?=
 =?utf-8?B?clpRdENXVkw2YjdNZlVxUWhJZmlFeG1DLzJicXAzVnpKZEduSzJEa05jcmpJ?=
 =?utf-8?B?UDQrcjdhTE5vL0x5ckU0d2hYM0pkenNIOGtaNmdjdUZ0ajMvSVVrUWkzbDFl?=
 =?utf-8?B?QVN4MStrTmg4QUJFNDJ3Tmswa3dKa2tacjVJUEVoUFdUbjJGeEk3aHA3ZnNG?=
 =?utf-8?B?cXNQcUtoQjRDVFFvaXI0dG8rc3psZWtETW91ZjhTNmI2c29vdEJ3RkdkY0M1?=
 =?utf-8?Q?s6BsKRKw770P6gKSI+1DnsutkoeiKvF9GsV6iSYuIrL1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bda0bfc-a3d6-4ecb-6560-08de3c5b6d01
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 04:27:30.2898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uCP/P/tNyzV+2E9VVIkDLDyi4rdB7NuNLCbBGTsejgd+wt77rBWc4qVu4gwv3b1XJy8GavCYj1rZi66UXcJ3xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8754
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

Not processing the whole data from a received message is a strong
indicator of a bug - emit a warning when such cases are detected.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 7985a0b3f769..f0b7ac1ee759 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -661,7 +661,17 @@ pub(crate) fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Resul
             let (cmd, contents_1) = M::Message::from_bytes_prefix(message.contents.0).ok_or(EIO)?;
             let mut sbuffer = SBufferIter::new_reader([contents_1, message.contents.1]);
 
-            M::read(cmd, &mut sbuffer).map_err(|e| e.into())
+            let res = M::read(cmd, &mut sbuffer).map_err(|e| e.into());
+
+            if res.is_ok() && !sbuffer.is_empty() {
+                dev_warn!(
+                    &self.dev,
+                    "GSP message {:?} has unprocessed data\n",
+                    function
+                );
+            }
+
+            res
         } else {
             Err(ERANGE)
         };

-- 
2.52.0

