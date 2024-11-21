Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24E79D5486
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 22:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A1210E0F1;
	Thu, 21 Nov 2024 21:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dTDZaqIf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2085.outbound.protection.outlook.com [40.107.96.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3468910E0F1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 21:08:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SpQveODOIgZkbhiS8ID6GPiQbo0xbYXKUhDZD3Run7jdWp0Af7ZFxgOyqWn868lxlJv5gFBcwggjTaX7aAtjRmVvdoylqWwusDYSWsj0+5o0BXVI6AYbQ/ng61qCovND4yyOsWn+3Xsqu+PyDPJxPaBtUc4W66uqtMVg8iZ1JwLQUK6bjhN2q+L917nNPa8DoOXWjvK+sjcqzh5YD93jl2A09ZEm0KU+gENa51HfVwCABijp6KIORUckgwGIbuXW6qg+bepl52fUPYFC7r4z13l51VmYAfyzwP6uIbR7nvn8EHSTc9QlxQ+3ikZe0fNmWDF4QHtzHsWVHfCbwNokzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+FxFnla7yPjgBywdFNC3zCmuWOregupoJ5vKG7mN3c=;
 b=JnyKbL5hj307V8Df4jNm9F1s2bxrWDn5lNVgKS3/hIjKttj7RMX5yCSPkT1iqZaKAgwJ//y3zBdSnc1QRhH+F5yi8ii1nxsuJV1vDOja/yXq+PWOQI+uh7KQ2xEdIqL/HXP85fbRPb8rS5xmm9yu5HpaVfBJbgZ/HCT02ATJvNbhBiBTXWFLceK+yjJQ9jFnSSqj7Jq/lCcwz+P6d6RQJUXmT+iKX3GNJbiEOL4eo2/b5F5294GPJCFKGOhDdg7HXsmnnkeuOUx767ubHzCoiAYg6jEPX9TKfl08aI0BvP/fxxf/APOkEpYKXEgqtW+ZYtkbmcXMKzB666UxXuHHHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+FxFnla7yPjgBywdFNC3zCmuWOregupoJ5vKG7mN3c=;
 b=dTDZaqIf/5GRAlbcFo79//NlASMLZisCtGmItV+SBlNcFEgdl9v2YIub4Y6jGYAK5fqgAN86ZGs+KShojgCG36fwCf2uLDH+p9lCZHx5GUSWYZx8IiY5Y9xD6D7uAl5Mb83GJuBUeJ+/tqAqAtA4DoaqiWZLcDVL4znB4aVA+MU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by LV8PR12MB9335.namprd12.prod.outlook.com (2603:10b6:408:1fc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Thu, 21 Nov
 2024 21:08:38 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8158.019; Thu, 21 Nov 2024
 21:08:38 +0000
Message-ID: <9ecac3b6-c21f-4296-a855-ea7280b8b411@amd.com>
Date: Thu, 21 Nov 2024 15:08:31 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 01/13] Documentation: PM: Add documentation for S0ix Standby
 States
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Kyle Gospodnetich <me@kylegospodneti.ch>
References: <20241121172239.119590-1-lkml@antheas.dev>
 <20241121172239.119590-2-lkml@antheas.dev>
 <1e7057cc-c74e-48ff-8585-8b0db58e08bf@amd.com>
 <CAGwozwF9qzinGmyJQQ+KK02troC-u6+vULpExvYE8taYaBHCXw@mail.gmail.com>
 <80653958-2f34-4ed8-b77e-8f82d80ebbea@amd.com>
 <CAGwozwFtbxptqH1ZwLcpjibfRdnm5VvQoLSjAO8mtD=Aw9y=eg@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAGwozwFtbxptqH1ZwLcpjibfRdnm5VvQoLSjAO8mtD=Aw9y=eg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::20) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|LV8PR12MB9335:EE_
