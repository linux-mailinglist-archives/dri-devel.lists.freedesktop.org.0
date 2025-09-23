Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A641B9621E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 16:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2D710E61E;
	Tue, 23 Sep 2025 14:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="u3azM1SZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010042.outbound.protection.outlook.com [52.101.56.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC5110E61B;
 Tue, 23 Sep 2025 14:03:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GDyXV5ILoJysE9EO8L0D2Xa+JYZWoxWq7igwjhJ/RPQ6tPKT5PjjCP15s+rqP0OWo4B6CGwFhk/6u4ANtA6OWhKt8owoVdMw3tz3907LtkpnY1UT15jKxNepzHzhLjRHLXFWEQRuXx4OAYUICSpH2pMv6fVKMv63qCSRhfPip/mYzlDPFqpc2h7DygctorX/JEcPmC7R5DlkMKGLuyvoWEGm+Sal/QKsTJX2LeiENMpg7NBWcZG+rYxKQ/mowNxgFEySCaU7YyYmng0X6WWq7HDyQQot61noRd/Hb1/BLkojc5qoosGV4lMxMzquy/d4rLV8DSgDrmVO81kHeDNLiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gauJWKa1I3azDk1PO53bnBhahSq3QP0m89O4ftMsw4U=;
 b=NQb6CUGNYB6IIXKMj3athhJ0nJdk+M5PMxUn5O7cktnsSp18oJK+3R25eeIv440w+Nzg6Do8JhcagUXK1P40MTC9blGSbJcGd0L/ipTAMlxn2V3D06N1lW3gXIy48dSzj4VWer+xtt8aHWg9rU1d9R06YYCZyrBMWBNVP/VA57hWO6FP5gxarML5uT1ca4i1wS1Qw7Ys85pJJZYZ/UhzCfDKE6W5W9UIxnZnRcAlgTkFu8ZowNxOJZ1t94UfrmEKHv765eBMsIKhnN54vh3nOdipz9UjyPbQQKGqHN5j2as2gyDmZXvX7GgxhlOVtKEc9XOIoP1vKEAifYQlwj8rhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gauJWKa1I3azDk1PO53bnBhahSq3QP0m89O4ftMsw4U=;
 b=u3azM1SZ/NNcRMb5en7ceCHKABf1Kf+FVl+Yt8lQoYwG+kCX74/JdVRQNIbhZ+MRsU8O1IEaweJEdOiOiHgMilctj0VJE5BubmIhlpSpgwbHIPkoKfsH7RxWpcebiIcF0sD0PGvuRrYU1nA7IIUa4QCctpi+4Y4/PhVtaJZ1uTY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by PH0PR12MB8151.namprd12.prod.outlook.com (2603:10b6:510:299::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 14:03:16 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%7]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 14:03:16 +0000
Message-ID: <da09dd49-0757-4477-876d-31eba6d515c8@amd.com>
Date: Tue, 23 Sep 2025 08:03:13 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 06/47] drm/colorop: Add 1D Curve subtype
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Xaver Hugl <xaver.hugl@gmail.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com,
 shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
 mdaenzer@redhat.com, aleixpol@kde.org, victoria@system76.com,
 daniel@ffwll.ch, uma.shankar@intel.com, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 mcanal@igalia.com, nfraprado@collabora.com,
 Daniel Stone <daniels@collabora.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-7-alex.hung@amd.com>
 <DC6I12RMKGXL.1L8KAEE0UBNNW@redhat.com>
 <CAFZQkGyXbD_x0V6KBdR4vaunF+bG+HKOYAA7y6aVWfeTQ3cLzA@mail.gmail.com>
 <4eef4157-cad5-4399-9bc9-c5c2f005d472@amd.com>
 <20250826120306.618c275f@eldfell>
 <610215a0-50ad-45b8-b60a-a52441619c73@amd.com>
 <20250918114036.454735e9@eldfell>
 <7abe9596-1d85-4b14-94ab-97bd4dfe0977@amd.com>
 <20250923105918.41f832c2@eldfell>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250923105918.41f832c2@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0246.namprd03.prod.outlook.com
 (2603:10b6:303:b4::11) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|PH0PR12MB8151:EE_
