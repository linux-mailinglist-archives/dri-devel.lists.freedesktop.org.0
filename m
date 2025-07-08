Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CD0AFC329
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 08:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFACA10E58E;
	Tue,  8 Jul 2025 06:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KnN9rLS3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9396610E58A;
 Tue,  8 Jul 2025 06:50:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/cwRu/1nHMuMnh78Ueottcm5QeZQsj21jQhgbQlcoed93HfgRL3hDhJz5CwKPbfz6g9cEQ3NLP7PS0EcuNtiu5o5GmF0qiDOO7w/lh3Zg2WXCxS6LtTbP+jtaMrxrI/0VFhpyAoFZbQRrnsWEhzGkWw1KuBS5zTPzt1UHNI0JgyRjUc6D4FDavMRIryvCEW8exxt37kkSIWlnuYF7VUVuedSTvzjdR+/VUsCniBYwbkePE/o4NESoi+tnTLmn8msDO0prThccF0P1yLbbTgw1m42IOnlFEGQHVeRZRAkVRDQd5pK62lHdjTaMp1LTcM26s3pw3AVt0ltd0J8OWD7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMxEbw3yF3SgJjSW+BwPvhSUtEt+71k0vKT13w+9BlY=;
 b=Y+pnNUPLh9WGjGF5Xkl7sk5rwj9Vkryx2o90jf0ybdGp95zlxMcRWnB4IKYkWWu9E2jRYRDEX8OGrWe3yOUnR83WJ9PTlLDG/YBTRjv4tZ5z8kN/+A5GxaaeantFPbwjrWaAUF6RN0uX/OteKTkQPsHz5REilI22W65iIC+W2bPnrGgFRrjogvxofaalrFZ8l7dLIU7zScryp2oW3LN1RdKrI2qrI4DkD/ro0HO5oAP/qCU6e2KsEP2wqOuiWVa1/IPDaAln/gXFARmkTU3wotvnsmlWG2lJy54/D09Nl0dzKX5JBBoBS4XAdHndffBCVFF7HgxDPgICZi+kbmowqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMxEbw3yF3SgJjSW+BwPvhSUtEt+71k0vKT13w+9BlY=;
 b=KnN9rLS3ipYjYMvpqRdPpo6LlDJbZFB8CCmB5eJTnBntIH4PF9UIHu5N2WD77ua4DbNY0PwwdObMPKj0Fi8FWjjow23Ppq/W8ADstetRXem8i3tf5s8WCog82bxG+k05/QgeeGQuxvXNWknWEE4RWzNfXbKGNMDlfjru/72hGgVqOMkq4eT9u8jXkhNO57XVRpgz3RJhy/84QU1cKLHejkVTmEc04KfmIYlNMqxCRrLE2AGPHs/o45v0a6r88a83ERE4phT0MdVsACryYpjAyRkd8jWnigUWTwgEqswwcANjm/4ApqWpRzAFmmVSPA4dSOnDtIemoERR/85Tgnbbhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 8 Jul
 2025 06:49:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.021; Tue, 8 Jul 2025
 06:49:58 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 08 Jul 2025 15:49:42 +0900