X-MS-Office365-Filtering-Correlation-Id: 1795c576-5c6a-4b9c-0e97-08dd0a70ab30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emdzT0FhTVNNNlJsRUJqNXk2U2pUNmFVSTdlakpnbVg5ZjI1N3BSQzArRlIw?=
 =?utf-8?B?bk1vUDFLbG9OQ0p1NmcvR3IveEZJMEdkQUpkZzlkaEI1YS9tU0tnbHcxYk41?=
 =?utf-8?B?eHJEWGZJbDlxTml0ME9ST2JFcFZFSGRtcURIZGM5SWNvc3QwNElEWmVVTGsy?=
 =?utf-8?B?TTFVbWdzOXVwbnBTenJsZ1hTRXRnaVJINGI5ZGRITXZLbCtZUkdMSGE0eDRv?=
 =?utf-8?B?WjhiclJtdVgzMmFza1FmbFpHdEhmOG9iSVhuMnA1c2dFblFzNHhCcFB2dTcw?=
 =?utf-8?B?dmdKa3RBRW5SSU5rUjAzWUNxajNzbnRscEJabk51TE5YMnZkTWVHZzRpek1l?=
 =?utf-8?B?VnVYWFRheGt5REpIOXlnbWNvWE1vbWphZ1YrRHIwUUdoY0VrMUE4a0VjTW14?=
 =?utf-8?B?Y1hpNHFQTVhoWWlOOGV3UmFTZU9PU3d1SWJvaSs1ZWlGNHdBTktwdHkvemlB?=
 =?utf-8?B?R05BMWI4ZEJOQllaQXhQcy9yTTAyb0RNSnNIZllZcmMyQUFKNlB5SlRxOFgw?=
 =?utf-8?B?cExZajRnTkN1U2hySjBpQ1hQVTBBbXVWY0dVMHpmTTFtYUJVa3Z3cnNmY1dN?=
 =?utf-8?B?VjN6VnAveVo1NStQVzc1K0c4Ync3Z2pVNVVTVG5zZjg0cW9iOGdmQmdnclY0?=
 =?utf-8?B?aVhGWWV3aFlHdklxaXJKK0JHYUE5a3lxVm9QYXhTNHdoRnZPNDhRMzFJWVly?=
 =?utf-8?B?QTJZdS9kOFk3R2lOaXU1Z2tJSHBxZ2xFSk1nb2F3aG9HNG5FbTF2VktPWGxE?=
 =?utf-8?B?R2UwVkp0dlMwem1QMmJRd0d5TTRTQkNYM2tlRjQ2aWNhTER6eE9TbmhCT1Qy?=
 =?utf-8?B?MUhUOWNHVEV6OEZBZGdBZDZQWlJSanZrWTZTcTY0T1hiZHMxTjh1Y01pSE1i?=
 =?utf-8?B?aUE3RU9FQkZHZjdSazNycjVrOHFzQWlyQkxmK3kzczhCVVBwdDNWTDlNNmFh?=
 =?utf-8?B?UFdJYmlGRG1OWTlFQTh2UGI3SkZSZkZFaExCd2o0MmduZjVoYmtrWnVlRVZl?=
 =?utf-8?B?UU1aZUFXbWwvT1YzTXRGRXlSaWk3S2FFM1hBQ1BFbkd6amU5MUhaQVdRVG1O?=
 =?utf-8?B?RkVDZVl2dW01OGw1M20vV0lnMW9QUWNkQXFhM0xTZlNwbVFGUkVVUW9XV2E4?=
 =?utf-8?B?OFRuVndaVExxVENFT3U0N3hoQ0J3V3NpZmxiZDlod1ZDcG5NYndLRWcvdzV3?=
 =?utf-8?B?NmFnMFBJUTl2SytlYlVwTG1DWGNFSlFnQWgrcU5EVDVyQ2dwZTYwM0N3OUNU?=
 =?utf-8?B?MUdOR0twa1dkdmpaVDIrTVVqSnRybjkrc3RrSWtBa3hwQWFIa3hjbHBPamJ6?=
 =?utf-8?B?ZHlDSkt3Y1VNVzFXM21yb0JubG1UM2dLWXFJWnlzSmVjb1JIV1daajl0Yy9j?=
 =?utf-8?B?T0FUNjMrcVFlTlVGR2xkd01YQkpGdHU1Z28vR1pBbjJ5aUJ4dFJSZ00yQTB5?=
 =?utf-8?B?L21nMGl6QStLMGxHdi9FcHpnUzI4bGJ4NDRxakV5bCtwK1hyU0p2cVp2am1V?=
 =?utf-8?B?Ui9Yb1Bxd0ZqUFJTNWtKUVo5TGZud0NoZkNteXZVNGh3WS84aWNVUDVuQ09r?=
 =?utf-8?B?UUN3MytlbWRoN055YTg3bjkzb2JqTVlNbStMME5POTdJa29qWW9TMDdwQlA3?=
 =?utf-8?B?V2tTVkFHL2UwMTNCZnJrTVlPWHJtbUJjN3JINDBibUdhaGVaWjQrSWJ4U0hz?=
 =?utf-8?B?V3B2K3o0UHFsYzR6c25nQzFMTnRudlNHSkdNTmZKQ0ZIMHNpYTZOZXRnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzRYd0wyMzgyQXgyZGZCWlo3M1E5dm5oc3I2K0tyM05Vc3RBYzhOYU9qZ3E4?=
 =?utf-8?B?eittZ1lJcDV1akFxakdyK1E3VkJxalJrdTFiUlczUExIajNvaVk2ZnZIbjNX?=
 =?utf-8?B?VXVHaG80aGJLeWxuQy9PdGh1OGdrT3JXTHlwOHFnaVpwR0xLcWR4NW9MOUNo?=
 =?utf-8?B?bjkrZ241RGdPRWx4WTQ3QmFoRVNUZlVML1g4ZzJ4SmNsRHQxRkJGRWJDTGw5?=
 =?utf-8?B?Mm1yMXlqQ0FyenN4L3VHT2JuZVNCM1ZZc2JIS2xQNmpQSWgrQVdkQjVzU2ZT?=
 =?utf-8?B?amsvZjJyMmM3U1VZQklvSEZiVGNXNWdGclFPV1BXTi8xQVVkY3ZSYVJjUmRM?=
 =?utf-8?B?SGxrT0JNM2xhdlFtWk5LM2E4UHNaYmlxV0REakg5bkhoL25mTzhFQ0pwTGx2?=
 =?utf-8?B?b3QzODVubGMvNHFoRjBVS2VBNjluNmNyVFdaT29NelRaLzBCZjBHYmVZK1Ex?=
 =?utf-8?B?aU9pMS9VSEE3aWJZTTI1UDE5YWhLaTZhSEMyMlB4N0d3TktOem9PUzM5YVJi?=
 =?utf-8?B?VXF6bW12L1RiT0oxMUpGbDRIaXl3V2xIbWh6NkJUeFhKOERKaWNVRWExMFZw?=
 =?utf-8?B?aFhLaGl4clp5VVBnaFFnZ2prYkZQUTVDaDZxL3VjbWNYZUd2b3JCUUVJNFk0?=
 =?utf-8?B?WDFGUjFraUZpWWVLQ0ZpQnVpMTJ2R0g0cFRVbklabFgvY2dJeWhmU3JZWUxX?=
 =?utf-8?B?QnlMQWNmeFF0Ti85MVptOGNGd3g0UDMzajBFNWtINnhWZU0xYlJqTHJoLzln?=
 =?utf-8?B?djVuZTBtWC8zR1hWV0ttTXhWdm1RUk1OM0JuYmR6c0hrR2JVVHRqSW0zZ1l1?=
 =?utf-8?B?MFhOMnVzb09MZUZUYWV5Sm1qNnVOdktzdG52c0JFTStPVFBSdlgza3U4N2tH?=
 =?utf-8?B?c012cDlkWnk5bkF2OG9BbG04dm9RQlFIOSs4U1ZZSnRPUjFCWFRpenZMWnoy?=
 =?utf-8?B?S3lQOHpHR3JIWjB6Q1VGclpYaG9QYXA5MXFHM295R3lmZEdLdDFlbDE3ZHZq?=
 =?utf-8?B?Qlk0WGN3L3JLaHVySWxJVlN6MUpja21ZenFOanZaaVJQT292cXZTa2ltRmx5?=
 =?utf-8?B?ZUl4T2J6TEwvRTZhQ0hKa0NFcCtQVTgyTmxEZm9yQ3QyMkJnZjhwQWpTNmNa?=
 =?utf-8?B?Ukw1RUNNcGxLWDZvUzdiM2Q5NEJsMnk1djRLczZ5QkF4UTRROEt1WXlDdXRV?=
 =?utf-8?B?UVh3QnE5NDNmaU5QZlNTSk12ZlFKTHhPamppZkx5WkV5UFVOaU1Zd0E5QUFX?=
 =?utf-8?B?ZENXZHFrMWJjUUNUV0RuYjUrb0xsSUNUR1l2QVdHbEl1bkVwNy9oSkhESHdR?=
 =?utf-8?B?WVdlZmJPZURRbUtPOWZQK2RsbnZmcWRjeFNZakhyNnlueHEwYWNmbHh3ZDhF?=
 =?utf-8?B?Zi9FUjJIZWFGdHBtc1VCTjdWQ2cwMXhoRS9EWTl2ZFoycHc3cHVMS0w3Ziti?=
 =?utf-8?B?dllIeW0vWC9QRWxNYnhLYmRTbk93YVpIMTB6bC91bXF0Vi8wVk56YnRyMDR2?=
 =?utf-8?B?ajFhY3dPb1FyM3VGSjd2Z3AwWXhqZ2FQL2tOamY4VmNLZFlqakpVNndVUmVi?=
 =?utf-8?B?ZlhhdzJabnhyemtxakRvdThaZEJENXFtUmI5OU1jZkJuK1NKZ29JSmJuQStL?=
 =?utf-8?B?OGM1Y2FXUmRhNENUb29pc3l3dy9CM1BFWCtzU1RjeC9lNFhtUHp6OTdPRklC?=
 =?utf-8?B?SmE3VW5yYWo1SGV5VTh1WUtGQU5QMFN4NHBNZmpjZVlLL0xnNWo2S3liM1FZ?=
 =?utf-8?B?eEFXSmhkdnhVbnBneWJkMTl4VHVVSjRWSlhXQVB0WHpCNThSV2gvZHplR0o0?=
 =?utf-8?B?QWhLV08vdTcyaWI3ZTF0ZjlDQ2t6bldrSTBRK3BHUmRKSHhGTnp3ZHludGJa?=
 =?utf-8?B?bDVNVTJZSEdidnQxMnZZWXBVd1p2STRuZlFyaGtzRFFxSWtJQmRhWkFHZUpq?=
 =?utf-8?B?cThaNTdOQWtPNTd3aHdEQm9qc1l2cWlWQ2VsUlB4c0VmNDhRY0xtTGJNbHBa?=
 =?utf-8?B?MlN0Y01Gck9WbVpIOVd0TWdESnppUzdXbFRaOGN1bVorNmZRcW9USGR4L0tS?=
 =?utf-8?B?UWh0OCtnZlRFNFpJclBpSXB3c1Rnb1MzZGhQQ3dmemRVVGR6YkRma2RnQ0Jk?=
 =?utf-8?Q?X+mRA/nwz3VqdnuJV1EHiTLb7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1795c576-5c6a-4b9c-0e97-08dd0a70ab30
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 21:08:38.2597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76jUV5xO96B0o4IH+cRCyJvOlTshNJkd/6XTjBIdk+2QruVjfQ81EVtIpts2aNWJWW3wrzpIBzVDYkNLVUC/WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9335
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

