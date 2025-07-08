Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B4FAFC32C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 08:50:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F013910E589;
	Tue,  8 Jul 2025 06:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="C/pBLkXT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D11310E58F;
 Tue,  8 Jul 2025 06:50:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPW/Zitucdy6b5Y2xTJVZl1oRM9KzKuFwCjvQElPV6GNo/vrohgO3bJXPkaAksNLoIVUjN8up2W0tuTyXsau9Y5cB6KTPafgRJr8nNZJbDjmo5C0dfoTXUF7ial90uYcatG6siVcGc+TpFjCwlz5GxS6nFGIPi6Y5ARpcYaXKMU9RlB7RQrWDBVXlTMS2NzbwTwC4nEdofX5HI+OJhCLlavAEh4HO1sfF7WdC37CdhY19k3ttiExAHsjrzcAiGKHtMpk0tsK5Xb+KKqu0O7ogbziRHJkne03a0TbUEt1rZz+WfLBJTl54g476YBoN1ixf/t3Be0AfVCCtjyve2MLBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACPY9WLb9WKFfG1O/b5Vsl4HXn3NTdzL/5eYIz12QEw=;
 b=PEqYFSheakhlzYcozGxFBr1iJqxnS9BWI9vQTc0TI8RAq8/VAu8K/FXzfJd1yGz+UO8sP4dS8eDweEGIH7pXbz61n9AlQcW/tshkFjVcwVmX+jCy2ni6exuuVl9EOnZa6Lahdm3WiETzwbr+W8QZtDooJ0wC2rRcJM13B6DrWVKHy3+rWhHqK23dJs1B/8OnB/8ftfXu9shxJbHLmKW5MVv20s4rjE7J1o//XahgUPp4VqBSipWk1QFcwEPDYaHaYwtJ5jVafZ+AFzdneTOtpi3G51qIYHxGWAjjyNvsfB5oVfp1XVMRPmwCoIkabWjP7fjpzpC0VljmIvB1CMUjlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACPY9WLb9WKFfG1O/b5Vsl4HXn3NTdzL/5eYIz12QEw=;
 b=C/pBLkXTTSXe5GvhbXVSdRd+AxLylk//Fg8PZR6dTL1IuurT0OdzsSGfV0L5T/XDZn+u6/saMnVhOlqw13EtSO9JXCt0WY20MbFSuIVN+bHsHri2CUNJx8PgmltPxvcJZX+4fAV7zfxcOvpCYCt8CKFHyVwpQYJnRC8sG3UQRtN0HP8csW7J8QNZqw3dqna46RBEkOfuKupdqO/GcB1dMdZF8plSst6d3vu6IgA1tOoRU6p9A2UDb2fSikfwRRwUOznBBS3xQ37+sIKZMkwukZKi0OhCNFSqEO9QCqXF7GJNA+Pl9yZu41Y4cKfJx5jEDQXUwAKbxTHuFq+INkVySA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 8 Jul
 2025 06:50:01 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.021; Tue, 8 Jul 2025
 06:50:01 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 08 Jul 2025 15:49:43 +0900
