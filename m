Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IK+GIp++c2mHyQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 19:31:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF3779ABA
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 19:31:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1F710E2E4;
	Fri, 23 Jan 2026 18:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="cwqwYqQQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU010.outbound.protection.outlook.com
 (mail-ukwestazon11022141.outbound.protection.outlook.com [52.101.101.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FCA10E2E4;
 Fri, 23 Jan 2026 18:31:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dyvx8f9TX11B3vFrGc2HRtd1ZT2wOEAWdGBBLi98oQgptZzO1LuWSW8/T5iiJNj/IaMBPKMkdm/gBmel2heCzlJQvKoNdOKbMphM/CZo6ZGDGmajuOd9+1ngHWd5JM96+yUojL+fsDBgscm4mrDZzs0kkLp/10n3EtRtkCP/GCAq51uciq7jK+usY1Pio3hPAQKd2NZx0kp3SZUv5FWuhLpNKsTPXEkgBG0UtYRtE2YTAjIktlzQ7oZ9gvtls4eY/yGzntUlIX+jDIdI715zLS20vTxAs21NfLeqOzRGqGbyWN3bvEVlp5M38+KS9g+dkCdMk/sWkrkvLp/OLHFypw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sQvIKsELnALbrKOmgl0/oYrB5G1UqsPAeFt+sORKBc=;
 b=IEmTAWd26uoWxmi1rYUqCzJtjlrrH7I2Fy9lZMNNKu55iMyT3UM3zWPHvzvEEbat+srTAnL/KuZBFxP8v6vy5C8hHaABuh4d7LwG8F186KmhNet17+XHnsGSf/8V7x/lQMeMw71xbYnlqXgGovg+h2N2RkHdfBBlGGPNAWovSGuvlftOuPeFjDbE9Do08kk3nbdeumUWFm66eZVqbdJquvATgDW3NYknMoEXQOo44886jyUeU7TKh00LkWCR+RI5/LA791k7u8+km69bZOFcOFNzBKYgMEEHg94b6v155vtWzSvTFIwiRgx8olns8Sv3TPZ0ZBjHIK7cMDFEaJd7dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sQvIKsELnALbrKOmgl0/oYrB5G1UqsPAeFt+sORKBc=;
 b=cwqwYqQQz1KhMwjtdQMtiQNEvLgOzvShia6qsXFvJRmBddsbPrU1cEaxFpxkZhHJY51kQAXEV574TyfZq/iGSB/wB/Fa+MEw1dwVsKm63TsLcK/XdpcDZ0wuH73KHo1qE5CMVw5UqG7o4fAgAg5o62a+/vcAmZYiG3xy0lNKsiY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB7326.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1fc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 18:31:22 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 18:31:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 18:31:21 +0000
Message-Id: <DFW6LTFCK75Y.1U7ZRPNHVVC2I@garyguo.net>
Cc: <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] gpu: nova-core: gsp: fix improper handling of empty
 slot in cmdq
From: "Gary Guo" <gary@garyguo.net>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260122-nova-core-cmdq1-v1-0-7f8fe4683f11@nvidia.com>
 <20260122-nova-core-cmdq1-v1-3-7f8fe4683f11@nvidia.com>
In-Reply-To: <20260122-nova-core-cmdq1-v1-3-7f8fe4683f11@nvidia.com>
X-ClientProxiedBy: LO4P123CA0128.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: eb52ccf0-2bdc-4809-47aa-08de5aad9ba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SS9IQjFZSXBWZ1gwd2FxOU5oMHNMVWp1NXlYMnJtNUZIckN4N3ZKMHlYU2lu?=
 =?utf-8?B?Z2plWWptVmFFS01pS0tjQnQ2ZEVKbTN1aFQ0SmFTUmxXQWFadkZnT0xUWU5K?=
 =?utf-8?B?Sy9NWGE0OXlWeVFzczEzeVRxYnY1dzBEV1VKRzRQVEd4eGhhQWZjaktFeTc2?=
 =?utf-8?B?TXNEZjRzbkhIa2tWRkV1WUpZbVRWYlpkUUJMblE4NXExbjFLcWFhQkppUXNS?=
 =?utf-8?B?MjQ1NElOVHNtMENER3hDSm9wS0xNL2NLbVdzU1JpcllkTVl0WFdTUGRGSitD?=
 =?utf-8?B?WXBOQ0dtRjluTG9LdXRwMVp2WDd2NU5sL1N2MEtnYTlxQk9WZXRqOU9valp4?=
 =?utf-8?B?bmhPZzg0OTErWENnYTI5cHJQQWx0OU9VOEFpdWlmR2RCNWlWejEzSmY4Z2NF?=
 =?utf-8?B?azdoaUFWaWFGdzFEOUpxVWlVdGtER2R5aS9UeEhsb2dhc1hZcXIwRHhCUy93?=
 =?utf-8?B?NHhaRG1nU3Zsb0xmVTRDajIvbkVHM0ZPZ1BjSWx2T2VUUUVFU0tSM2QzUXpJ?=
 =?utf-8?B?Y0t2aDMydy9FNnQ3ZEFvWmcrTElndHBTUTlVaUhVcmRmUzRmSUM1MXVmOU5y?=
 =?utf-8?B?bTFMY0VOdnVySG5oM01sSXlNZnhwUHg1M2djUXBDWng1eDJFRjc0K2VJWjRW?=
 =?utf-8?B?KytGZUFWQ3B4T1hjQXNObzQzMVNWeW9Lby9vNjVWSFh4Y256Zk9WZ0FkZmRI?=
 =?utf-8?B?TXZlKzIyOGx3KzNuNjFFVllQc05RRTVhU29wRHcxbmVQOXMydGczQVVKcUJW?=
 =?utf-8?B?czdUNlljT0E5dGt0QnRFTnZNVHQ1NVcxeDl0aXV5ZmUxeXAxdmpoN3Vpb0I5?=
 =?utf-8?B?ck5lOXBSN3hwaHVkc3gzcjkzcjlGZEc2RFdXNS9sTUczOTNSdXBGRUtSTk01?=
 =?utf-8?B?ajRWdng4OVhjWlQzbTFlRFBtM09QQzVUMFJnTVp4REFFNUovcXZsenROTE53?=
 =?utf-8?B?RUs5dGRLNjVBYmFqdVZqYXh6QTduZE9BbkVMOG1vMFIyTUdwdUlZTXlzYjNY?=
 =?utf-8?B?QzVlZDFFOEphQkN3c3NvbXZ6WkdOSnFHd3p5dUpEVDBMU29GNFhIc2pjTk12?=
 =?utf-8?B?NzR1djMzMlRuSm1DbE5yNVlRdjhUemE5TER1K0dCVzM0Qmp3R2tTTlFhMDZF?=
 =?utf-8?B?alQ5aFR3UVdvUWFjcjcvdVRDQ0F3ZzQyREE3R0hMZGE5ajVYQlVrVEpmWnNU?=
 =?utf-8?B?RG9LRkVaTm5MTzlKREVzZmNFRWVHS2lSWlAxTlRHa3FSSmI3SXFlTHI5OFBr?=
 =?utf-8?B?eDl5bHNXMGMxb0NvNVQ5WTBhK0xuQ2ZhR3ZpaTlRZlZUalZLUWtpRlVoYTNL?=
 =?utf-8?B?bWtyam15L3ROT1FkaExvSHdPYTZscGJtNEZoOVkybU1JeVFjbzRpVDNPdHR5?=
 =?utf-8?B?NnFVdUFJN2NTZklrdjZrVitkRWkxRk9acWpBQlQ0ODBEc1p6cEs3WFIxTHkv?=
 =?utf-8?B?MlJqRkY1TWNSOWE1dEsreFBWT2tqVG1PalBjNElQYVYrUTl3SUNVa0xqTk9h?=
 =?utf-8?B?NGFnaHhlWDl1L2U5b0VNWlVYWENzN015Njg5RVAxaEErNk1RTWNZTUE2NkMw?=
 =?utf-8?B?eDFwRXFIdGQzSkxOak5sdUJ3ei92VUc4ZjlDeXVnTzFncnJiZXkwU25vRjNT?=
 =?utf-8?B?MWZVNWpsQVpOemNUMDBvUG9MQm5WekRUaHlLa0UxRkFOUUJwYW0vcHVmSklI?=
 =?utf-8?B?N2ZFV01wZnRDVDZiK0k4bm9CVlFmZHZwMVRaTzg5dDBGUFlaV3FNd25rb1M3?=
 =?utf-8?B?RmFhalp3c0NiU0xmMjV3ak94UDFMb2Rhd2YzTFJlK0xVUlRuSXYrbVdXRGRx?=
 =?utf-8?B?Vi9scFRyN2FSQTM1VnMxaGIvbVVKcmlJYU5UenljMGk5dThCVElKc3RhZUdV?=
 =?utf-8?B?NFJGcmlIY0w0eWltb3ZnU0RLM2RnVlN5ZjBDdkxmWERlZ1ZNZGJleEROSWY2?=
 =?utf-8?B?bmpvZHBIMzNaMGp0NlYwOXIwSG5Td2twQTFkMnVLTU9aamRNSmlOdTloMmNn?=
 =?utf-8?B?b1ZyVzR6YnJ4SWJ4VnJwUW05ZWVDSGMyMDY1cy9NYTFITzlYT2FsMDdlSWtz?=
 =?utf-8?B?cEViRWRoU3VKeFVBaSt0R3ZhbFpUeGZtZTZNZmRwdFFTUUJ1bmYvVFR0YWNq?=
 =?utf-8?Q?h7gY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MURsdWc2MUJGK3RhSnFkUXljU29JZ2NEQ3djaWYxR1B0ZkIxRkJEY0pzNUpP?=
 =?utf-8?B?eVhHTVR4Nktzc0MrR1NmTzZ6VHBZdjdYaFA4NkFCeWtuQVNyZDZLUXczSU1x?=
 =?utf-8?B?aTI2ODA0cnRzYThSaTdFOWI4VGZLY3VXY0hYTmdhUmJXSU1WRXozTE90bGcy?=
 =?utf-8?B?Ui85L3FtREJwT0ZjclNDVHdpc2dBejlIM3FBK0NwWUU0QnR1RWhmeVJlU1hp?=
 =?utf-8?B?UmxIYjBGOUZaZlRsUTQ4cnNYOVpoNGpoQW42WTZFWmh2OElnNHU3cWtiQ1E1?=
 =?utf-8?B?UmVZOU1VQVJoQmlkWFdGOUNlVjI4UnpwVHRvUmJJK0VCTG5pRFZoZkJMWW9Q?=
 =?utf-8?B?OEFGNExhYmJLS3RNcnBUSXpaYU4waWRzV1oxYWV4UmowK29NWWd2ellPTVBh?=
 =?utf-8?B?Qm9BSFhnR3RmdC9KNEFpelBnbjByQkpocnE1MS9XQUFBaHoreG95c08yQXBu?=
 =?utf-8?B?YWhwVEhGZEQzSjJRc29peWdBTUsxVkxOTTlYNnZ4N1RERUd1Q2gxMmlmTnV3?=
 =?utf-8?B?TENBdEEvVTYzcWJybEdhNFNxS1hqZ0QwQ2g5cE5XWmUwTlRXcmdYK0NRZVpm?=
 =?utf-8?B?Wll1cEVMUEhselp6OEEybmlqVEFUbnpNTkdWZmNqVDFaWnlGaGE4SHozMVlw?=
 =?utf-8?B?UzlkSWxvNXRMREt2VDBZdXhML1ZqWGROdW4vSGNOaGxiVzNUUTBrUFh6WCsy?=
 =?utf-8?B?R2VzMDFUVWl4L01XYWc2MWdYTTdFbmNoQWVKTUFKZk9ZUGZldjlOSmV0VVI1?=
 =?utf-8?B?YlFXamtsTEFic0pEWjJyNnZLUENOMy9xREV1d1labXlPcDNTdEgrME1HOHRJ?=
 =?utf-8?B?VzA0YnQvVmI1dGlzcysvMjd1d2tvM0tTMDhxcUs2R2hIZ2RnSFFaQU1BSkNS?=
 =?utf-8?B?cXQydjQyeC9yeWNDNTFUTXBKU1JjV1pzNEF2SGp4eUNXdGFxamZIaklOdkM1?=
 =?utf-8?B?UGFwZXA0b3JLQW9xTFgwZE11eDJpa2tvR21wRHd6MGR3UUx6V3lMUVFlMGFz?=
 =?utf-8?B?R1Y2KzViSWwwY3BEbWVUYTNaM0d5UzJzcUFNQzRYUGNGR2wzNEVMTXZGYUJh?=
 =?utf-8?B?eTJZTGF4MEM0YzhDY2xDRHB0ZDl2ZGV4emJFcGpHcDVKQk1OeEpXRmJjTTQ1?=
 =?utf-8?B?Z3FCZit0QnNSNlMvQkFRUnJHS2owYnJxeGRDZE5DOTg0U0hBVUxvcGVETy91?=
 =?utf-8?B?eHZCQW9IaUQwVDh2T0c0eXplR2F2VVAxa09mMWs2UGd3eHU1dHQxOEJnUG1l?=
 =?utf-8?B?OWlTcnM3WWNUcldzc0ZRYU4xRDlHWFFJL0VMZUdqOThDb2pZUDBDQldLdnhr?=
 =?utf-8?B?dUVVWGhncjBTVVMyNzlYY28zNEZySlFzUGNKbGJVM3pjTEpmRlRUUTRtZnBj?=
 =?utf-8?B?ejBrRmpDbk91bVQvcndZQW1JZjU4c1NXVldRYndtVHVDSmJxbU9hWis2WURx?=
 =?utf-8?B?akdnM1pwZ2lxZEJqanJZU0J6WVNCeDNjdkJDcnNPZ3d0NWpjUFlpUUxwL0xW?=
 =?utf-8?B?a3F3NDFUbVM0RG5malhmU0hTL1A2Zk5XdFV2VmhXZWhpRGhwd2x2SGZyU1l1?=
 =?utf-8?B?M1VteXgwUmlXRFFvakxNdVNXV2UvMW8ySU0zMWF5VFNOVGp2ck10ZnRQeGha?=
 =?utf-8?B?eFprMWNwaWhhUTVwdEg4TWN4dWFTZXgzU3JhS3dxais4U3F4eVRhTEhoWGlR?=
 =?utf-8?B?UURzSVpvc3haLzJMbkgyb0t6ZjhHMmR2NTlSRGkrNVVJSHRIenBqUEx4Wld2?=
 =?utf-8?B?akZncWo1dGZTYWRPcnhVNXBSUElqZ0pKZWRsODFKMndpR29qZG5OR3ZmN0d0?=
 =?utf-8?B?aWpnTHArUmVsTmtxaS9ZVzZ3Zndvbjlad09hWjg1Z3hWWHI1QnIwSTNnNUMv?=
 =?utf-8?B?VjY2UzNJY2pESkFTVkh4MHAxcHBIbDNsWDdtYUUyN2FlV0dDdUJxaHlTcCtE?=
 =?utf-8?B?NldxVXV3Ykp1L1B0T0l1a3kvZ1JjSFNZUGR0K1A0K2QwbHNubFc1bTYrcmdY?=
 =?utf-8?B?UUNUUkNZVjhjR1hNUnZ1alovRmpydDJjaUVJY0pETzJpNXFJZ015czJCZXky?=
 =?utf-8?B?emtWLzBLcmxBYTdjSDhUaWJDbEMwZHl5djRFQXRsU01YMFpHMmVPSUJWNXRs?=
 =?utf-8?B?WEQzQnI3UDZrUkFvc3N4UzN0ekwyL1hNa3dMUlNJOUdQK05nakxrZnp3MzlZ?=
 =?utf-8?B?NUVNVkJqTjk3UFhSZThaN2VDb2o2T1pqa2ZPYzZOWmpvaXVoQmhHaFFxTlNy?=
 =?utf-8?B?NjN1bXVJWUw3aW5LR2ZPdlh6ZUxzSHNxVnNPVzc4RzRubDBtUi80TUxSRXY2?=
 =?utf-8?B?anlSSTE3d25TQUJES1FtdnBia0lUUHlVei9lME1KTk9NcW44RTE1UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: eb52ccf0-2bdc-4809-47aa-08de5aad9ba3
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 18:31:22.0785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZhopOzYMU4WibPzsxUlwk09sHNzy/jtl7rGy4bUtledomNYNJrzA5J8+ZPQCr0uu1TjSJeUyHN4LiqHjKA/NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7326
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
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:mid,garyguo.net:dkim,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DFF3779ABA
X-Rspamd-Action: no action

On Thu Jan 22, 2026 at 2:59 AM GMT, Eliot Courtney wrote:
> The current code hands out buffers that go all the way up to and
> including `rx - 1`, but we need to maintain an empty slot to prevent the
> ring buffer from wrapping around into having 'tx =3D=3D rx', which means
> empty.

Doesn't this mean that you're effectively wasting a slot? You can easily
implementing a ring buffer that allows you to disambiguate empty/full while
still using all slots.

A common approach is to only do modulo/masking operation before accessing t=
he
slot. Then `write_ptr.wrapping_sub(read_ptr)` will give you the accurate le=
ngth of
things inside the ring buffer.

Best,
Gary

>
> Also add more rigorous no-panic proofs.
>
> Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings=
 and handling")
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 09c28eeb6f12..b6d6093e3ac0 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -227,21 +227,24 @@ fn new(dev: &device::Device<device::Bound>) -> Resu=
lt<Self> {
>          // PANIC: per the invariant of `cpu_write_ptr`, `tx` is `< MSGQ_=
NUM_PAGES`.
>          let (before_tx, after_tx) =3D gsp_mem.cpuq.msgq.data.split_at_mu=
t(tx);
> =20
> -        if rx <=3D tx {
> -            // The area from `tx` up to the end of the ring, and from th=
e beginning of the ring up
> -            // to `rx`, minus one unit, belongs to the driver.
> -            if rx =3D=3D 0 {
> -                let last =3D after_tx.len() - 1;
> -                (&mut after_tx[..last], &mut before_tx[0..0])
> -            } else {
> -                (after_tx, &mut before_tx[..rx])
> -            }
> +        // The area starting at `tx` and ending at `rx - 2` modulo MSGQ_=
NUM_PAGES, inclusive,
> +        // belongs to the driver for writing.
> +        if rx =3D=3D 0 {
> +            // Since `rx` is zero, leave an empty slot at end of the buf=
fer.
> +            let last =3D after_tx.len() - 1;
> +            (&mut after_tx[..last], &mut before_tx[0..0])
> +        } else if rx > tx {
> +            // The area is contiguous and we leave an empty slot before =
`rx`.
> +            // PANIC: since `rx > tx` we have `rx - tx - 1 >=3D 0`
> +            // PANIC: since `tx < rx < MSGQ_NUM_PAGES && after_tx.len() =
=3D=3D MSGQ_NUM_PAGES - tx`:
> +            //   `rx - 1 <=3D MSGQ_NUM_PAGES` -> `rx - tx - 1 <=3D MSGQ_=
NUM_PAGES - tx`
> +            //   -> `rx - tx - 1 <=3D after_tx.len()`
> +            (&mut after_tx[..(rx - tx - 1)], &mut before_tx[0..0])
>          } else {
> -            // The area from `tx` to `rx`, minus one unit, belongs to th=
e driver.
> -            //
> -            // PANIC: per the invariants of `cpu_write_ptr` and `gsp_rea=
d_ptr`, `rx` and `tx` are
> -            // `<=3D MSGQ_NUM_PAGES`, and the test above ensured that `r=
x > tx`.
> -            (after_tx.split_at_mut(rx - tx).0, &mut before_tx[0..0])
> +            // The area is discontiguous and we leave an empty slot befo=
re `rx`.
> +            // PANIC: since `rx !=3D 0 && rx is unsigned` we have `rx - =
1 >=3D 0`
> +            // PANIC: since `rx <=3D tx && before_tx.len() =3D=3D tx` we=
 have `rx - 1 <=3D before_tx.len()`
> +            (after_tx, &mut before_tx[..(rx - 1)])
>          }
>      }
> =20