On 11/21/2024 14:33, Antheas Kapenekakis wrote:
> On Thu, 21 Nov 2024 at 20:40, Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>> On 11/21/2024 13:11, Antheas Kapenekakis wrote:
>>> On Thu, 21 Nov 2024 at 19:58, Mario Limonciello
>>> <mario.limonciello@amd.com> wrote:
>>>>
>>>> On 11/21/2024 11:22, Antheas Kapenekakis wrote:
>>>>> Add documentation about the S0ix Standby States that will be exposed
>>>>> to userspace as part of this series.
>>>>>
>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>>>> ---
>>>>>     .../admin-guide/pm/standby-states.rst         | 133 ++++++++++++++++++
>>>>>     Documentation/admin-guide/pm/system-wide.rst  |   1 +
>>>>>     2 files changed, 134 insertions(+)
>>>>>     create mode 100644 Documentation/admin-guide/pm/standby-states.rst
>>>>>
>>>>> diff --git a/Documentation/admin-guide/pm/standby-states.rst b/Documentation/admin-guide/pm/standby-states.rst
>>>>> new file mode 100644
>>>>> index 000000000000..96727574312d
>>>>> --- /dev/null
>>>>> +++ b/Documentation/admin-guide/pm/standby-states.rst
>>>>> @@ -0,0 +1,133 @@
>>>>> +.. SPDX-License-Identifier: GPL-2.0
>>>>> +.. include:: <isonum.txt>
>>>>> +
>>>>> +=====================
>>>>> +S0ix Standby States
>>>>> +=====================
>>>>> +
>>>>> +:Copyright: |copy| 2024 Antheas Kapenekakis
>>>>> +
>>>>> +:Author: Antheas Kapenekakis <lkml@antheas.dev>
>>>>> +
>>>>> +With the advent of modern mobile devices, users have become accustomed to instant
>>>>> +wake-up times and always-on connectivity. To meet these expectations, modern
>>>>> +standby was created, which is a standard that allows the platform to seamlessly
>>>>> +transition between an S3-like low-power idle state and a set of low power active
>>>>> +states, where connectivity is maintained, and the system is responsive to user
>>>>> +input. Current x86 hardware supports 5 different standby states, which are:
>>>>> +"Deepest run-time idle platform state" or "DRIPS" (S3-like), "Sleep", "Resume",
>>>>> +"Screen Off", and "Active".
>>>>> +
>>>>> +The system begins in the "Active" state. Either due to user inactivity or
>>>>> +user action (e.g., pressing the power button), it transitions to the "Screen Off"
>>>>> +state.
>>>>
>>>> So are you implicitly suggesting that userspace should be responsible
>>>> for *telling* the kernel that the screen is off?  I feel some DRM
>>>> helpers are missing to make it easy, but after such helpers are made the
>>>> kernel "should" be able to easily tell this on it's own.
>>>
>>> There are two issues with this
>>>     1) Windows implements a 5 second grace period on idle before firing
>>> that firmware notification [1]. This is also a partial debounce, the
>>> kernel cannot do that reliably or with the finesse required for such a
>>> notification
>>
>> Why can't the kernel do this?  I'm thinking something like this pseudo
>> code that is triggered when number of enabled CRTCs changes:
>>
>> if (in_suspend_sequence)
>>          return;
>> switch (old_num_displays) {
>> case 0:
>>          display_on_cb();
>> default:
>>          schedule_delayed_work(&drm_s2idle_wq);
>> }
>>
>> Then if the "normal" suspend sequence is started the delayed work is
>> cancelled.
>>
>> If the "normal" suspend sequence doesn't start when it fires then it
>> would call the display off callback.
> 
> Fundamentally, it is more complicated and error prone than 2 systemd
> suspend targets that fire at the same time DEs lock the lock screen
> (or any init system for that matter). 