Subject: [PATCH v4 3/8] gpu: nova-core: Clarify falcon code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-nova-docs-v4-3-9d188772c4c7@nvidia.com>
References: <20250708-nova-docs-v4-0-9d188772c4c7@nvidia.com>
In-Reply-To: <20250708-nova-docs-v4-0-9d188772c4c7@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0090.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 40aaf749-e526-4d9a-8ecc-08ddbdeba990
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3hxdHFxV3BmSlhiRjkyYm1YLzVOclBMK3BLWVpkY1JBVUwySEwveVlnM3Vo?=
 =?utf-8?B?ZHZuVEFUZjVQZkp6Z0F1MEdobGR4YTRwUEprUGgwVEIvZkFNTW1pRlZnQlJO?=
 =?utf-8?B?ZDJvajRqckNxdm55RTcrMHFzOUg3bS9MVTJPVTdtZVZ4V3Vwd2JGNHJRb3Rx?=
 =?utf-8?B?RHU0OHJUQWcxaHQxb3FZN2VVZFdrZWdLTzU5TCt6S3R3Y1llTS9hY1VBdmYz?=
 =?utf-8?B?WVRYalYrTUZadVBCYkFZNDMzQlh4RlV1UmJOMTl4aWk1R0ZWdEhPdjFremp5?=
 =?utf-8?B?WFljbTJ2bzhRdnRDczBoR2h1WmdGazBCY0ovSEt1L1JYNDYrcUdwQVBYdko1?=
 =?utf-8?B?bW5OM1VvYWNrNDlVWDBlaEtWQ3hPcWVCdnlIemxWUDNPVWRBNlZab0VzYmNP?=
 =?utf-8?B?ZjFlNk9ZWXQ0YnpUN0hoYzhTRmc4bm41SUZGbnBrOWN2ZGlldHgvN09xamQ3?=
 =?utf-8?B?Q3FrQXF5UE00bkhTajIxdW8zMHlER1RlQmFVclBSMmJaalRuSEFCWUxQclhV?=
 =?utf-8?B?SEJuZDdXZzN4Q0FGV3ZSSkFoY21Qd09LZEVmTndKNVFReWJVajA4QTJoaDBt?=
 =?utf-8?B?Q2EwWGIvTUR6YUphUHRURUxwTFljVE5mL201VUpTaUYrWU9PemFseGtqODFN?=
 =?utf-8?B?NnNkVjdodGFNQXAySGNWcmhha2kvc1ZMN3RPbENlTHRiUkVEeFQ5aXJZYVpl?=
 =?utf-8?B?SkcxSE16VnljK0NpSEJVdVk0eU5ERGF1S0pzQXd1OGtPQlZKM1YvYkE3WXZs?=
 =?utf-8?B?NnpzU2FJbEpjRDYyS055ZEQ2MFFuNWgySGNOK2RHYXpZb0Uvd24xYk80SndI?=
 =?utf-8?B?R0tCUUlIbXJDR1MvTDl0eE1JOUFGQmpUQnZJakRZeTFVMXJieFFLTUlKZkZa?=
 =?utf-8?B?U0tlTGx1cTliM1hKOWhtU0U0SXlPTVUyK1BsZlgxMXk2ZEdjOGpqemtoNXMy?=
 =?utf-8?B?WGFFZFk1OXM0UEdveUEwbjNnQmR6SkJFdTdlY1JRNy9Qa3NMbVJEZ2w3QUpt?=
 =?utf-8?B?VEMvSllydkJvc0RDT1FSY1lwTkw1b3lxQUNSQXJQMEQ2WElxWGQ3bW9oQ3ZL?=
 =?utf-8?B?eUUvR1FqYTdIQXc0azEwNVpNZ3NxZnFycXltVG1neFJjajBXNnFudXlRczhE?=
 =?utf-8?B?eXJTZWEvS2Jsdzl4YXhka3Jta0RkenV1Tm1sLzVjUzZwUXMvakl5cEZ1dEdR?=
 =?utf-8?B?STBpMTQ2L0dPcjlzTDhYTVpXVU5uWkt2U1Rka0lwQzhDSEhkblN2ei80dWFR?=
 =?utf-8?B?c2RnYnZ0MzVUOFdTZ3NWNjFjcnB3TkpNNlZFT3M4MmpkLzFIRDR3SndtYUw5?=
 =?utf-8?B?U01ndUZ4YlFKVWpTaitSM1JFYW8yU3hOTUdtdjZvdmdTcEo1bXRlWWRsc0RI?=
 =?utf-8?B?dmM5Z0gwVnp4c1RlTkZGYko1OFdRVHY0emYxeEsvZFdFN0M0ci9aa21uOUh5?=
 =?utf-8?B?VmF0T2gyMXVDd1BWNkNCWnNodFcyUmlLczRjVUdhbVNjR2wrV3lrczRkTWph?=
 =?utf-8?B?OFBQdFhwM1J4bkZRVXB1N0dUUlFYWk1jdFhDaFM5LzFIUmZHZkJycGE3VjdT?=
 =?utf-8?B?Tyszc0FFSzJ2b2daNFltV3pGOVM5Sit6QWFUODZEa0l6aVFIUVJmNEFuUC9w?=
 =?utf-8?B?aDN2YmZaZE1TUk81WVV1cStubEo2dTBoNXRjUWE1R3RyN29hdGtPV0c4aEZ4?=
 =?utf-8?B?bFVJOERXL3luZmt2S3prbktScHYydGxSQW9STVk4eWdteWhQYkJVMXI3VWYz?=
 =?utf-8?B?QXdkMzU1d3NpVW1GZ0dtQzhpbTE0Vmc4K0Z5Nmw1VXNTdDg3a1grVFhqQlYx?=
 =?utf-8?B?YmZDcGtDV0tWTTc5U3VRaXVobTIvMHhtQzd2bVk3UDUzWHRRWnlaZmp2Zjdt?=
 =?utf-8?B?ZmlORGlMR2FZY215TTR3d0JBeUlDMWI1Z2xKMlQ3MUdTaVR2M0o0dzNBY3ND?=
 =?utf-8?Q?islLmdo3fFA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGxMQTI0WklBMlc5V3M0aXBkQThqd0llTEk1WXRONmRvaEhuZWVnL2FoemZN?=
 =?utf-8?B?cktZb2hZZ2QyKzFxZUthUHZURWhmTGpEcXlzMS9RampmWUJQRzFOYmRLNnVi?=
 =?utf-8?B?UElzeisvdzJ1Rk5mSEQxTTNBbXFSOFhjM3VvRS9CRVBXRERnU1NVS25QcWtT?=
 =?utf-8?B?S29zeWk5WmtqVGJzODlrUDNnczd5R3RodVNnalZXcVlqUHlnSDY1Qld5NnJv?=
 =?utf-8?B?MDRqZStBcTVGcVJ6R0tqSmIwRHE3TG80L1Btcjd0UHRoR0pya2lRb1Jpc1Jx?=
 =?utf-8?B?aW5GVnZibENhT0FUQk11T2E5MkVxUkRNVy9kc2RIa3hOYitOOGlHL1dIbmc2?=
 =?utf-8?B?cEJHd25BNVhJNDFrZlRZaytmMlVySmpVV0Nhb1dEcUFUalRzVnB1dkxFZEFR?=
 =?utf-8?B?dHJlQW5iVXM3R0pyS2tvQytISlpsWm1CWmZTRERyRSttMEwwS2RxNW9ROEc0?=
 =?utf-8?B?Tk5ocmYwNEh5VnQ4a05xQ2hYdTJ3QjlRcmRqWkRzbnhwdXVEUUZXTUhzTElB?=
 =?utf-8?B?YnMzQWJlZUxOengzVXpFN3hmSWxrYWljaGpibUo4d2dpN1pzMXVGcG9yVVNr?=
 =?utf-8?B?amtOQ285Vjh6amdTOXJ3UGdEMjEwQUhpR3ByZGpUYUgzQ1h4YkN3TFE2L0pQ?=
 =?utf-8?B?UXFDblNLa0p1bmplVXQ3L1dKTDZvSWRZaTFSN2I0a01YdW1YVGJvK01uanJl?=
 =?utf-8?B?WTk2NG95Y3h1Y2pqNTJ4ekRReG9uUzBrT2pvWm4vcHZuS04vOEtXMUJJOGM0?=
 =?utf-8?B?SkQ3T0l1TmRuUXNCcTVoYjdKbUxHYUhPN0dvOWRYd0UzTTg2V1hKOHAySlRl?=
 =?utf-8?B?STJCR2E1RHUxTVRnVU1jOWVVVzEwbjhLNEVCazR4aG1pVUtSRy9aOTBycjRR?=
 =?utf-8?B?eG9pSktUUm9CYUIyRUFGRmFKcXVuSlZ2dUJEZzB2NXNvL3ZBYWRXTnhUdjdY?=
 =?utf-8?B?U3orRmROOVZBNlFad3Y2a0hEZjNsbmpuZE43Y2RBbnhBNG9tRnBnbGNHTUkw?=
 =?utf-8?B?eDBHUmxKblVKdFl2ejRCRlE3NlFybjBUMVBJOFBHeFc2RUpxNldjdFFkVHBQ?=
 =?utf-8?B?c1Q4Nm9PK3hTd2ZVYklRZW1hdUdaYlo5cS9qanNLZFMvTFZ0dFZoSlhOSWJs?=
 =?utf-8?B?M1FqM0JyOWVmSXYwQVYyTlZ2dkxmOEYzMVJML1VyNDA2SjFZSTVHQUU2Q0dP?=
 =?utf-8?B?Y1A1dG1XVEcwcTI5MVZGL2ZqWWsvREtFUHdneng1bWx4bDhERHo4bU1qQzdq?=
 =?utf-8?B?SFVHclVxaVhLUG5UQWcyeXZVQWthZ0hzakcrTmw5ODhFbzI1NjZVYk91ckdO?=
 =?utf-8?B?VXpxSzRmdHZxL2dNWUdESzR1OWFFd2xNSEJ4SURWSFBwTUN6WTE0U01jUHV6?=
 =?utf-8?B?STkzZSthSVlza20rbjJOZDYyU1dmRjFoUnBKMXp1eVJRR3RhZ3k5M3huamVH?=
 =?utf-8?B?MEpXSVlsaDhoMXdNQk1UUVNocHpwcklPRkRrbHNoVmVNRlFSY0kyOTNoLzlm?=
 =?utf-8?B?UVY2NjVYR2w2RDhnM1BMZ1hrSlM2YjArbVZseGdOOVowN0Rpd1NhQTE2Vytm?=
 =?utf-8?B?NmRENEZtb0xtSGFTaUJ4WFRFaUExZUZzMGdvZ2laY0I5VTJvU0JLYlB2V2w4?=
 =?utf-8?B?S0k2TjRkV1pPUHJEUDZIblgzNDRjMi9udkhyQnBDNnpCem5pYU1ROTBFbk94?=
 =?utf-8?B?MS9RWjBkT1NMeTBsTXludW9ydWlLM3g2eG53SlV0OHhhcDd1cEZPMUx5K3ho?=
 =?utf-8?B?a0NJd2xEenZJWE1nWEpLNU93OTkxN0RQOVpoOE8ramRmN0toZHRWaDBOa2hj?=
 =?utf-8?B?UFBvS2FGS1lNM3BjYktEeFVpWUtpSm52WnFYaGx1MFcxU3BXaGFpdENjOGQz?=
 =?utf-8?B?MDBNZS9SQ3BHMEtKTW5TLzZpMlIwV2ZlV204M1V3WDFTNGVNQk5rSHd2YVlM?=
 =?utf-8?B?UFZwcXROVmJISkxGbDVjdmo4dlJxaEUrNmJYS2Q5YkhUOVVYY0paeUdrSjRs?=
 =?utf-8?B?M1VFVkVFVlVlSzBSZHlXSWc5N0d2bWdGN0JnZjFjdld4c1dvSkhUU1JONXla?=
 =?utf-8?B?S25mYXVkd3UyYmJWL1JOTHJtOFI0UFNHZ2JJdlc5cWhyMWxDUm5oWlRBTnBO?=
 =?utf-8?B?RGZQaTdxQjFXdEFTcEFYUHJEMC8wZmtXaFNPVkpMNjVtTlBMRkRvbWhrT2NP?=
 =?utf-8?Q?4JEzYJUeszWtCT78wHT/rl0Hb9UQf8/gmUk4xqjPKZNw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40aaf749-e526-4d9a-8ecc-08ddbdeba990
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 06:50:01.7353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cOEv8XoLEW/rII1Ma7iypetHU1+qZtsG6rpMQXbWJ1o45PlGk9zKZputYZG+f6eb1osvAzXcqc7/F+b24gHekA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8412
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

