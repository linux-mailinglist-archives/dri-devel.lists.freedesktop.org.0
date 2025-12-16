Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B062ECC0E26
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 05:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0781810E69A;
	Tue, 16 Dec 2025 04:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TMJO5uPe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012041.outbound.protection.outlook.com [40.107.209.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B4410E699;
 Tue, 16 Dec 2025 04:27:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWMuMfvR/kyWQdg2ejLxfblFQPvHR2cYwfcbdrbkinvSQD1VkQZW37CNwhWKAXrB/NM5RjjAnboI0JIVqlSyrIkYZDt3jqwyMISqp1h1KblprO4A+FRqudxWHB2gXh+weW3GEjBZRomcV0i1IEsJoTyEg6ast9OrjkUwmJ28myl4JSKOx9smMsz1J/2+5W+XhkK/hgw5HfGxXPtYhtIrpZZDz/mHRah4KqiAmCbOUaH9CqenkZYiVsA/nIquo0wcGsE/0JJL5FMO2e06ZLg6JWF00V+JnxzM4VgLEtXWAxdBQqOOW+xyhreygQoNpIZVMiVhSTHtAn5uw04ipZhS4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbPS1qOWsNVkwKaXmGpWkNEovpETxVLB51+i6hKnS3s=;
 b=KrHnPDfPCKsBD70rNkfyX+7CJxhNR0kBhdjGRy2t+fiKHd6zD6JuVcHXqfWGOrVcUex883N5Stq4WGUlTQJvt5seSd/QA98pYHb5lR5wshiOk3DBh0snrGN49k+qtyFBxODeHnqLZCez6bjsDEhaXy7dP4JFmQu/SoRvs81mYR9JdGwfsmvRpT+tvM9SwMuc1ylxZzjdFR4YqLKUAI/3PEpc2O3rHlYb5/o94PEJ92+g0tVYFd3YaRdy4O1gV6KHnQ9RCE5n9oDQYxVF1XfXDAIcFLokFhb98j6ZRrZ6ByQQKJKO7+OcenjwPZV1yiQ7Tufg8f5w3rFVcwNBesLWSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbPS1qOWsNVkwKaXmGpWkNEovpETxVLB51+i6hKnS3s=;
 b=TMJO5uPeS75YMICs9/pAmOZxQO/iQ/e4t5m3I8bdpyJwtFzBUKXdpvl9uaclcuHyrC+Tyhdd1Wq62QmPnnf0IXdMyKCNWCNQlQeT3SXaV1gp24RKyaAiIuHuGzohuZ3UmIJtrw6zNI0jYfC3hL7XIxD1cwVEAUnS9Kllz6C/4hbZccNqwAMNN6uZKEgTcFzMgNz5WI25eHyyrp7mgNkZi8qwPIMgQAFAuRM5HcWJzLFRD4yUk/Eo/cEatJguqqOMTEfqPkkhCmj6fWr14W3tYMS/sEEBG/RauG14a16AuW23oWmjtdYiql8IPpU5GcZM8M0WOepozYdrtHKBOXV4pA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8754.namprd12.prod.outlook.com (2603:10b6:610:170::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 04:27:37 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 04:27:37 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 16 Dec 2025 13:27:23 +0900
Subject: [PATCH v2 03/10] gpu: nova-core: gsp: simplify sequencer opcode
 parsing
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-nova-misc-v2-3-dc7b42586c04@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0343.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e746080-2f98-45d8-0a4d-08de3c5b7135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUF1QTNEMFFWUDBZYkdBSnp1UjNQaFhYeExhS2pKeTFQcUdWS3B3YW0vNGh6?=
 =?utf-8?B?YUxFbUwwVXRwYU1SYWhVR1VSWVhaQ3ZCVHFjb3B0S0ltcFVQVGczUGl5czds?=
 =?utf-8?B?eHM0OHFacUpwci95VlphZmZpMURVRVdvV3lVTkZqU1NBdHRrbHlLR2ZBVkRQ?=
 =?utf-8?B?aTZWREZhRHE2RXFBYU5mY1EyS3hKd1hrOENtNysxZ3NCMGkwWTNKZlpSZWgv?=
 =?utf-8?B?VUxGZWxxOFp4bkFkNXZaZUdNcS9HQVg1b2NwT2NEclJDVm8xeXFicGp3WWI2?=
 =?utf-8?B?ZDFYeUk0WWttcFN0OFRjYUNkdFBRUW9CWWladElpdldsS25yYkZCS2sxY0dp?=
 =?utf-8?B?M2tUbFNhS0tnSk5oSVJFRWtDTHNZRGVYMFhWdDg5N3NNYWl6Q2xuT0p1YVpL?=
 =?utf-8?B?U21Lai9nUHZPWGZnekVHZVUxRS9nOXN3ZzBDTEJkNFdsSTAzL1ZZem5Lbm5p?=
 =?utf-8?B?TWtIYzBHQ2RhcEJRSS9YZUZtRktLY09BT3V0UC9FR0JPSUlGb3k1Q3hyKytW?=
 =?utf-8?B?dDRTcGtCYWhpcW8xK1BYd21oRnpiYkZxd1VmSEZoZVZaT3NIZ012S1VtUXlM?=
 =?utf-8?B?ODl6WnliTmRCcGFGdzBaalQ2NUZpa09QRU1ZRUJtNVdGakZuazBiT0FiRnJY?=
 =?utf-8?B?ckwxOUF5dEdkZElSMm1aNnljUjB0SGdBWjhXa2hva21aVjhHT2tRMHlIVDlY?=
 =?utf-8?B?VUREcWJkNndtZ3RUUm82RWZuakgwZkhpVlpmU0l3ckhGN0NMM2pjNG5MdllR?=
 =?utf-8?B?WXErUU1rZm9WM1NWYlZQZUlwUjN0RjJ3ZDZsYUkyMTJUMmtCM3grZ0pHOVIx?=
 =?utf-8?B?YW5GWUFYb1BsMjhJYXRTbkJPdFZaRDJGMlNuT3p3ck1jNGh1TUhDRXYyNVlr?=
 =?utf-8?B?eC90a0E3UnRTYUpVTStXTXdsMWh4Y3dIaXVnaVcxNjFjeGRsa1dieTB6UUxj?=
 =?utf-8?B?d0ZNd1E5NVZEWmVrWGw2Tkc5VHZZMWlzUnQwSzZSb0xBYmtVRjBKT0hRMHQw?=
 =?utf-8?B?ZklPY2lCcS9mZHUrN1RuZWJaeU5lTTRUdnpkeFUyRVFnLysvQVBBZWc2Rmx2?=
 =?utf-8?B?ejVkYkhCcnFGMzREcmtEZVV5V0FDZXk2cU1EZzVzYVVWTHZRQ0VSM0Nwb1VG?=
 =?utf-8?B?cEtIaFN4Tnhaa2ZISUwzcXNWU3ZIQXFFUFVZYzZNd1lSVk5iZjh2dzJFNlFj?=
 =?utf-8?B?K3AxTzhiOUd1WGxISTJFei8wM0FNQTJ5dVJPblRyODYwNWdoOGZ4ZUhMZEtU?=
 =?utf-8?B?NWl5U2xEZ1psNG5SZExzdjROcmxCRTlEdDNaRmU0b3p6L1RLalBNTlM1S3JL?=
 =?utf-8?B?SHZDTUVERVoyeElRdm5KbERhUG0vOWJ6MnBPZGVhQ1hsUWhiY3IrMnp5WjNr?=
 =?utf-8?B?bVdSVFhTeUtOdGszRlZPeFJCVnBsUjFFa2ptWU82dXlIcjBEUnhkSmJ4Zmg0?=
 =?utf-8?B?blpmUlFoZzlQWXgrYXpHYWtkQVFDd0R3Q2puRWR1aUhIbFBsdmhMV2dieGdx?=
 =?utf-8?B?L1BJTVE3eGc4S2hqbGYxK3pwTk1VT1Avb3d1QXdHKzB6ejVKNkhTdmRvRlJT?=
 =?utf-8?B?K3ZJbDlqZDVCUTVldUdpM0FzcUE4ZmF4dENKQWtCN1E3SHljdFljR1dySXds?=
 =?utf-8?B?WFBiS29TMXl1N1R0eE5nRllsSW1UWWwxTXFEY1c2NFhJdTJvNkZjclpHZnRL?=
 =?utf-8?B?Sm1lNHRQM2EvSmExSzlCT2tUMmNFdUIxeG5qY1o3MnA3c1B6SUdoelZHTVlN?=
 =?utf-8?B?QVVnSlY5azJpU0RJa0JTaFZtUVNaeXg0dmRYcHcrK0FRRDl1cE92YjViRFdz?=
 =?utf-8?B?RUN5UVU3eEJSdlp4RlN6ZDcyUFRkTFJTc2JjUkVFa00zV2RRYVlLSDFNQ0lE?=
 =?utf-8?B?Q05JbzFsWFJvUkYvWENiQmlBVXlCc2pOYzdPREpxKzREblZoYVowK1dnM29t?=
 =?utf-8?Q?NF1LIg+zuMURKzN5Vr5L/ctIfCOBgfLs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RStwTk0wc1hIMkFabThDZVcxLzlIZG9yaWpnM1NSVERiZWdQN2RHVGhOenJC?=
 =?utf-8?B?ZndnR25wbGVEVGhzZVZMdU1JV2I2K0h2Y1c1d28wSnJ0blpTcUlDMUJXaGJG?=
 =?utf-8?B?LzQzdnd5aFVTU3FVeWdKZXpUc0FuUVVqaFRjcERweHJuY1UzamRxMnhHMGtL?=
 =?utf-8?B?N2czSkpSZyt2VkZ4amV3NXhLQ1AwTmwweUkzZ2RwUHQ3cEFQcXVaeWl3ckFJ?=
 =?utf-8?B?MzNlWm8zVDFzTXNZb0hRT3N6R056T01oNXBuSDZzUkU1MXFBUElzTnJPMFVK?=
 =?utf-8?B?NWVrRWtEcXlUUnZ2VW00Z0ZKTkhrOHg0Q24rWUJMQUQ3cUxGZnpQREVabnZ5?=
 =?utf-8?B?SHZiUlVKVkVZK015MUdzWW9xMjFMNmh2OEFlYUkwWmVmSG9VL3pQMW5MRWZR?=
 =?utf-8?B?OFcyNklPTVJoL1VNM0V1RUV0Ly9XVWdnOGpYUFJ4QlNwYnR5blB4dmdjMkMw?=
 =?utf-8?B?VElBdDBzN0prbGxTamRTWWdVR2wrWWN4UTZUMmEzRE1kZERHbEkvQXRQeVlo?=
 =?utf-8?B?QTBUTHJJTFBLL0pDWTNSM0p1WjJaZkxCOGlGNkVRV01qSFZmRmxSZi9WTHNK?=
 =?utf-8?B?MTZEeHdMdjFyOHlENWpKU0JGcktvNWd4RW92NXkwWS9zV2JZNmdpN1FHUVM2?=
 =?utf-8?B?NzQ5ZGF5ZlJzMkxaRitJQUpEUVV1Wm04WFJ6OTJ6WUI0NmU2SzZKQXpnZGNP?=
 =?utf-8?B?OXpLc2tRejJIKzZnOFJhR09ERk1kSEtoSDB2elV2ZmVaWG9VYTJvYXhWQXNQ?=
 =?utf-8?B?Wms3WWNRaW52UzBaYnF2TDFLa3pzaXdNT1BRRTVYd2MwK3hBTnlmNEgxbjZU?=
 =?utf-8?B?QjNUME5NeG1LK20wNzZrRFBkancrZkloRVVESndoNmNMWVVLRm4zK2hMMVJF?=
 =?utf-8?B?WjlRSzQyTUlzSVl3ZzEyTFNSdXJOZ2VZMVpueFhZSmUwWGtLaDBTUHViRW1k?=
 =?utf-8?B?YnhNNUdUVnArTGlqM0pkellkMU5QVW9vaVpFbW9qTTVpUlNEYnVrUWE1dVFS?=
 =?utf-8?B?SHpSS2NZRTkycWtEMXVrSmE2Wi82anV6c1ByaU5TSnJ1bkcvZ3VrbjhCcnhn?=
 =?utf-8?B?elNJTjJiRDhkVXI4WnAyTzIvM3V5MlFGN0RtQ0pKamNVRC83b3VuUDZKNWts?=
 =?utf-8?B?WWtuVFJ3Y1BqcmRFbFlpY1FLTnZYdDFhWjNUbzNJYkUyRW1GWjFFdHFzbDdt?=
 =?utf-8?B?OVM4MVRZb1d5QVowMS8vMkVnU2pLWEV5TDBsRzhPd1pFWDZ1MUgwZkQzbWd1?=
 =?utf-8?B?SXAzWXlSSnFvSWdDSTFWV2tURTZDS2pLblBiTnMxUEpaaXpZRm9HUjZFR1Ri?=
 =?utf-8?B?WCtWM3V6b1l2M0IwTFpuaVpyYWlROWRuYXRRVGlMZTFQVlhUSW1SOVRiaUly?=
 =?utf-8?B?V0ZaaFJ4SktFRkxkL3V4bUpBbkxJS095RGJKUlRKVEM0R0pxTXlzVkxXTkF4?=
 =?utf-8?B?eHlYbmhPbDBhZGJzTzJUc1UzeDdyMDZZQ09OK2QrZC9aK1pQcVRzb21aNzJ5?=
 =?utf-8?B?ZHRNbFlzRmNOdVZiL3dKcjJJMURsQ2E1S2pTUTNlVlpUU0JVbG5SZzV4Z3Ja?=
 =?utf-8?B?bnNUb0xqbGVHSlh2cjdrL3RGMTA1dWJTR0xpSk5TcVNWSVFaUk0wcC9vNGIv?=
 =?utf-8?B?aldycDYzVDFIOXRzbHRhazIvTTJWcHB5eko3emg3T1ArNStQb1Y3cFRlWVFq?=
 =?utf-8?B?ZUo4WEJ3RnVXN0FtbmJRRWIrOGlUTTZQbW9qWGRCK3BiMjlkWGJBbjlITkhP?=
 =?utf-8?B?cWNpSHlIMk1sWjMvcSttZXJ0V3F1M1lUYk1WK1F5QlFvSFBwalJYMERyR1N1?=
 =?utf-8?B?VjhNcjdLZjgvaXFwRDFwbHR4ZDBrcXR5TTVBTXZoYnl6VHV6NkRLd1lpRngz?=
 =?utf-8?B?ejUzdmFzSWpaK2FXSUdmVS9VMXUyVDR5bkVBM1o4ajhEYWd0eXo5QTF4ZlE5?=
 =?utf-8?B?MThhZU41TUdVRzlvUkM5a2RzUUZHZ0hxU3FNRlJCd3pLWDN1V0JOck5LcCtt?=
 =?utf-8?B?Wit1enRZWlFLMC9veHlrR1BUV2l6SERtNXR5L2c1VG9mRW5vSUQ5V0wvMHA3?=
 =?utf-8?B?dFducHo2RGpoQWRWQzhRTzN1b3ROZHR2S291RE93S3g4dHE0MWs0LzVTRGh0?=
 =?utf-8?B?VVh3ekxyNU1lbUVPeWU3V1pMaVNkT3ljZWpvQXdHbzFZQjJIaXJrdnJaaWxq?=
 =?utf-8?Q?FX+SYI+Ks45xl3nK9Ug/nf53PmT+fpUOFHGizLNbrEf9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e746080-2f98-45d8-0a4d-08de3c5b7135
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 04:27:37.3284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lh6WlZdW1OCSdu2eNZw5kIdiNaLP3PHY36osBgEzwqngK/5xxLVW7UbYnrFo/XdM/InZ8zoOgjbDfKIW/up1lg==
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

The opcodes are already the right type in the C union, so we can use
them directly instead of converting them to a byte stream and back again
using `FromBytes`.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 40 +++++-----------------------------------
 1 file changed, 5 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index de251a143f7b..1b0fcbdc77ba 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -472,13 +472,7 @@ pub(crate) fn reg_write_payload(&self) -> Result<RegWritePayload> {
             return Err(EINVAL);
         }
         // SAFETY: Opcode is verified to be `RegWrite`, so union contains valid `RegWritePayload`.
-        let payload_bytes = unsafe {
-            core::slice::from_raw_parts(
-                core::ptr::addr_of!(self.0.payload.regWrite).cast::<u8>(),
-                core::mem::size_of::<RegWritePayload>(),
-            )
-        };
-        Ok(*RegWritePayload::from_bytes(payload_bytes).ok_or(EINVAL)?)
+        Ok(RegWritePayload(unsafe { self.0.payload.regWrite }))
     }
 
     /// Returns the register modify payload by value.
@@ -489,13 +483,7 @@ pub(crate) fn reg_modify_payload(&self) -> Result<RegModifyPayload> {
             return Err(EINVAL);
         }
         // SAFETY: Opcode is verified to be `RegModify`, so union contains valid `RegModifyPayload`.
-        let payload_bytes = unsafe {
-            core::slice::from_raw_parts(
-                core::ptr::addr_of!(self.0.payload.regModify).cast::<u8>(),
-                core::mem::size_of::<RegModifyPayload>(),
-            )
-        };
-        Ok(*RegModifyPayload::from_bytes(payload_bytes).ok_or(EINVAL)?)
+        Ok(RegModifyPayload(unsafe { self.0.payload.regModify }))
     }
 
     /// Returns the register poll payload by value.