2 userspace jobs for the suspend sequence firing at same time vying for 
similar resources?

That sounds inherently racy.

> This pseudocode also hardcodes
> the delay and does not debounce the display on callback.
> 

If sticking to the Microsoft way of doing this, then it would be 
hardcoded.  But yeah if going this direction it "could" be something 
configurable by userspace.

An actual implementation would need some locking protection like a mutex.

> There is the theoretical risk of a device misbehaving if the callbacks
> fire at the wrong time. But this risk is theoretical and could be
> solved by a device driver quirk that blocks the transition for that
> specific device. Which is also much simpler than trying to hardcode an
> implementation that works with all devices.
> 
>>>     2) Windows clearly states virtual or real and virtual can really
>>> mean anything here.
>>
>> In the context of the kernel, to me this is a DRM driver that has made
>> outputs that are not tied to a physical display.  Does it mean anything
>> else?  They should still be DRM connectors, and they should still have a
>> CRTC AFAICT.
> 
> For all the devices I tested, the display calls change the
> presentation of the device such as RGB or aux devices that drain power
> during suspend. I do not see a connection to DRM. This points me to
> userspace being more appropriate for handling this. It also solves all
> UX edge cases because userspace knows when it is inactive.
> 
> Userspace handling this will not be backwards compatible in the sense
> that it will not fire when the displays turn off with current
> userspace. But it preserves current behavior and as such it is not a
> breaking change.
> 
>>>
>>> In the end, only systemd and the compositor know if both conditions 1
>>> and 2 are met and as such can be responsible for the notification.
>>>
>>> However, if that notification firing before certain CRTCs are
>>> deactivated causes issues, such DRM helpers could be used to block the
>>> transition
>>>
>>> Link: https://learn.microsoft.com/en-us/windows-hardware/design/device-experiences/display--sleep--and-hibernate-idle-timers
>>> [1]
>>>
>>>>> Afterwards, it is free to transition between the "Sleep", "DRIPS", and
>>>>> +"Screen Off" states until user action is received. Once that happens, the system
>>>>> +begins to transition to the "Active" state. From "DRIPS" or "Sleep", it
>>>>> +transitions to "Resume", where the Power Limit (PLx) is restored to its normal
>>>>> +level, to speed up finishing "Sleep". Then, it transitions to "Screen Off".
>>>>> +If on "Screen Off" or after the transition, the display is prepared to turn on
>>>>> +and the system transitions to "Active" alongside turning it on.
>>>>> +
>>>>> +To maintain battery life, in the Windows implementation, the system is allocated
>>>>> +a maximum percentage of battery and time it can use while staying in idle states.
>>>>> +By default, this is 5% of battery or up to 2 days, where the system designer/OEM
>>>>> +is able to tweak these values. If the system exceeds either the battery
>>>>> +percentage or time limit, it enters Hibernation (S4), through a concept
>>>>> +called "Adaptive Hibernate".
>>>>> +
>>>>> +
>>>>> +S0ix Standby States
>>>>> +==================================
>>>>> +The following idle states are supported::
>>>>> +
>>>>> +                 ↓→  <Hibernate (S4)>
>>>>
>>>> I think S4 distracts in this context.
>>>
>>> Sure, can be removed.
>>>
>>>>> +    <DRIPS> ↔ <Sleep> ↔ <Screen Off> ↔ <Active>
>>>>> +        →       →  <Resume>  ↑
>>>>> +
>>>>> +.. _s2idle_drips:
>>>>> +
>>>>> +DRIPS
>>>>> +-----
>>>>> +
>>>>> +The "Deepest run-time idle platform state" or "DRIPS" is the lowest power idle
>>>>> +state that the system can enter. It is similar to the S3 state, with the
>>>>> +difference that the system may wake up faster than S3 and due to a larger number
>>>>> +of interrupts (e.g., fingerprint sensor, touchpad, touchscreen). This state
>>>>> +is entered when the system is told to suspend to idle, through conventional
>>>>> +means (see :doc:`sleep states <sleep-states>`). The system can only transition
>>>>> +to "DRIPS" while it is in the "Sleep" state. If it is not, the kernel will
>>>>> +automatically transition to the "Sleep" state before beginning the suspend
>>>>> +sequence and restore the previous state afterwards. After the kernel has
>>>>> +suspended, the notifications LSP0 Entry and Exit are used.
>>>>> +
>>>>> +.. _s2idle_sleep:
>>>>> +
>>>>> +Sleep
>>>>> +-----
>>>>> +
>>>>> +The "Sleep" state is a low power idle state where the kernel is fully active.
>>>>> +However, userspace has been partially frozen, particularly desktop applications,
>>>>> +and only essential "value adding" activities are allowed to run. This is not
>>>>> +enforced by the kernel and is the responsibility of userspace (e.g., systemd).
>>>>> +Hardware wise, the Sleep Entry and Exit firmware notifications are fired, which
>>>>> +may lower the Power Limit (PLx), pulse the suspend light, turn off the keyboard
>>>>> +lighting or disable a handheld device's gamepad. This state is associated with
>>>>> +the firmware notifications "Sleep Entry" and "Sleep Exit".
>>>>> +
>>>>> +.. _s2idle_resume:
>>>>> +
>>>>> +Resume
>>>>> +------
>>>>> +
>>>>> +The "Resume" state is a faux "Sleep" state that is used to fire the Turn On
>>>>> +Display firmware notification when the system is in the "Sleep" state but
>>>>> +intends to turn on the display. It solves the problem of system designers
>>>>> +limiting the Power Limit (PLx) while the system is in the "Sleep" state causing
>>>>
>>>> AFAIK, PLx is an Intel specific acronym, it's probably better to be more
>>>> generic in documentation.  You mentioned PLx in a commit too.
>>>
>>> Microsoft used this term in their documentation [2]. Can update to
>>> generic terms.
>>>
>>> Link: https://learn.microsoft.com/en-us/windows-hardware/design/device-experiences/modern-standby-firmware-notifications#turn-on-display-notification-function-9
>>> [2]
>>>
>>>>> +the system to wake up slower than desired. This firmware notification is used
>>>>> +to restore the normal Power Limit of the system, while having it stay in the
>>>>> +"Sleep" state.  As such, the system can only transition to the "Resume" state
>>>>> +while in the "Sleep" state and cannot re-transition to the "Sleep" state
>>>>> +afterwards.
>>>>> +
>>>>> +.. _s2idle_screen_off:
>>>>> +
>>>>> +Screen Off
>>>>> +----------
>>>>> +
>>>>> +The "Screen Off" state is the state the system enters when all its displays
>>>>> +(virtual or real) turn off. It is used to signify the user is not actively
>>>>> +using the system. The associated firmware notifications of "Display On" and
>>>>> +"Display Off" are used by manufacturers to turn off certain hardware
>>>>> +components that are associated with the display being on, e.g., a handheld
>>>>> +device's controller and RGB. Windows implements a 5-second grace period
>>>>> +before firing this callback when the screen turns off due to inactivity.
>>>>> +
>>>>> +.. _s2idle_active:
>>>>> +
>>>>> +Active
>>>>> +------
>>>>> +
>>>>> +Finally, the "Active" state is the default state of the system and the one it
>>>>> +has when it is turned on. It is the state where the system is fully operational,
>>>>> +the displays of the device are on, and the user is actively interacting with
>>>>> +the system.
>>>>> +
>>>>> +Basic ``sysfs`` Interface for S0ix Standby transitions
>>>>> +=============================================================
>>>>> +
>>>>> +The file :file:`/sys/power/standby` can be used to transition the system between
>>>>> +the different standby states. The file accepts the following values: ``active``,
>>>>> +``screen_off``, ``sleep``, and ``resume``. File writes will block until the
>>>>> +transition completes. It will return ``-EINVAL`` when asking for an unsupported
>>>>> +state or, e.g., requesting ``resume`` when not in the ``sleep`` state. If there
>>>>> +is an error during the transition, the transition will pause on the last
>>>>> +error-free state and return an error. The file can be read to retrieve the
>>>>> +current state (and potential ones) using the following format:
>>>>> +``[active] screen_off sleep resume``. The state "DRIPS" is omitted, as it is
>>>>> +entered through the conventional suspend to idle path and userspace will never
>>>>> +be able to see its value due to being suspended.
>>>>
>>>> If you follow my above suggestion, I think this file is totally
>>>> unnecessary and then there is no compatibility issue.
>>>>
>>>> It would mean that userspace if it wants to see this "screen off" state
>>>> and associated performance needs to do literally just that - turn the
>>>> screens off.
>>>
>>> Please see the reasoning above for Display On/Off. Also, you omitted
>>> sleep and resume, which have no hardware analogues you can hook into
>>> and are just as important if not more than Display On/Off.
>>
>> I suppose I'm not seeing the argument yet for why "sleep" and HW DRIPS
>> need to be different.  What kind of things would be allowed to run in
>> this state?  Who draws that line?
> 
> The most useful thing would be maintaining some basic connectivity so
> that the device can resume faster if it suspended a couple of minutes
> before and handling transitions such as to hibernation. The transition
> to hibernation is especially important, as if both DPMS and the sleep
> transition fire the transition looks proper. Being able to run certain
> maintenance tasks without changing the presentation of the device from
> sleep (e.g., the APM timer to check the battery level) is important.
> 

