Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE272CC0E32
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 05:27:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADA110E670;
	Tue, 16 Dec 2025 04:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jm7u+6tz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011030.outbound.protection.outlook.com [52.101.62.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4596C10E69F;
 Tue, 16 Dec 2025 04:27:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYABl1Ih1ruuNiXA2KUdH4jZnVDoZckcP3NhKoGHFHD+I7PwU9BHxYBtobW51Ryd9wqyhNdQlYv/UHVzT3e/q34uWkiNw4mH7dUxfPVGZQHE6+tfXcxrg6wFhZwXDWVYxsm9BqziELzDWIbyvo24eoIYOEqgvvQB9e6ULej2/9Q65oEzGQJDRGG0Av2GwKH5SFndeEFVrF2KCXQOZ+au4/I+xqKIo10wUEUvk0tTgB+rPlwzQl26v/O9WYw6TtqUBZJdN7kJD+5jn0y3hsrwXp239FqvEBpK59VHI5ZBOIYQxEDyanMgNoNyZmFPLEIAuoDVkFkA3UoIh6/7nOAnJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMxhFkxnluw2ekassvaNazMRqI9wmV8k2FcZ7a4rdmw=;
 b=aJPtmNd1Lgpk+2jmZ2i/vLu17atKlb2XLO+sK3htb9WANmQVAhXBIs9XqM9yOAMCa9V6YhlB07YgE3RfxENRD6LgjByBbRjuSi6SNrxg3bOIWw0S0NN0RIrykrkcTecHoKICEhSHS90oDid9xZftsGQ9uQeSEglpOWap7V2+abqb20Z/bqMJN7FEtC67ztVC7ly3fY0Tb91rcwSfj9ye9wVQIZu2MmSbQiekx2m2LXKE77rC2dP9EHhXmv2x2dhsBugysaUD7hRFZ3VnHstQFVjcv+35F3RB687daSfTOSmvtQxJ5lOQ+zMir0YiIZOdxZlS4I1FnbUAur6jbn5Kag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMxhFkxnluw2ekassvaNazMRqI9wmV8k2FcZ7a4rdmw=;
 b=jm7u+6tzA+sX5cVQXJRTeVCZOj8/uwsn1Di9jzZgVDJZ120lqALzPAWkrSZCy5m3ba/oiNJsoOwyz8/R8pKmYh19siqONrq+7TwMioAam/n5Qnqsnn8Uhv+yOI/jvDIiJws2wHVCQTTjon9wsnIGz8JiJ0HD3s7z2XhT7zZoViUfgKrezySt8TuOnbt5rodGPqXuzg9hLmZBpwfgdN1Ui+mj63515xNsk1OgkBOzYIDVNlrP1E4JU9Vp4esG28xS+SHEKKTMzpvGdRX1ZXdnT/BQQGXcJR2tuifoIlHFmG8ZeMSCWS5uksfOXAKXziXTLLOWatzbT6eXyPL6ElHX8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8754.namprd12.prod.outlook.com (2603:10b6:610:170::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 04:27:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 04:27:44 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 16 Dec 2025 13:27:25 +0900
Subject: [PATCH v2 05/10] gpu: nova-core: gsp: derive `Debug` on more
 sequencer types
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-nova-misc-v2-5-dc7b42586c04@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0111.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: bbbc6e90-f931-445b-8c07-08de3c5b756b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VS9WSC9CTmhPQnM2SE1YeTJET3lZVXNPdnVwOW93dHlueHlpd2J3dDhRSjJT?=
 =?utf-8?B?bjRnNitleUtWdFVyUUFhZjF5Y2xZLzE2ejc5TUZqMG83bUNLOFdPVXluc05y?=
 =?utf-8?B?RS9xVXFudHBiREhpeHoxemdpSG5zVGpTNDZVNmdtQ2tzOWwya2xrQms5TUtj?=
 =?utf-8?B?ZFFTejRtczhmQlhDcmI1cjZBNmhTWXU0VExiNkVyYkIxNjJkWjVtUThTWkpr?=
 =?utf-8?B?RFBEQjVFS1lTRnJxb2dvbFBBSC9PNmx2TDE3OHZyNStTeVJLR0Y5ckw3SFpu?=
 =?utf-8?B?UVo4MXV5S1BIbmYyOVlscHk3WDJDVUtKaVJ5RHFKSlVWZTBLdC9kdkVieGxz?=
 =?utf-8?B?QjBNeGQ5cVB5N3Q2SFlrTUswTGZQV2RsMHJjZHJCc3JROURXUW85cVRlVVk2?=
 =?utf-8?B?MjBORUgzL2dhaENlSE1NM2M5dUZTOVNKSzQ4cTFnOHgxcWZSM2xNQVBTQnRE?=
 =?utf-8?B?UFJqRkZ1aHRTeE1SQlBBcWI5ZlZKR0R4MnVQa3YzOWZ3akh2ZHdsenA2c044?=
 =?utf-8?B?bFA4UWR6WnhtODBML1d0aDBtOFl0dGpBVElQaEV1NmpCNTRCblM1eWZuc0Rm?=
 =?utf-8?B?MlZIdXB2enZaZmtTeEFKYVZHcC9oL3BGRDM0MHNicTArdmRnK0xRR0dLeGc2?=
 =?utf-8?B?cHZEcCtnUHBtQ3c2SkhIQ1V6K0E1TUhVR2NqMHpaUGZSWnFML05JU1R3WUpK?=
 =?utf-8?B?SG1jMTFFOEtTUEI0UC90cFNmWElCaUZkZ1UwTE0rYkhPUFFVRWVqZm1zelJ6?=
 =?utf-8?B?ZXFVTncvY1BMakRiZ1Y5Yy9wdlBtMTlaaGt3NEN6SWIzTkhoMWlGSHJDUmRw?=
 =?utf-8?B?Zi9TZ0FRcU8vb0lHM1pPbUhYWWdGa29EZ2J6MGVzL3ZOSXRBTXlkWnNka3F2?=
 =?utf-8?B?YlNKejZEaC9yMEdTNWRUOXJLNExmeVQ0RTFPcllqNnRQUHB6NzBCYUF0a1hz?=
 =?utf-8?B?STBYMTNJVjRNUUE3N3IzTkhNQUROVENwaGZYejJLb0k2cGdFNklNbldiK0xh?=
 =?utf-8?B?RlBWUGR1TmRFam9jMDNNQkQ5d1lsbWYxWnF5UFVZd3ptbWZIUFlqais0eVZW?=
 =?utf-8?B?Q2lORy8xNEdzdFc5enFyVVp2WVY1UzdpQUtlVktQYWhTN3dHYzFZcUlseVhl?=
 =?utf-8?B?NXJydCswaExSS29rKzBpb1R0NXFCdjJPWHRtT2xGZGcwYXdYTzJ3MEI0b1lO?=
 =?utf-8?B?QjhHVVZUUnozRHYxUUs4bElCS0Y2eDJWYUdvZXlKNlhIMlAzRDJEZ2dnYk9V?=
 =?utf-8?B?SmhaSGNMZnFZOGFONjV0TXBOdWRZOUFoUXNRZjl5Wk5uWHBxZ2E1VXR6RXE4?=
 =?utf-8?B?OXBUNU94ak54MExYbDdpMGN6b0tSbVFGdVVoUURveU5VRkFHZFBpNnFyY2Ji?=
 =?utf-8?B?V2hBNXZpY1IxUlVQeUFPNXQxZ3JHaURPdlc1MytCdTlnbThKVWpoc3BDUFN3?=
 =?utf-8?B?OXJ3a0Q0TVRDaHpTaldQSUNlaHRyekRWazZWUGl4RkpuMWlVOW1QMEdybW05?=
 =?utf-8?B?S1RHbTNpb0MyUzVKaC9haW5uV2sxRm5CLzIxcnhRS2x3QXRKY0FxVjdrMVR2?=
 =?utf-8?B?M3doNkRlbVJSMWpob3dsR0MvdGduSjhoYlJxWll1Z3YyWFBtUUNyWnc0NW1h?=
 =?utf-8?B?T01GbFNTRC9PN3ZlcmozU3E5eXM4YXNKREc0SmVCa3krN1kwS3JVQ2NwQU83?=
 =?utf-8?B?QmlFR21nTzdZVTNTdzFxL0dGRlQwNHRHdmw4NzA3MlJGczZMWHRyQ1doSmo5?=
 =?utf-8?B?M3pycVZ0L2pGS1RxVGxTVUc1OGFuakFNNGk0ZnU5Z3AwNGJKZFNtUE95Q24r?=
 =?utf-8?B?MHZjU0xhM0NFQWcrdVVlWlNNOVhsYVBmY2w2cGpkTUlBZ01YeXNreUNkamFh?=
 =?utf-8?B?Z0xxUE5SeTJ4cjlCWW5xNklObm9aaEl2MkxKbzdoSzYzbHVCeEt3Qm5PbDNZ?=
 =?utf-8?Q?kK8j11qhbDf71Gr7iU9ia9dXxg6gtXcl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0I4bGdZRXRuNEIrdFdIMjMxd25kdTduSUFQMy9TSDNEa3ZuZ25EbTlld0py?=
 =?utf-8?B?TVJJczZUNGpDS3ZuN3lTQ3krbitHSUwrNFNLVTJ5SjQ3ZzB0ZGJNZDU3UlJ0?=
 =?utf-8?B?UEJuenE0R05DbW1VK0ltdGxVb1Y0RC9keXRxVEpqQTZoTFV6TU5UdVAzS2VM?=
 =?utf-8?B?aFByU1lsclIyOTcyVk01SEw0VUdoVzVVQ0R1UXdOQ2tNcUhIaWt5MEZ3VzFN?=
 =?utf-8?B?TTlKRWlSU1VzMmloajVFdGJqWlpsNlE5ekJvU010bHlSVG80WWdmaWRiMVRZ?=
 =?utf-8?B?ekhLR2tXZXpzbFBaLzZsc1dDQzNEbDg3MnRCZFBZeUE4T05HblhiWjV4T2o5?=
 =?utf-8?B?ZURQZTl6eldMalRTTUJmdmdmdFdzc2xrYjlYeDdNNHFGR2dXOTc5WXBxRWpn?=
 =?utf-8?B?WkZkWjgxc2VtSHRUVTk3NWxwQ1VYL0k4RzYvUHNQQ0RZZGtpZlJiMWk1VFZW?=
 =?utf-8?B?TkFqKzdmSFZPUFQ4SUlRdTBSQitSOGJ3NXh3Rm5KMGQzRUFvdXVGRlR5djFl?=
 =?utf-8?B?aTY3enZxeTZueklLZHoydmQ1a0c1VjhYQXpwYlNReUx3Q3VtR201RGhBTTFP?=
 =?utf-8?B?Mkc1eW5OejZEVkZyUVVXZDZTa0dsQmY3NkRsVjdBeC9ZRVZBd2wvVlZ4SnBz?=
 =?utf-8?B?SnRVdC9JQ1BNZWwxbDZGSTJEZXRjZVE3ZEl5bFdqc0FLenJreWtCc0NxTkww?=
 =?utf-8?B?OThqNXBVNmMrT1pnNzYvUlI5Z1pEY1VDVzFyWDJjdU9hN2NMdXk4cU9FMlgx?=
 =?utf-8?B?NWlwa2dRa292WDFLT0I5Y1hlTG1VRTQ0dHk2WWpTRm1CTDBwRjA2QmpBWUI5?=
 =?utf-8?B?WjAzVVJvM1pZZ1gxNnlGV0lESE1CSDFLY1VoeE5NOEFISTFGVVhmNFZVd3Yw?=
 =?utf-8?B?ZWg2Y1d6QTVlMFZNWU91TFRqQnVYREdsVVlKRm1SOWlNMFBKTDE3bFhVRVI2?=
 =?utf-8?B?bnlwWU15cE9LRHdNUzZ2cFQ1RUwxalJkdWdYT0RUVnJQalI1bDlKK0hTR1JH?=
 =?utf-8?B?Qm90M0pmWE44YVA5SmJoZVdpdGE2RGNXY3NnR25DUzRBb1o1a3RaSDZHRkhE?=
 =?utf-8?B?cGdhUkZJM3N5SmxEblg0eGVkQ2RsdHhKMHliUW9TNHlwOTZ0ckdaUHREN2RE?=
 =?utf-8?B?SlJvZzVPL3lnWStkbGF4QTlNK0k4U3Q3YzhtbDVlYWVYVnB0QTdRR1NLRzJE?=
 =?utf-8?B?WVJTa0JEV2c4L3hkMkZtNVU1MGdqWVBqWWhVRDlORGphTWZ6OHRBNGRydnd2?=
 =?utf-8?B?Y1BJNlV1bFlJaUlYZHdMaFhTK1JqRUFrWjgxQ2ZnZTBjWVR0VmRhcngxcEll?=
 =?utf-8?B?R0Q3L0NrQUtrSkxQbEdpRkYyYmwyRTVtQzhaYm5qcGJlODUvVGlWMWRJZDhw?=
 =?utf-8?B?eU5FNy94em9hNjRsYm9WL29tWG1ScXFhMFJQbjlaeUsxdGtEVnluOE5NYUJC?=
 =?utf-8?B?SFBwTFowUXk4MEpSVCsxSUdrVlBtY2sxK1cvb0Mrc29BU0xkaEZZcTM5OUVu?=
 =?utf-8?B?WDFqTDZOKzhqMDh4bEIyczM0alJndHJNT3FGcC85SC9SMVUyRlcrd0lCVnph?=
 =?utf-8?B?WXllaU9oZWlaemZWWWNyVFM3RmdtVTZFQVlMdlRhY0RSZExFN0EzYmYvZEFC?=
 =?utf-8?B?MWkvSU9WZHVQTXA3V3R3dTlLQmdOYjFIN2l3NzFxeStGQ2JrRDVYRlQ5NVZI?=
 =?utf-8?B?MmJTVjQ5cEJGZ2hCWHdSeFluK1ljMkRxM0plNkdVZi90eE9YU3IwY3c5NEVE?=
 =?utf-8?B?Q3czc3RBcTIzQ2FoSkthQTlmMXFZWHkyd05IYjZIaUYzOXpiMmpYaFBqS1Q5?=
 =?utf-8?B?Yk1xbmlRYjRsQVI5aTg4QnI5aE9vTVZqRjhBK09IK1BNbzBUUngrNnhKUklH?=
 =?utf-8?B?MGl1RmNKV1NhRi9pcHRtSC96WGhKMWdHODMzamVHM0RSVlNoVzBQVFJjVDFw?=
 =?utf-8?B?cWZxa01JMEZzWUJBeFdYUnhOMVVhTW5jQTB4dFhhVlc5aEJTM1ZZTXU0ZGd0?=
 =?utf-8?B?dXZpd1FBS09WcUsvN3hqTEJsMzZXbmpQeTgwamtBUEVLRHNrNHdrOE1yMkJI?=
 =?utf-8?B?SnZLZkY5SEVHNnFXMS9oOWFzREFPaTdsYjNDZ3dsa0FpbUhSOVhHcjUzYks5?=
 =?utf-8?B?aHpJSlpxZUs0Y3Ruem1GY0FIS1pYT2h3Zmdwb2Q3bHR1aldVQ05ESmMxekZZ?=
 =?utf-8?Q?3b4u3vhaKwSd20tTo9QdqsfuHwUH2BvPd86ZRCURLa6f?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbbc6e90-f931-445b-8c07-08de3c5b756b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 04:27:44.4082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IgdidOrwMj62YXjZXnH8hGmuHSW3biOckrm5YSSSxIx2ePWhYC92HPBr/S7TgghLyldm61AUh9I/9V/MlagK6A==
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

Being able to print these is useful when debugging the sequencer.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs        | 10 +++++-----
 drivers/gpu/nova-core/gsp/sequencer.rs |  1 +
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 1b0fcbdc77ba..09549f7db52d 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -330,7 +330,7 @@ fn from(value: SeqBufOpcode) -> Self {
 
 /// Wrapper for GSP sequencer register write payload.
 #[repr(transparent)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Debug)]
 pub(crate) struct RegWritePayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_WRITE);
 
 impl RegWritePayload {
@@ -353,7 +353,7 @@ unsafe impl AsBytes for RegWritePayload {}
 
 /// Wrapper for GSP sequencer register modify payload.
 #[repr(transparent)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Debug)]
 pub(crate) struct RegModifyPayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY);
 
 impl RegModifyPayload {
@@ -381,7 +381,7 @@ unsafe impl AsBytes for RegModifyPayload {}
 
 /// Wrapper for GSP sequencer register poll payload.
 #[repr(transparent)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Debug)]
 pub(crate) struct RegPollPayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_POLL);
 
 impl RegPollPayload {
@@ -414,7 +414,7 @@ unsafe impl AsBytes for RegPollPayload {}
 
 /// Wrapper for GSP sequencer delay payload.
 #[repr(transparent)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Debug)]
 pub(crate) struct DelayUsPayload(bindings::GSP_SEQ_BUF_PAYLOAD_DELAY_US);
 
 impl DelayUsPayload {
@@ -432,7 +432,7 @@ unsafe impl AsBytes for DelayUsPayload {}
 
 /// Wrapper for GSP sequencer register store payload.
 #[repr(transparent)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Debug)]
 pub(crate) struct RegStorePayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_STORE);
 
 impl RegStorePayload {
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index 4efa048b9d93..5eead7ad4cbd 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -70,6 +70,7 @@ fn read(
 /// GSP Sequencer Command types with payload data.
 /// Commands have an opcode and an opcode-dependent struct.
 #[allow(clippy::enum_variant_names)]
+#[derive(Debug)]
 pub(crate) enum GspSeqCmd {
     RegWrite(fw::RegWritePayload),
     RegModify(fw::RegModifyPayload),

-- 
2.52.0

