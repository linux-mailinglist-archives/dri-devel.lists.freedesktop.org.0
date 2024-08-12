Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7915F94E532
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 04:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757A710E079;
	Mon, 12 Aug 2024 02:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="VIPjU0b5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2055.outbound.protection.outlook.com [40.107.255.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53B310E074
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 02:49:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DWqoY/Zr46PTIQUuVJjX//MEEf8Jbr1hsJOiFLH68Qdt6AAeJMrAlTdBS8SXebbjKAW1mXf5nVY64Eugnl6JIFekZqpJRFD3ImhYZhRNELfF97fPVJ5TJZ09IWVKP0dkLLM78n/MuRxN+mHiK1f4FTAuERAxz1fqzysZMOC2G3q8If5GF+LuKy/InIMsa/LYgY4W2qsrAc/1QcvQ2fzzbaMc8s7DjTYs6aJqlqe9NjlmJwf0BYtfKq6kSxzWQltTeVbQh99ZVeJ39uwIzvcS2LBM3E5+dl2+v+trDv2G03mcDekV74yMMBr+W+FuU1cOinM24nrTIAsY8wMFrBOpHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8TeGnSOfZKJz+1ZNySWZa8xJaNxZKkId9Ogfe7zE3o=;
 b=BPnbz9FL8EML9Yl+s61Y+CPmLY4qdMsH1wS+ZyCZR/O19Sjaz47lEAVTGGK3pGwA1N0ETuvVMDVtYg2vdPZVgSry2DCtjvuv4+0Viu0aB6CyqYHs4Wd1aBeSDsjei06BXOYsGK8hgHGTF9C4Clu2bTlthRKF5VnkV1Dq+NK19xgD9wv+Of+xkoOcZHc0yc4JeweN1r85ZEmWHPKCNmZZ6c2T8LQRVwmwZplW+PkM8bMnFM7e6OYEXxUGXrWSw/BIPbsA3FNhMiFaLx52lAj47dTjnIbXcLkT8u2M9IJdtfJOvj5/y/0N5fzXrBbpZmdfNsaMwpmrKVYMIms02hFtFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8TeGnSOfZKJz+1ZNySWZa8xJaNxZKkId9Ogfe7zE3o=;
 b=VIPjU0b59DQA/OI7M0UrVyzMgKxaQJPSOrHVfCDcqIQbsklfi+ga2a4eJDftHlTL+07L8f2UJ0E/9dMROyosVD+EgRUkKkGGi1QFIhAZEsG1dkeEQU1xV4Is4df4Rb4jvhyslx9UMlXIh/+Q06AI8RUcNj545l3tOR57YmqOiUZtlJIdi9OaIsEI+QnSlpWZ9xIAwjcWvWBspYEq0FePisFRj9tVKNfjRpufblnE9mhWczIOS1nBMg5oSfQxI0gVrhJkYRiDFwLprbudYdd6lb17hyn+pQfvJa3Obd1JMWLOiEfCuqjpaH7GYBR/0b61tv9hGwNPVbIFXGeI3PCBxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by JH0PR06MB6477.apcprd06.prod.outlook.com (2603:1096:990:33::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 02:49:50 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%4]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 02:49:50 +0000
Message-ID: <b0b7febf-5acd-433c-b479-9b175fc93a53@vivo.com>
Date: Mon, 12 Aug 2024 10:49:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] fix vmap_udmabuf error page set
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <20240805032550.3912454-1-link@vivo.com>
 <20240805032550.3912454-4-link@vivo.com>
 <IA0PR11MB718536A806AE4C4A6CB470B8F8BB2@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <IA0PR11MB718536A806AE4C4A6CB470B8F8BB2@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|JH0PR06MB6477:EE_