These points still seem to argue for "display on" vs "display off" 
though, not a "sleep" vs "HW DRIPS".


> Even without that, if userspace transitions to sleep and fires DPMS
> before beginning freezing and the suspend sequence, it halfs the user
> perceived delay to sleep. It is a big deal. This is a planned feature
> for the next version of bazzite so I am testing it right now. It looks
> really professional.
> 

I feel that what you're mostly vying for is "Dark Resume", which is 
something that exists in the Chrome OS world:

https://chromium.googlesource.com/chromiumos/platform2/+/HEAD/power_manager/docs/dark_resume.md

I feel with cooperation between the compositor and the initiator of 
suspend the same thing can be done outside of ChromeOS.

>> As it stands today the kernel freezes all tasks when suspending, so in
>> this "half" suspend state I feel like there would need to be some sort
>> of allow list, no?
> 
> I do sympathize with this. The most important part would be to lower
> the power limit of the device which the manufacturers can already do
> via the notification and perhaps other kernel drivers could do too.
> Non-root software can be limited by the init system in general.

Why does the power limit specifically need to be lowered?  The goal is 
to avoid excessive power consumption in this kind of state, right?

There are lots of other things that can be done to accomplish this:
For example:
* CPU boost be turned off
* EPP bias be adjusted to efficiency
* NVME APST can be tuned (idle timeout and transition latency tolerance)
See this table for more info on what Microsoft does while in Modern 
Standby: 
https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/power-management-for-storage-hardware-devices-nvme
See this comment in the kernel: 
https://github.com/torvalds/linux/blob/4a4be1ad3a6efea16c56615f31117590fd881358/drivers/nvme/host/core.c#L2503
* Wifi power savings can be enacted