From: Joel Fernandes <joelagnelf@nvidia.com>

Add documentation strings, comments and AES mode for completeness
to the Falcon signatures.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index c2c6f9eb380ab390befe5af1b3c5df260ccd7595..50437c67c14a89b6974a121d4408efbcdcb3fdd0 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -105,14 +105,23 @@ fn try_from(value: u8) -> Result<Self> {
 /// register.
 #[repr(u8)]
 #[derive(Debug, Default, Copy, Clone)]
+/// Security mode of the Falcon microprocessor.
+///
+/// See `falcon.rst` for more details.
 pub(crate) enum FalconSecurityModel {
     /// Non-Secure: runs unsigned code without privileges.
     #[default]
     None = 0,
-    /// Low-Secure: runs code with some privileges. Can only be entered from `Heavy` mode, which
-    /// will typically validate the LS code through some signature.
+    /// Light-Secured (LS): Runs signed code with some privileges.
+    /// Entry into this mode is only possible from 'Heavy-secure' mode, which verifies the code's
+    /// signature.
+    ///
+    /// Also known as Low-Secure, Privilege Level 2 or PL2.
     Light = 2,
-    /// High-Secure: runs signed code with full privileges. Signature is validated by boot ROM.
+    /// Heavy-Secured (HS): Runs signed code with full privileges.
+    /// The code's signature is verified by the Falcon Boot ROM (BROM).
+    ///
+    /// Also known as High-Secure, Privilege Level 3 or PL3.
     Heavy = 3,
 }
 impl_from_enum_to_u32!(FalconSecurityModel);
@@ -136,10 +145,13 @@ fn try_from(value: u8) -> Result<Self> {
 }
 
 /// Signing algorithm for a given firmware, used in the [`crate::regs::NV_PFALCON2_FALCON_MOD_SEL`]
-/// register.
+/// register. It is passed to the Falcon Boot ROM (BROM) as a parameter.
 #[repr(u8)]
 #[derive(Debug, Default, Copy, Clone, PartialEq, Eq)]
 pub(crate) enum FalconModSelAlgo {
+    /// AES.
+    #[expect(dead_code)]
+    Aes = 0,
     /// RSA3K.
     #[default]
     Rsa3k = 1,
@@ -209,15 +221,18 @@ pub(crate) enum FalconMem {
     Dmem,
 }
 
-/// Target/source of a DMA transfer to/from falcon memory.
+/// Defines the Framebuffer Interface (FBIF) aperture type.
+/// This determines the memory type for external memory access during a DMA transfer, which is
+/// performed by the Falcon's Framebuffer DMA (FBDMA) engine. See falcon.rst for more details.
 #[derive(Debug, Clone, Default)]
 pub(crate) enum FalconFbifTarget {
     /// VRAM.
     #[default]
+    /// Local Framebuffer (GPU's VRAM memory).
     LocalFb = 0,
-    /// Coherent system memory.
+    /// Coherent system memory (System DRAM).
     CoherentSysmem = 1,
-    /// Non-coherent system memory.
+    /// Non-coherent system memory (System DRAM).
     NoncoherentSysmem = 2,
 }
 impl_from_enum_to_u32!(FalconFbifTarget);

-- 
2.50.0