X-MS-Office365-Filtering-Correlation-Id: a2fd2499-e316-47b7-4a2b-08dcba796f18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cENkMCtYaHpaVEJuNHJLWis4dTFKSjBNYmhBd1h4UExjL1RqS2NIRWFwbHMy?=
 =?utf-8?B?aUxUUDJVK2dSTVhxN3RoQ0JrbmI1dnM4NThUajdLdGJ2cmJtczBIQVdZYVQ0?=
 =?utf-8?B?R1dJVUorRFJvRGZENElkNXIveStVZjV2VGx3cEJydnhWT1hQUnhzeWNKQW5q?=
 =?utf-8?B?QnEzSk5RUzVXTGNoWW5nempjZDJpaHBQaWk1bzZ0U3pTODBsWVRkcnREM091?=
 =?utf-8?B?Tld3SFZsMXhrK0V3YmFZWXV2TjIyeklmNlNlbGlEUXAvTjk0REF3T3V6aXdu?=
 =?utf-8?B?N3VZcWZNQXNjbytWM3RWaEdZWmtTeWhYVVdJWGFYWHRBK0dlMWhTYnpObE1v?=
 =?utf-8?B?ZzdJUjNITVBSK1QrVFJsNXgvSFhnS1VzQnVoTW5KNW1EeXV6a1BYUitZUWcz?=
 =?utf-8?B?VnFUekczQWJtOHVGNXM3OWZWeVAvTjl4SlJtZlJITmt6RnNlYU1IV3FBM2dF?=
 =?utf-8?B?SVkveGJCMGk3U0RmaVpkQUkwaHVNak43ZWVTS0ZQUDRiejc2Yk9hdE1FNXRi?=
 =?utf-8?B?R0RPOWtwVFRPOWgreVRGQUNrT3BTUk1RVGpqNGhsYXVUWnpUWmExVnVNWWRK?=
 =?utf-8?B?SDJLTFA2QVVRMWRCc3dXcGp0aWdYQ0dHWWJrT2pBOXd4Q0NsamVVZjYvOGht?=
 =?utf-8?B?V05SR2dBYUI2Z3BhaUZDMEJVNzVtZm9EM2UyUG1MTVFGc0xISGl4cWI4MzhI?=
 =?utf-8?B?a1JQQnQwemVmUVAzaU5VUVlJaVBMbGhrNm5icm9mT3cvYUJKM2VadDl3eWpk?=
 =?utf-8?B?M1hVbFJ1aXZJd09FQ1g3cFdCeXIzRkVrMHhQcGZFQ2FFOWhFUy9yTENrcU9E?=
 =?utf-8?B?WThXdGtHYVdRMFpOcnpwTldhVTZkRVZORUR1N3FNYWNYb2dzQTJDUkQybEph?=
 =?utf-8?B?QjZFbE0vR3REMERyNXdkTHAxQ21vVjZ6d21hYXNSMC80SlFVTWdXc1hRYnJP?=
 =?utf-8?B?NHRrdHVjOUFLQURDRUZGTE1ROTBwUFhGME8wVUs5SSszaEZ3S3MrcnlCblVF?=
 =?utf-8?B?Y0IrTzJPRkMvRS9HUnAzam1Wd3J4MC9lMHdub0xWSGlheS82RWV3ZWsrQmVH?=
 =?utf-8?B?Wm1CLzZWNlB4N2Z6RWtXcVJya1hkakxVOERKcitVei9WNytPN3BiSUc2eDZZ?=
 =?utf-8?B?RURIeUNSek9oVEI4UHh1bW9iS1dIV0VMcmlaTjRnY3Bsd1JyUVVEZ1lGa2Mr?=
 =?utf-8?B?d203WVVHOHdFcmp3aC9kWkxWVlB4YlUxemFBVlB2d0J6Qm4zVkJ4anFyeXN6?=
 =?utf-8?B?bzlkWUFlSzF5cU93c2lONXcrdllsWEc4RHVXQ3pPaC9QMzJCdFdmVTMrRnJV?=
 =?utf-8?B?ZHhjdTZOMFh1Um9oNlo3K3dCT3A4eFdlTy96aVczMnpZQlZHNjNpMEJYakg1?=
 =?utf-8?B?S01RWlFkd284dU5XSnhua0hGYlRPUHpVVXRuVkJCc1MveDd0aVErc2J2TE9E?=
 =?utf-8?B?WlBxNkFuOG9zMEtUSnBGMmVhUEhwUXgxN1ZBYkxzR2tLRlU2N09DQ0xrdTdG?=
 =?utf-8?B?MnB1VjhUelNyZC9JUzRaMkkwQ3NramxSYi9XamF0QklPcW9Id2hCWmpRSTdM?=
 =?utf-8?B?ZWdFTEZFdER3dWowdUNGYzdlWUNBTEtKRExoVk43Y2E1ZFh4RjB4V015SHNo?=
 =?utf-8?B?eUVRTzQ1NzBnTCsra05lZkdJaXh1emJtUHhWUE5TQnlDUWV2SnpXSXJlV3l1?=
 =?utf-8?B?Y283VG9KNWpnZ0lrbjVBZXU4QWlWYTBaMUJJYTdZMThzWERJTlIvb1ZFdWZh?=
 =?utf-8?B?YjdtRVlUOGRlaG1MQVNIWFRyVVg5dWJEdmFMVDViS3ljbFIzV0loUmxuTVVj?=
 =?utf-8?B?NEZzc0FkeG5qUDYzbEh3ZlMxUFk2MGZLdEt2akFYbk5YZm9aRHBuZmh1Tk9h?=
 =?utf-8?B?ak91Sys0QjBtaXRNRGl4a0dYbTE0WXZJRUVhR09ma3hZUUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXBGL2ZSQU1jTmdmUHAzbXhqQklMS0F3Z0NTa3Y4YVM4V0t5eENMUjkrOGRG?=
 =?utf-8?B?c2JGTFRZb2F4ejQ4YVRHSWdCSW9UQW43T0dKYjBDL0pmRVo5eEJrTEZWNk0z?=
 =?utf-8?B?bE9tTFE5c1RtbUx4VTZXNkU1THBibWdVRXFudHd4elgrYnhlUWRwQXBTMm5r?=
 =?utf-8?B?Y3FaZU9mTCtrZjB4dWVHN2VsaCtyOWd4T2tLWnJ1ZDV6akJVMWowLzBWaFRX?=
 =?utf-8?B?UjdrS0tkSlI2MytPelFFeUt4aWo2V3c3Uk9xRUY5RjlWZWVnMFdoTFVYNDMw?=
 =?utf-8?B?MVhHUmJGNWw0ZlhLaWFRUlVZSDBSdlcyK2c2b3grcEsxd3ZVNW9Ob3BLbDFR?=
 =?utf-8?B?TzRJVjA3Mzk4OUhoZENETTVJZzBscHlDTjRoSHJ5a3RUU09CeWl0b01rc2NJ?=
 =?utf-8?B?cWJIY01lL29JbTBTd3RIU3BXMTY5c0lESTRUVk9SU0VrUzRKUjUrMVdQWnA5?=
 =?utf-8?B?UHo5eDczSHA5ejJWVTZwbm82a1dIY2VSNDY5WnJlL05GaTFvdFY5YkNyMDJY?=
 =?utf-8?B?Z3lTRVBZRkVnMFNrblhBcXdKN2Z5Rlp5bksyUllzZVovOS8yYmJJVVNCajI0?=
 =?utf-8?B?MDhDRlNCZUh5ZlozbWwySWNMcUFDaW9LRUhoZDhVSzdMa2hNa3ByMnh3Qy9n?=
 =?utf-8?B?OEhXOXJoN0pHUVpYYmtTYU1xZ045dk9WM3ZyRGNZdjRIT3FDY21CWXlkdTF4?=
 =?utf-8?B?WkloVWlkbFhEQXhJZ3NoeEZFVmNoVVk2Ym9rYi9SQjNzZy9HeVVxc1hZWkpq?=
 =?utf-8?B?MzNLbUxDL2VyTWl3MGdnL1VkeElXazFrWXc4UGhsSHlXMzl0eHd5SDYrUjF4?=
 =?utf-8?B?NDEzV1lGQjg0L0oyd2hNdUc2ZnV1d3JvbWZZOFdEWndYOXRjTFhUeDlGcmR6?=
 =?utf-8?B?Nno5UWVsQkgyL1pJTk5hUThscTVLRVpwQnZGZVovSlRrRWFKcmJCMXNaNUVE?=
 =?utf-8?B?RmVpRndSUWhVd1BLTWFLNUxHanJ2U2JyOEd4Vi9VSEtxbGhmYVFYajJsdnRH?=
 =?utf-8?B?MUhMTWVGMkJvT1hZakFPM0hMdStBOGhNZHJPSmZMTnJNeGlRQnlyMDVmZGVn?=
 =?utf-8?B?ZDYycW9JUkM0dmVrMll5ZldGKzY0L2JRU2MvdUJnU3h4L0kwMzJrSEd1ekhF?=
 =?utf-8?B?SGI2MldETFZUT0RSZWx0MVJnZWlCYzJiVUFnNlJWRXFGVXBTL3V4M3hVYmE3?=
 =?utf-8?B?bWdOSjZFeWVlTGZEcW9PTU1qaHp3eC9IcmFjdk5UTXYvaUFaVDlkSjllei9E?=
 =?utf-8?B?Z2tHWnh6TFd3aFpqb2M2NHJPK0dISTBiSDdCaENzbGE0Y3J3UEM1WVZ5bVpF?=
 =?utf-8?B?R0lKTThYL29iNG9ZNk1WNnBnVXFnQ1BIT2tRUVh6WHBqaHpQZkVVUTVQZyts?=
 =?utf-8?B?VFVNeXdlb0Q1dUg1NTV4RzZ5RFU4akJWV3I4dXJtTnFMeGgxRWlVWDhtWS9B?=
 =?utf-8?B?VmlseVNleVJLeWpGdXpXdU5xdS9LQW9vRjJyRWozck1tYTB3ekFOdnBMRHRl?=
 =?utf-8?B?OEpidFkvd0t0L2tlcmE5RWVUaXdobm1ZSHlEcjkreDRQY0t3RDh2WXEySGlU?=
 =?utf-8?B?eE1GWWlvUkxXR3k2UFh3VFFNeVoxbWl3dGJQUXVLTjBDQTZpWFhPWHdiOEhB?=
 =?utf-8?B?UU9qWktwZTZpVHBDSm1MQWZpUzJqU0xacXd6SGRlUGE5V3BxQW5wVEdXTmNW?=
 =?utf-8?B?ZExHamJKRnNnQ1JmUHpoWFBiK2J4ZDdOTzEzWWdwY3plMWhkN0paTG9SQWNw?=
 =?utf-8?B?Wk5jRDJRejVLVjdNaCtCMU9oQXhETk8zdjVVa2dsMmNHaVFOcGxJT2FVYTZJ?=
 =?utf-8?B?M3JFcklLUWIrcjN2N3ZTbXRKNjJvUVNPL1R1bHpNaFZiOTBJWXlaMFhub1RQ?=
 =?utf-8?B?bW5qWlVzUTNCMkFRbkRwM1RGeE9wNkNSY3dyNTlrbTROWit0a2xCc0lHS2xY?=
 =?utf-8?B?WWhUNVozSnBYTFo5M0FUVWd2M1B0VXVHMkNsTm1mcmdmSE9OV3dwY2pMMkUz?=
 =?utf-8?B?aXdMUDV5MnNhbW5CVkFkUy9OdlVQOTBMa0xhTXNrRndWY3EzaHBIOTFCL3BQ?=
 =?utf-8?B?QVhXbmYvOWxtamlvcnp1N2prVFhQOWhIUERhazBXOEwzc2kvQmNPK1ZGcHd1?=
 =?utf-8?Q?SRhyNBxnOL39XlTM81lDC6EUh?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2fd2499-e316-47b7-4a2b-08dcba796f18
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 02:49:49.9112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ldOKywG9FoRG/XO7hK5iectgMS5FGGFGeKpZjpT+zjcWflkR4CZ9hjdEA/ilcX/Xby08nvQNztGtoFRkQ/zJpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6477
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