@@ -506,13 +494,7 @@ pub(crate) fn reg_poll_payload(&self) -> Result<RegPollPayload> {
             return Err(EINVAL);
         }
         // SAFETY: Opcode is verified to be `RegPoll`, so union contains valid `RegPollPayload`.
-        let payload_bytes = unsafe {
-            core::slice::from_raw_parts(
-                core::ptr::addr_of!(self.0.payload.regPoll).cast::<u8>(),
-                core::mem::size_of::<RegPollPayload>(),
-            )
-        };
-        Ok(*RegPollPayload::from_bytes(payload_bytes).ok_or(EINVAL)?)
+        Ok(RegPollPayload(unsafe { self.0.payload.regPoll }))
     }
 
     /// Returns the delay payload by value.
@@ -523,13 +505,7 @@ pub(crate) fn delay_us_payload(&self) -> Result<DelayUsPayload> {
             return Err(EINVAL);
         }
         // SAFETY: Opcode is verified to be `DelayUs`, so union contains valid `DelayUsPayload`.
-        let payload_bytes = unsafe {
-            core::slice::from_raw_parts(
-                core::ptr::addr_of!(self.0.payload.delayUs).cast::<u8>(),
-                core::mem::size_of::<DelayUsPayload>(),
-            )
-        };
-        Ok(*DelayUsPayload::from_bytes(payload_bytes).ok_or(EINVAL)?)
+        Ok(DelayUsPayload(unsafe { self.0.payload.delayUs }))
     }
 
     /// Returns the register store payload by value.
@@ -540,13 +516,7 @@ pub(crate) fn reg_store_payload(&self) -> Result<RegStorePayload> {
             return Err(EINVAL);
         }
         // SAFETY: Opcode is verified to be `RegStore`, so union contains valid `RegStorePayload`.
-        let payload_bytes = unsafe {
-            core::slice::from_raw_parts(
-                core::ptr::addr_of!(self.0.payload.regStore).cast::<u8>(),
-                core::mem::size_of::<RegStorePayload>(),
-            )
-        };
-        Ok(*RegStorePayload::from_bytes(payload_bytes).ok_or(EINVAL)?)
+        Ok(RegStorePayload(unsafe { self.0.payload.regStore }))
     }
 }
 

-- 
2.52.0