X-MS-Office365-Filtering-Correlation-Id: 044b0695-d6e8-488a-eba8-08ddfaa9f175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXVGQUhNSkVZcFZvV3orRzhMbWhtZDJ3TFp5TWUyemNKd3BjU0pEU0RRNW95?=
 =?utf-8?B?bU1CcWNlVzR6RWM4MzlVRHdKWHVneVFNb2tGSVNWWnBWbm9SWjJJcGVIWFFz?=
 =?utf-8?B?cGk1UW54WVJTQ2pPYXNtdXplTDZZd1gzSVhhVDJJSFpmRnRWUTduUlk1V2VX?=
 =?utf-8?B?K20rTENFdU1GZnpKeGFWajY4ejFaQ2pSQ29EMzBRM3k3RG9sRk5qMUVnRUV5?=
 =?utf-8?B?VDlMZ1dGeU9XVUY4NDNGemY5bzI5WXRRMkZGOTR1VkpnYWhXUnJDSEF5QkYr?=
 =?utf-8?B?NjJSK0cvSzl0K0g2OVpiUncrMUNxaU9XdHJBbkplU1lwKzFqRnIweFI5NzU5?=
 =?utf-8?B?ZEcydEJjeEs2eXFqeS9TRnFWUTBvREhtNUN3elF1UmN2aG1PeC9GMW9ndzQ5?=
 =?utf-8?B?NFNDNzJpNE5lTmQ4L1ZQcXNPVnZGNUhsekphK2lLTlNJVmNEZ3RjMjk3VkYz?=
 =?utf-8?B?NlE3TXlJSjdIbFgxRWRRbndYS1h4MVRJdVlycmpHbUpWZlJ6VEl6Sm5mSi9n?=
 =?utf-8?B?SDhjSUF6dFg5azJROFBTL0NabEJFMVJkblRDRC9XWlJ3cHlZU0NpWEQzemRs?=
 =?utf-8?B?T3F4QkFObkgxZElueE9VZG1oSytUNjN3L250T0xWb1dzVDdCUUpIMi9zUVBX?=
 =?utf-8?B?MHplcWRvalYxbWtablEzcjE3UDFBdFhtejRJUWxFYXZENURWMTFKTWFVR1lo?=
 =?utf-8?B?dGJVWTU3bDRmZ0JUWUdLNThOeDdyOWNUQXdKYnc5MFl5NFRiaHVXczYzc1Z0?=
 =?utf-8?B?QUIrRUcxeC9XbXEvYmIyNWlKN1ZyNHZQNTRMZVlGa1BsVmp2MGhTZ1Q5UlQx?=
 =?utf-8?B?c0YwQm4vWnU4eFNIQmhGTUhxUE9GY2xkbk0vN1dXNHBWS0VHcWpzY29aQmlK?=
 =?utf-8?B?dzRDRHVXVklnNGlvU0pDaldWVENBMExVQVVoeDU2RGtNNEVGZkdyZm93Z3hw?=
 =?utf-8?B?dDhjQk5oeFUwUXZGSXduUHFEL1M4bitESWs3V0E2SEk4R2tNTk9LZlp1NTRs?=
 =?utf-8?B?U0dSRVpaZ0EzQW1MdWRXRkFEbFU1WnFud1N4TFdCckhaekl4SVRDQUVlSkFo?=
 =?utf-8?B?WXRJdDVKL2V5WTAzc0N6N1VGcXVYRVhlTkludS9KV2lCQXplR1NFMXJsb2hQ?=
 =?utf-8?B?UGtnNzNEQTg2d0hZY0V2U3lQVUhLNnFsWi8vcmdXY05hTzlBWHNsRUVEV2xP?=
 =?utf-8?B?cXpkdVAySFh4OEdnTVl6dmVPS1pDdzJ3bXBSTkZjc3hVTEJidjl2UmE2RjJR?=
 =?utf-8?B?UlE5N1U1S212Y2crbm85WmFwU3ptdXBHMTR1TGhnaUd3N25TRnN6QzZiN281?=
 =?utf-8?B?dTRGNzRLUDZYOFBtQnhaOW5kVEJDMTVnYmpiMGs5KzB5QTRqNHRoZmJPTmVE?=
 =?utf-8?B?ZURhSFNMNWRlNHpUN0MwSXVvN2JKM2dJVVNvZGZZeENOMjZFUmNTWkhXVUFO?=
 =?utf-8?B?TmJUcjduaDNMbU00c05QVG1TejhSWEFYRW9mdmU0NjZYWCsyTXlCOEZybXdJ?=
 =?utf-8?B?S0hnUnZoOXNzcjJ5bit6YzliMjQ4THFXYlVBdUV4aW9HVEVaNE1RMk1TNzRQ?=
 =?utf-8?B?VHdmL09ZRzNvbDk3RXRYVG5PUFNsQS85M0sveXl1UGtGMXUyVFJiZE5vNEJu?=
 =?utf-8?B?Nm92NUJPeW5lZGEvdUNNR2U1U1N0VTNqMy9FWEJsU1VIN3FCeEFKekNBdDZm?=
 =?utf-8?B?UUJyR1JudDhtRzRWcnFGNHhrRXhvblV0N3RDbGtvM25SWEREZWxpSHhwRGx3?=
 =?utf-8?B?TTluNVYrT2E2a1VHbDk4RkV3VzVobllWYzNxOXV2T2JEWlZwakRWc25QRHl6?=
 =?utf-8?Q?SF9+lyhr1IJXBlSMoNkU/OxovGCol35+7+PcM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2sydUh5YXgvY2VCbjBjTGJCM2lMUllGczVNeFV4TUx2bXVnK3djWTY0RnJx?=
 =?utf-8?B?SitxVlp5NkszZTRCcG5ZekdUcURHRlRBRkNoTU1hSHRJNjlwajFmNy9ET0JR?=
 =?utf-8?B?L2M4RlgrSHBLUGNVUWJ3TlYxOUk0Q2pua2dmQzJqMlk5b3pJSXpNeVhyTXYr?=
 =?utf-8?B?bGhncVpWclJJUHJUdmZnSFJDbE5BN0VVcmZkTkJ6SXdWSlJwQjg0b3djUTFh?=
 =?utf-8?B?TWxMNUFpeDhlZ2l6Ri9kbU9jeE5qSjdsUUo3aFEzUEMxMWJqMFk4UlozS29K?=
 =?utf-8?B?ZmM5NGhZMWJhb005K0dQM2QvV3YxQTJMVzUxSU1GSitNVVlYWkFHSVlueDQy?=
 =?utf-8?B?U1VXempNR2lWWncxOXRiZFZiamlma2NGWndaK1lNbkFORll1RHBVMCtWK1Vz?=
 =?utf-8?B?dkZNMlZFYkFKUkhLWWl3NVdXSFlXczVZRjFsOTU3NEpzempFdjFTdzNBWkhh?=
 =?utf-8?B?NTFzRExrdkw3L3BJaU1DTDZVNCtFYU5Md2IreTYxVlJ3NCtRTGdGSG54aitY?=
 =?utf-8?B?WXpuMGZBTTVIRjFCQnVPWjJ1V1VPWEZQelR6TFh4ckIvU1hPZnlOM0xtRHoz?=
 =?utf-8?B?VE9oSFlnbms0ZXBzc1RWcUxpNDJicE5QMlE1Y2RLUHNxWGFNNUNRSTIrbXl4?=
 =?utf-8?B?UkdGYWE1MEl6WGhUU21TM2t2akcyTzNFYS8xSzMxOXYyaUNVNFl3R2YyS2lG?=
 =?utf-8?B?TGpONHNWcFZxNlJpbXJyQkJRWmt3ZG9nU2NWcHdMLzNRRUJjcnZ1RFkxOUdo?=
 =?utf-8?B?enRac2JwZU40TWFxczJHc05DK1NlcFd3MFFRdHJwWmkrZlAwdEtzaFlPampq?=
 =?utf-8?B?MnNTL2FURmd2NlNTSWdkTGNIUFFVR2JTVWVHc0NDYXhzU3kwUDludnJ3UzVC?=
 =?utf-8?B?SGhLeWM2QnAzZUxtSFp5MUI5eWpycWtIU2tVNkZ2U21TQ2RrYTIxQjdjRXM1?=
 =?utf-8?B?dlpBZVpraGxxbDdoS3UvdlBpUnNPQ1V2eUhwVW5IbDl5c01Sc01CTStpWk5D?=
 =?utf-8?B?cEZxSUhvVDdCZU53U0lqaUFzT0tpMTJRN3VlWnVLZTFHQkVHNFlPVCsyOHVN?=
 =?utf-8?B?elRwRWxvMXVScDBBb1o1STVYVXB4Z2cyekVrRVZVMDNBcjhhS1MwVElMeU5C?=
 =?utf-8?B?OGlPZmNTSFovaVFiNVpueVM5Y2dTVHlNYXVqcEh6ZUJDOEM4U1A5QWRjV3Fu?=
 =?utf-8?B?RFROTnMvVFNmS2NyVXM5bUlzMytpSzBvaXU1NDQ4SmVVTmNSS21QQjY3QTM4?=
 =?utf-8?B?WmZheEp0Nno4TnpKN1ZSUjAvZFh5NW9SdGViaXFJS0g2UzltTHZpV1c2b3Z4?=
 =?utf-8?B?Z3ErWWxkMlgrZmY2TDNDN0ZXQ1JVWDRwY1ozdVdYaVZCbUdNeWVrY04ya2lx?=
 =?utf-8?B?MzJhazNMUVc4OWpWV2pnUVpBaVVTZ0diL004SDNWOTZRcWpIbFZScmdzU0VR?=
 =?utf-8?B?ZzdITkRIUmtSZmdUTGVGS1dRWUdid2FMKzd5YmlFMGphK1RSOUovSXV5WlN0?=
 =?utf-8?B?NVFiblJWWGRrMkdib0tITnZwUU4wNkVUQkhEQnMxdjZrbzNjM2J3MzBlbXly?=
 =?utf-8?B?M3dFa1VZQW5tdlF5bXJUNWs3YU5Db2tPTTR0REVoQzViMlRCaEZwU0VkaVhW?=
 =?utf-8?B?NTY5ZmczQlNDNGFta2h1dnE5SFQrL2UxOC82K3Z6WnV6eTlITmNGQWQwWEts?=
 =?utf-8?B?UVRvZGNzeUtmWGU0T1M3V0t1RzNzQU5CZFIwckFzSzBiWWNyZXlhbmJwSWRp?=
 =?utf-8?B?a1NpSU5GbUcveHFCWU96NnRqdWlEdGNaTi9TOGJpcmZTK3dDc1Y1NDhTcWV0?=
 =?utf-8?B?WkJkaElqb1Vmemk1VEZCcmtOZlUxck8wM290TUxIR2RVWGVqVi9vWnNMTEZO?=
 =?utf-8?B?OGFFOWZ3Q1dpbXYrR3pVdTA1RWViNU15OUxkK1hQNGtVc3lDQVJjbE9POG9Q?=
 =?utf-8?B?dzdvTGNlL2RFOWROTFJZME9rbDZHK3RmSWJnbUYrQVRSeDREVlZWTUw0UHBm?=
 =?utf-8?B?V3BDRmFuMXEvbzR6cHU3K09DRmdZbEsyZjdabWduNzVMT3ZYZmY0dVBJcEx0?=
 =?utf-8?B?OEE5R0FsdkIvcVlGVmtVTm9MOGFUdVIySzF3Ui9IMmhSQVVjM0FtMmNCYnRm?=
 =?utf-8?Q?f3D83lYbMiBfAY3QYqCgvpB5N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 044b0695-d6e8-488a-eba8-08ddfaa9f175
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 14:03:16.6632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8o8vQLdMMjiKkbJxmoANQRF6wxTNWciz/sjeYSznW+vADSRZkgWs5oRBn63SQvsQS6j+7soV7kjkWlJ/8fTp5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8151
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