在 2024/8/10 10:39, Kasireddy, Vivek 写道:
> [Some people who received this message don't often get email from vivek.kasireddy@intel.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Hi Huan,
>
>> Currently vmap_udmabuf set page's array by each folio.
>> But, ubuf->folios is only contain's the folio's head page.
>>
>> That mean we repeatedly mapped the folio head page to the vmalloc area.
>>
>> This patch fix it, set each folio's page correct, so that pages array
>> contains right page, and then map into vmalloc area
>>
>> Signed-off-by: Huan Yang <link@vivo.com>
>> ---
>>   drivers/dma-buf/udmabuf.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index af2391cea0bf..9737f063b6b3 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -78,7 +78,8 @@ static int vmap_udmabuf(struct dma_buf *buf, struct
>> iosys_map *map)
>>                return -ENOMEM;
>>
>>        for (pg = 0; pg < ubuf->pagecount; pg++)
>> -             pages[pg] = &ubuf->folios[pg]->page;
>> +             pages[pg] = folio_page(ubuf->folios[pg],
>> +                                    ubuf->offsets[pg] >> PAGE_SHIFT);
> I believe the correct way to address this issue is to introduce a folio variant
> of vm_map_ram() and use that instead, along with the offsets info.
>
> However, for the time being, I think we can reject vmap of hugetlb folios
> by checking for non-zero offset values.

Do you mean, we do not want to vmap hugetlb folios?  So by check this is 
reasonable.

BTW, I found that recently shmem has started to support mTHP. (Even if 
need enable a switch)

If this, not only hugetlb contains large folio, so ignore offset may not 
too good?(I am not entirely sure whether mTHP can be used with shmem for 
memfd.)

Thanks.

>
> Thanks,
> Vivek
>
>>        vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
>>        kvfree(pages);
>> --
>> 2.45.2