Subject: [PATCH v4 2/8] gpu: nova-core: Clarify sysmembar operations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-nova-docs-v4-2-9d188772c4c7@nvidia.com>
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
X-ClientProxiedBy: TY2PR06CA0003.apcprd06.prod.outlook.com
 (2603:1096:404:42::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: da67c598-f782-4275-d229-08ddbdeba784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlRZRWRIRHBVTlhUZTl0Z1NQSmE2OFFoT29EQkxGdDlaMSs3Mnk1Qm9INEN4?=
 =?utf-8?B?SmJudEZuSUpzVTRTWk5yRUdIRUx4T3FaZGVDMHd4WjFWRWo0VmpxR3I2S01w?=
 =?utf-8?B?bVQxSkJBazBSMng1akdrbCtZZ1dCN2NoSlR4Z1ZQN0tnUFJPNW50b0Zjc3RL?=
 =?utf-8?B?anUxbUwwM2gxOVJMMGljYnQ2OGp5R3Y1TEVSQStqSW9lR2NvMEQwUTA1RXcy?=
 =?utf-8?B?cXFTd3kzc3FXMzBGbjd1VGx0d2VjK2wveUdZV0Zxa04wU1VQUTRwSnRLVkZj?=
 =?utf-8?B?WmRJUExqQ3pYU1FvM3UxRHpTZGUzdVVlZjlhVm5XMVVGSTZ5eEZOT1AxaVRq?=
 =?utf-8?B?dWxUU1UvbTRIV29aNVVJLzg2OTZCSEZiaUY4cEIxSStVR0pEdzVOTTU3ajJS?=
 =?utf-8?B?czQzMFBTMXllOTlRNkVlU2tCUk5EV05ZaEVrQW9LRFJwS3d4NDkxcnpXV3hL?=
 =?utf-8?B?S1UrQVlxN20zUGxmNjlPTjJxYnhEb21lbDBMV291YzcwaXJUQ0xUZ1ZjUU50?=
 =?utf-8?B?MTRpcFRGaGdkaFpGU09yejg4MWVDSVRHWStqYk9Qb0YydGUwdjhySmVyVG1G?=
 =?utf-8?B?M2hMNlEvTFNNN1o0UmxFNkY4UmlOOHJPNUdHR0pwVUFyQ29LQzU3UDFMeE43?=
 =?utf-8?B?eHFTUmc2N1FKQW9rOGVyWW1ENWtzQ2ltallFNzlDeTYwWkpYOXplb2VUanVP?=
 =?utf-8?B?ajlwVS9abzUzYTMzUWlWSytIUFkwMmFjaHU0M29FakhpQzVIV0hpeDVGVTht?=
 =?utf-8?B?TmNRdWVkWSt1R0gxV000OXQyOUJkSkh2dFlMT3FVTjB1dS9NS2V4OFIvWmlO?=
 =?utf-8?B?THh2VE53RU85V01jTk9yMll1U0RXUlZiU3F2RWcrK1g4bmNlNWJ6T3NCdjhh?=
 =?utf-8?B?SmNvaWE2RW03cWJLeHBQT2RueHdsejBaZG52ZGpDK2lTRTg5LzZja0RkdHF2?=
 =?utf-8?B?b2hBSFp3OFdGYWJVcWoyOG9XYU9jaUNEcENZbTBYa1laR1FxUHJ0Tk9KNE5O?=
 =?utf-8?B?ZWJTQ0t2U1RFdWZZa3pNWEZUNG94QjFDTVlQQmVXTjloSVJpKzZKaDE4UHlB?=
 =?utf-8?B?d2VsUlBtWU5uMnU4c0dGODROWllGdVFTZENLbkFuV2NhRFRwVU5ONThSVGhx?=
 =?utf-8?B?ZEFDRU9YS3psZXZ2MnRSMlZ1Y2ZEeHBZbkY0V1RVRC93cGlvb0t5dHdDMUZX?=
 =?utf-8?B?SDZTdHRyNDFZanFiVmpoR21wOGN1V2dLclZ2a2YzVUdCM2p1bU9YQlVPMDd4?=
 =?utf-8?B?NlpYcUxPdGI1eUpoZTVnRWVFOUc4a3k3YUFTSFhGZlZzZlczYnN3eWRZeHdN?=
 =?utf-8?B?OXFCNWZEL0l5Ym4yd3VEMjV3S28vTEk2QnBaVVZCV0VqVUVmNldGWlIveTJK?=
 =?utf-8?B?N1UrSGxGL0t1cVV1WnRHUVpQZVJWUVI1dTBINm9TTFJUZUVNMzhBcGVGTDh0?=
 =?utf-8?B?dFRiLzRpc21TL3pEV0FRZGtmdUxoYS9aQUpMVTJ4R01QeUxpZlI2UEk3NDBR?=
 =?utf-8?B?MHZETUY3L0w0ZzJTbmF3TDRBYlB4cWp5RXl6RHVocWtBdDA3ZlF3RTZSZWp1?=
 =?utf-8?B?S20vdjlGL2t6NDVoMUZneHR6NDk1ZHJxWXN1b2N1NTdGSG5NTHJVeEQ0WE91?=
 =?utf-8?B?MkJxT2V5Sjl2eDg3eUtMcmlwdTVTRFVWb2crV0JHUEpwZ20xN2JVY2ovS1dO?=
 =?utf-8?B?c2owcENKNkhTcnBlNmErbUFuWDZIYmZYc29DSUhzMmYySS9xc2xLOUxWa1g5?=
 =?utf-8?B?a2lIb3FpUk96R2RZMmQvQzRXV3F1ZmhyRHBhZnNHSG9lWlJXSHNTeEt0NnZJ?=
 =?utf-8?B?N0NLRVRVQzlXQTQ1aEpxM3hXUVVGQ1lrK1d6Mk5DMU9tUG1qcHpwWFVmZ2lR?=
 =?utf-8?B?YUJGUUJvWWR2dXVrdTRidC9xYzNnMjdzRmNZT25Sc2tzZTJhR2ZQR1EyTUda?=
 =?utf-8?Q?IZw6vomDBg8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2tpM1NPMElnaFcyUm1tNjZwWDJ3RzlMRzZteVAyVlNFSFUycFpVZ25sbzZx?=
 =?utf-8?B?Y2lORkdjV2xtZVdaaHVvaGVrSEdnYmRuOEpPdURmNmxVSTN5UFFUU1VSdDh6?=
 =?utf-8?B?cXBPOURUdnVDcE1nTVBLb2NIWHh1LzAvbnZWUlE1U0ZLdGFySXZjNmRuQnBp?=
 =?utf-8?B?Qm14RFMzTFEvN0Uyd1J6M2hRWHhJZC93QmVldVBOWVBTYTQvQkk5M3lGRnZO?=
 =?utf-8?B?TVdETEQxdVp6WUFScHFHTDROS2lFMTZMd1NtdkFZYUJSNE13ZWI3UFU3S1ZD?=
 =?utf-8?B?eklHS2hieXlZeGhWVGxZKzloZkxUSDU4M2Rud1d6N2F6YXUzMjdvL2pmeGZt?=
 =?utf-8?B?SFJzYjBiaEU1ZTVqY1piSjVtSmRCUGVTNlpUVUNuTnF1Nm5VRm53VzRlcWxI?=
 =?utf-8?B?Tzg0dC95d2tPTjVEQS9lb3JOSlZJSmZNcWNCTFZqSkQyclZyV0c0eTdVSnVx?=
 =?utf-8?B?LzhVaE5SV1pNRHFuN0YzaGZKWmNNakJvVmlKd3ZISmpla05CUGczcjdxU0pU?=
 =?utf-8?B?TDByemRkZDlrelorYXBUWjhaVFM1Z0lXVkh6eCtDMjBaNHJOZzQ3Ky9LTTFI?=
 =?utf-8?B?YmJCbkthRC80WTM1dWhoUVJwTEc5L3hJUXgrcHpJZUo0cUltQkJZaFExNjJ3?=
 =?utf-8?B?VXFWd0FzeHVTVHNuYW92RlhXR1NYVHoxMllsRUtpMVlQY1NJTmI1bVhvTWtj?=
 =?utf-8?B?d3RZUXpMbCtmYVd6b3RncTZES3RrQmgwU05hdE53OUUzRDhOdTRUc0EwVGZH?=
 =?utf-8?B?NThNRlpRUStZVnhDMnFHbUE3N2ttZ1FYbEUrZU45aUEwaGhHcDhtUzNhL0xI?=
 =?utf-8?B?Umx6NzMxYytOa1BuKy9GbVExRXN3Z2RsMjlxOXAxSWx1eE5KUFBXeCswckJS?=
 =?utf-8?B?dnpGbVdiL3p1YWt5dnpIQmRRTGZUYWFrSE1naGg1NkdFR1pSMkg5b1ZTNjV2?=
 =?utf-8?B?bHN6RE9ES3F5VnZMRGh4aUZYcDhYZC8zQ1dzWVhIYWpXSFBkRWV2R2ZteFBp?=
 =?utf-8?B?RE5HUUhFd0lsdTJ0NllucTVuVmZ1Y2hwVGxScTJCRkw5RGZCclVjSldaZmZJ?=
 =?utf-8?B?OVZHWVE1Q2t0MCtYdXpYbGxGdDhKcHVld3BtS3Z1K0FkdERvcUZ6ZDBhb0NC?=
 =?utf-8?B?TWhJbmZNMWwyaWI0SllBdUVtL3VaaWFad2Z5clIyUWJVdjFBTUVrT1YxVWhx?=
 =?utf-8?B?Ny9SajBlMHp6YWFUanNRaWtDcERQNmRldEY2UlVyMStOSFRGQXFZZHVEMXI2?=
 =?utf-8?B?V2xvZ2pkK0h3ZXR6dXh4ZjVxS2VKTWJOUy8vZlVSbEFWSTQ2N0tEbDM2Z0Fk?=
 =?utf-8?B?OHArZWZsdEpIa2txUEZDUllJclpCcXdYVHJ3bVNTc05vN2huNGFGV01WdHpx?=
 =?utf-8?B?WDRtZWJudDdhaFVRY0VzNU9GQ0FWKytyRkJXeTV6bjJkb2JjVHptN2ozNWxY?=
 =?utf-8?B?VElnRHdNZXNqSUIyTnBnVkY2c2owN21LejlKRFl4d3VOVU53bU9hak5KdEJY?=
 =?utf-8?B?WVJ6MDFWbTRrN0JJVGwvREZ2Q2ZSMnJnZDJXT05tUjhJWmxsK3h2eXF3RGRJ?=
 =?utf-8?B?anRicWRwdmJ2QWpSQXFsMmV0bE12YlQvN0UvcktCSFM2azBiMzVRellFWm5i?=
 =?utf-8?B?V0JRMEJPeW1RYm5IQ1QvRi8wN1ZENFcrY1FJRlVPd0tFMjJTQlFnWmZUUGI2?=
 =?utf-8?B?ZzQ5ZHpWTFg4WDNxNWVGQUovdUtFbHJWaHRxM2VPeEZ0ZDRCaUUxU2x2cGJE?=
 =?utf-8?B?R3N2TDM1ZHRtMFlwTUN0OWQwdndLc0djTmdUbElQdnNYRlI1RnFOZzFVempD?=
 =?utf-8?B?WjQ4YzQzaWM4S0JFSmpTMWZNdU9nVVVtZGpXd0k5OWdwa0ZvZEUzbmUxc0Zx?=
 =?utf-8?B?OW9BeE5WK2N4YlE2am92R0t6T3hUQWI1akdDU2ZZTHRPZ3djMzNWcDI1ZklH?=
 =?utf-8?B?ZC9tWEM3QzhWMjdhVXBMc2lUVlpIMkJsWVBQUHpsWnIyU2c2QlBzRFZsUElX?=
 =?utf-8?B?SFVQU01RdGhIcVdTeDdHRXhXbXFEMWZISmgyV1Z5OFV6UXRKeElDQ2VSSHNH?=
 =?utf-8?B?VnN5SEg3d25Ga0VPV3l6cUFsRW1ZRW1Za1RSYXVacno2Z2Jxb3VJbUw4VE5S?=
 =?utf-8?B?NlBkZXdHTmVtNnJQOHVwbGtKUElOU08zQ0lGYXR0WUhCdm5zWVVYWHNmSHJW?=
 =?utf-8?Q?5E/0vN2gFk5yKR4nyMMqmFumIK1KIHD0Bp1jGui+EJz3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da67c598-f782-4275-d229-08ddbdeba784
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 06:49:58.2986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DKXrx/18QxXCcVb0JOGj7sb2k9voEtswVZQyRBbiX3AGuEkqBW9Sxomx0HFW1P2hjnsmHBqh99yEv+9OsHh2MQ==
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

sysmembar is a critical operation that the GSP falcon needs to perform
in the reset sequence. Add some code comments to clarify.

[acourbot@nvdidia.com: move relevant documentation to SysmemFlush type]

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs   | 10 ++++++++++
 drivers/gpu/nova-core/gpu.rs  |  3 +--
 drivers/gpu/nova-core/regs.rs |  3 +++
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 172b4a12ba2afc05860cc004fd1f0154402f467a..4a702525fff4f394b75fcf54145ba78e34a1a539 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -17,6 +17,16 @@
 /// Type holding the sysmem flush memory page, a page of memory to be written into the
 /// `NV_PFB_NISO_FLUSH_SYSMEM_ADDR*` registers and used to maintain memory coherency.
 ///
+/// A system memory page is required for `sysmembar`, which is a GPU-initiated hardware
+/// memory-barrier operation that flushes all pending GPU-side memory writes that were done through
+/// PCIE to system memory. It is required for falcons to be reset as the reset operation involves a
+/// reset handshake. When the falcon acknowledges a reset, it writes into system memory. To ensure
+/// this write is visible to the host and prevent driver timeouts, the falcon must perform a
+/// sysmembar operation to flush its writes.
+///
+/// Because of this, the sysmem flush memory page must be registered as early as possible during
+/// driver initialization, and before any falcon is reset.
+///
 /// Users are responsible for manually calling [`Self::unregister`] before dropping this object,
 /// otherwise the GPU might still use it even after it has been freed.
 pub(crate) struct SysmemFlush {
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 8e32af16b669ca773e63e184d34c3e0427bc9b76..72d40b0124f0c1a2a381484172c289af523511df 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -170,7 +170,7 @@ pub(crate) struct Gpu {
     bar: Devres<Bar0>,
     fw: Firmware,
     /// System memory page required for flushing all pending GPU-side memory writes done through
-    /// PCIE into system memory.
+    /// PCIE into system memory, via sysmembar (A GPU-initiated HW memory-barrier operation).
     sysmem_flush: SysmemFlush,
 }
 
@@ -283,7 +283,6 @@ pub(crate) fn new(
         gfw::wait_gfw_boot_completion(bar)
             .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete"))?;
 
-        // System memory page required for sysmembar to properly flush into system memory.
         let sysmem_flush = SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?;
 
         let gsp_falcon = Falcon::<Gsp>::new(
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 3bb38197a890bb32d54b9aa4df4d9ebd740dccca..b934ffe8e81390b36f5a39af39a9b9f337aa66bf 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -51,6 +51,9 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
 
 /* PFB */
 
+// These two registers together hold the physical system memory address that is used by the GPU for
+// perform sysmembar operation (see `fb::SysmemFlush`).
+
 register!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR @ 0x00100c10 {
     31:0    adr_39_08 as u32;
 });

-- 
2.50.0