Those are all things clearly that userspace can accomplish.

What I'm getting at is perhaps the "suspend initiator" would be better 
to do things than change the flow from the kernel.

1) Freeze relevant tasks
2) Work with the compositor to disable the display
3) Save/restore EPP, boost, APST and WPS values.
4) After a timeout (or whatever reason) when ready to go into "HW DRIPS" 
then it can call the traditional suspend routine.

Then when the system wakes up from "HW DRIPS" the "suspend initiator" 
can decide when to restore all those values, work with compositor to 
turn on the display etc.

> 
> As a side note, after all tasks have frozen, including compositors,
> you can fire DPMS safely before beginning the suspend sequence for
> backwards compatibility and to lower the span the old framebuffer is
> shown. This would be a useful addition to this series.
> 
>>>
>>>>> +
>>>>> +Before entering the "Screen Off" state or suspending, it is recommended that
>>>>> +userspace marks all CRTCs as inactive (DPMS). Otherwise, there will be a split
>>>>> +second where the display of the device is on, but the presentation of the system
>>>>> +is inactive (e.g., the power button pulses), which is undesirable.
>>>>> \ No newline at end of file
>>>>> diff --git a/Documentation/admin-guide/pm/system-wide.rst b/Documentation/admin-guide/pm/system-wide.rst
>>>>> index 1a1924d71006..411775fae4ac 100644
>>>>> --- a/Documentation/admin-guide/pm/system-wide.rst
>>>>> +++ b/Documentation/admin-guide/pm/system-wide.rst
>>>>> @@ -8,4 +8,5 @@ System-Wide Power Management
>>>>>        :maxdepth: 2
>>>>>
>>>>>        sleep-states
>>>>> +   standby-states
>>>>>        suspend-flows
>>>>
>>