On 9/23/25 01:59, Pekka Paalanen wrote:
> On Mon, 22 Sep 2025 21:16:45 -0600
> Alex Hung <alex.hung@amd.com> wrote:
> 
>> On 9/18/25 02:40, Pekka Paalanen wrote:
>>> On Tue, 16 Sep 2025 17:01:07 -0600
>>> Alex Hung <alex.hung@amd.com> wrote:
>>>    
>>>> On 8/26/25 03:03, Pekka Paalanen wrote:
>>>>> On Thu, 21 Aug 2025 11:54:32 -0600
>>>>> Alex Hung <alex.hung@amd.com> wrote:
>>>>>       
>>>>>> On 8/21/25 06:23, Xaver Hugl wrote:
>>>>>>>> We user space folks have been convinced at this point that the sRGB EOTF
>>>>>>>> is actually gamma 2.2, and not the piece-wise function. Now, if the
>>>>>>>> hardware is actually the piece-wise, then that's what should be exposed,
>>>>>>>> but I'm a bit unsure if we should do that under the name sRGB EOTF.
>>>>>>> Maybe simply rename the enum string to "sRGB piece-wise EOTF"? In
>>>>>>> hindsight, the naming of "srgb" in the Wayland protocol caused a lot
>>>>>>> of confusion, it's better to be explicit about it where possible.
>>>>>>
>>>>>> I will leave this to Harry to comment. He is taking a few days off so I
>>>>>> will check with him later.
>>>>>>      
>>>>>
>>>>> "sRGB inverse OETF"?
>>>>>
>>>>> Strictly speaking "sRGB piece-wise EOTF" is not a thing AFAIU.
>>>>>
>>>>>
>>>>> Thanks,
>>>>> pq
>>>>
>>>> If an extension in future after this proposal is merged, can it be GAMMA
>>>> 2.2 to be [DRM_COLOROP_1D_CURVE_GAMMA22] = "GAMMA 2.2" so it won't
>>>> conflict with current name?
>>>>
>>>> Meanwhile, do we agree to change "sRGB EOTF" as "sRGB Inverse OETF" as
>>>> the following? or do we still want to add "piece-wise"?
>>>
>>> Hi Alex,
>>>
>>> since my previous comment, things have muddied further again. FWIW, we
>>> intend to remove the use of the name "srgb" transfer function
>>> completely from the Wayland protocol as confusing:
>>>
>>> https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/442
>>>
>>> I would recommend the KMS UAPI to similarly avoid the term. I would
>>> recommend "gamma 2.2" or even "power 2.2" and "compound power 2.4" or
>>> such. These names would hopefully not trigger intuition and make people
>>> look at the definition harder. Or any other name you can come up with.
>>>
>>> I agree that "piece-wise sRGB EOTF" would be intuitively clear, but it
>>> may provoke people debating what does IEC 61966-2-1 actually define.
>>> We've had these kind of discussions for Wayland already, and it was
>>> suggested that it is better to define the actual mathematical function
>>> in our specification that to leave it for interpretation from standards.
>>>
>>> For KMS, this should be even easier than for Wayland, because the
>>> hardware implements a specific mathematical function regardless of
>>> where it might have originated or what it is being used for.
>>>    
>>
>> Do you mean the following changes? Userspace use Gamma 2.2, and display
>> driver can decide to use either sRGB piece-wise EOTF or Gamma 2.2 itself.
> 
> Sorry, the driver cannot choose. The UAPI needs to define the curves
> explicitly, and the drivers need to implement those curves exactly(*) or
> not at all. What I propose is, let's not use "sRGB" in any of the names
> for the curves, because that name triggers different assumptions in
> different people.
> 
> (*) "Exactly" is a little vague here. I assume some error tolerance
> needs to be allowed, e.g 1 bit on the electrical value. The maximum
> difference between the two-piece and power-2.2 curves is several code
> points for 8-bit electrical quantization, and that's too much error.
> 
>> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
>> index e1b2b446faf2..3a6c64285d9c 100644
>> --- a/drivers/gpu/drm/drm_colorop.c
>> +++ b/drivers/gpu/drm/drm_colorop.c
>> @@ -71,7 +71,7 @@ static const struct drm_prop_enum_list
>> drm_colorop_type_enum_list[] = {
>>    };
>>
>>    static const char * const colorop_curve_1d_type_names[] = {
>> -       [DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
>> +       [DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "Gamma 2.2",
>>           [DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
>>           [DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
>>           [DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
>> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
>> index 3e70f66940e0..e39379f1a61c 100644
>> --- a/include/drm/drm_colorop.h
>> +++ b/include/drm/drm_colorop.h
>> @@ -48,7 +48,8 @@ enum drm_colorop_curve_1d_type {
>>            * sRGB piece-wise electro-optical transfer function. Transfer
>>            * characteristics as defined by IEC 61966-2-1 sRGB. Equivalent
>>            * to H.273 TransferCharacteristics code point 13 with
>> -        * MatrixCoefficients set to 0.
>> +        * MatrixCoefficients set to 0. This can also be approximated as
>> +        * Gamma 2.2.
> 
> The problem is that "H.273 TransferCharacteristics code point 13" a.k.a
> the sRGB curve means different things for different people (two-piece
> vs. power-2.2).
> 
> The difference is minor but visible, and therefore I would not make
> two-piece and power-2.2 equivalent nor have one approximated by the
> other.
> 
> They both need their own entries in the enum. Let's leave any decision
> about whether substituting one for the other is ok to the userspace.
> 
>>            */
>>           DRM_COLOROP_1D_CURVE_SRGB_EOTF,
>>
>>
>> It is also possible to add GAMMA 2.2 in addition to sRGB piece-wise
>> EOTF. But if I understand correctly, DRM_COLOROP_1D_CURVE_SRGB_EOTF may
>> not be used at all, right?
> 
> If hardware implements the two-piece curve, then there is reason to
> expose it, especially when it does not implement power-2.2. Userspace
> can choose to use it as an approximation when that is appropriate.

Thanks for the clarification. Let me create another enum for Gamma 2.2.

> 
> 
> Thanks,
> pq
> 
>> --- a/drivers/gpu/drm/drm_colorop.c
>> +++ b/drivers/gpu/drm/drm_colorop.c
>> @@ -77,6 +77,7 @@ static const char * const
>> colorop_curve_1d_type_names[] = {
>>           [DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
>>           [DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
>>           [DRM_COLOROP_1D_CURVE_BT2020_INV_OETF] = "BT.2020 Inverse OETF",
>>           [DRM_COLOROP_1D_CURVE_BT2020_OETF] = "BT.2020 OETF",
>> +       [DRM_COLOROP_1D_CURVE_GAMMA22] = "Gamma 2.2",
>>    };
>>
>> Does anyone have comments or concerns if we use the first option?
>>
>> Alex H.
>>
>>>
>>> Thanks,
>>> pq
>>>    
>>>> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
>>>> index 1551b86471ce..90a216c0b6ac 100644
>>>> --- a/drivers/gpu/drm/drm_colorop.c
>>>> +++ b/drivers/gpu/drm/drm_colorop.c
>>>> @@ -71,7 +71,7 @@ static const struct drm_prop_enum_list
>>>> drm_colorop_type_enum_list[] = {
>>>>     };
>>>>
>>>>     static const char * const colorop_curve_1d_type_names[] = {
>>>> -	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
>>>> +	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB Inverse OETF",
>>>>     	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
>>>>     	[DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
>>>>     	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
>>>> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
>>>> index e4250b7d8de8..ce85c52c60c8 100644
>>>> --- a/include/drm/drm_colorop.h
>>>> +++ b/include/drm/drm_colorop.h
>>>> @@ -43,7 +43,7 @@ enum drm_colorop_curve_1d_type {
>>>>     	/**
>>>>     	 * @DRM_COLOROP_1D_CURVE_SRGB_EOTF:
>>>>     	 *
>>>> -	 * enum string "sRGB EOTF"
>>>> +	 * enum string "sRGB Inverse OETF"
>>>>     	 *
>>>>     	 * sRGB piece-wise electro-optical transfer function. Transfer
>>>>     	 * characteristics as defined by IEC 61966-2-1 sRGB. Equivalent
>>>>   
>>>    
>>
> 

