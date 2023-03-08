Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5938A6AFECE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 07:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1C810E358;
	Wed,  8 Mar 2023 06:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2086.outbound.protection.outlook.com [40.107.96.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951D110E358;
 Wed,  8 Mar 2023 06:17:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OaJENiicQbKuE58GED6JnykOGtUlQZZh1OffgVTJLiI5cb/EjZD9i2unPVviAwPiZbIZQVW0rOcR4UmLWoRaq7lzSXg1zK6811QcgoCoavUBUtsyC0zSg6dcsuXpSR/H+CGmqliQQyPzjKz3hgUUOjQxMh3QDie09bxflB2ikdInQlhq4bbFUZpQv4E3XX/I9IzmvQErjn/5ORw9+/I1lFS4Y+tXhJxfXo2pbT19DtALclAxtjQwr318qqhb7j3br5WS4nZeGtyvUoG/BGkt6qdu6IHMXCLbPZ9cRB8CKpJjmdctTZQcEos8r1ufB1ZoQdpRcvAyqjbymSo/suZAaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j84p8qcXIbZDZLWR3CID3dGcjIfWtCzLr+wIf7/Cpbw=;
 b=Ifsya1R4o4Fdwd1wTSDnqpSe4x/pi442hR+YPsE3+seOLQXULZ1e240zZDbkNVWLPg7nAmYcKspccZtz54fxhOwC6i62Tr9PfEdloelKPpS6kbVEY+qdf1q72gvuxwciiCrhBU8TrV3rMWiWw2sT4u23Iuxrp5f3IGHdkI6B8Ja+Xgofn4NRMkDmxPm5C3WX91sdsJra52Hu7u9ejQmRFvFHG2+GZtDZc+w59rFz1DIU56VuQKyijeAW9xhZka9ieteEvf1rBl+a5kS7DXpecukhETtYDvhrSeAdb5YjFe4JpEVILDAuX8RTfD/7V+nDX8AcU1aDQTYPxzmDtkAgdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j84p8qcXIbZDZLWR3CID3dGcjIfWtCzLr+wIf7/Cpbw=;
 b=C4iA8aNkOoW4aIShuLsSjwhyeooS3HuVny3lfBINDe+/9Yxm9NbwOqtyYEVS51qpSXjUmdAsSGSd4h6+pDX/YjdwRRBRAJWMTlQERBYomX5fE2yjMQewasXuq3CaPqMU7l7hNy17nPHNlSuoYGJaoPaYLbdI/Iw8qAr/VFunBQI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4149.namprd12.prod.outlook.com (2603:10b6:610:7c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 06:17:45 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 06:17:45 +0000
Message-ID: <b919b550-6da8-f9f0-a0eb-0fd8af513817@amd.com>
Date: Wed, 8 Mar 2023 07:17:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [BUG 6.3-rc1] Bad lock in ttm_bo_delayed_delete()
Content-Language: en-US
To: Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20230307212223.7e49384a@gandalf.local.home>
 <20230307212615.7a099103@gandalf.local.home>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230307212615.7a099103@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH2PR12MB4149:EE_
X-MS-Office365-Filtering-Correlation-Id: afce9442-c4d7-4b3a-d69f-08db1f9cd4a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YcE3goUSJiqRLFB2C+sSx0GqVxbIOL9/0tf+k4tIvLfiL4p3PX3RaPS3Pkgx2U/oCZ4jXS2N+AAvYL5tYOMzT7O33NsSxApy4TubpMNJAxGJA6KcPrk+A7DmO2n+eWlbBpEgwhmiO7pQtkJNZYCUrzmbUKYuR+atk/b9AjlNLzbmagtJkgYOoeRHIdGjPaZTEptk8g4tgWKRuMMJACUAG+FMbtV4jZoAyWUy0kBin1m4K+KgRNfpLMekoAY9dTGRztNrRyotC7nX3xltwhImtbzcTAPi+C/gUMSU9D14oIeVInIFE5RVDrgAgIb7g/gCTyFI0A/H9PV4VeCuMcVEhCWl0llkepDS6USbcyd/WhOKX8KMCC8FkWl2WOgII+quGTZ3KGIn7uOKM1JRs4X7s9MPaKcDuRmyqAOvQC/KJCNGTTPEmiIfPgUUjpRj9Bp6Fdi66U9h5Ho3+0dgrXIqishtmWfvCxyBJPKM7mf3tXf0ijVtKTIhND2T6m4hZLrhAIRrpOWjxXVyungrDx/ziXM7RjwYu65b3KJieI40qTHoOnRwgNSvHKTVD0gnCK+W4Tcq8kv5GZbKOt4PurbZZ0JzKkoQJg9nobYjeVsJgYUY8yp8fxdDpgqbQjoqvnsLke6o+sCBWowC5VdXLYHSlt3Eglrb1Ro+glXDe6mV5mAowAAOMW+NmtunP9IGDY4xPh3uCvO6AjAYgpW82v3tMjzBjeP9eXK2nCrUKcGntqk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(451199018)(5660300002)(478600001)(45080400002)(83380400001)(6512007)(6666004)(186003)(2616005)(31696002)(86362001)(6506007)(2906002)(6486002)(36756003)(38100700002)(316002)(41300700001)(66476007)(66556008)(4326008)(8676002)(66946007)(31686004)(8936002)(54906003)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkU0NmNjRFdTYnFFN0hJUlViYjQ5N3NmUkRTQ0N3N3ZicDN3M3M2c0s4aVJX?=
 =?utf-8?B?SEZWZjYyekh1MTlPRXNnZ01xejVVZUJpaEptMHk4Z2pzQUIzbmRLbEQ3VGhM?=
 =?utf-8?B?RFZXSnpkOUhaWDRrb1J4ZFNmT1U3eVE2T0tweHg3M0VaQmcyQW5LM0lCS0c2?=
 =?utf-8?B?QjF5dnZhc1JoSi9jN0h5N0wybmZYd3FKaVVaQmRSeTVMZkNlU0lSZDM0c0NH?=
 =?utf-8?B?RzgrekVqaWZTSEh3Q0pPaUgyc25mQmpORmpqd2hvYkFSUElKR2l4eU5rR2JS?=
 =?utf-8?B?NGFSc0w2VUhHZ3lsK0dYbFlkNi9sdDFjSU9BRDkvQy9jZEVxWDBXRk01SFNr?=
 =?utf-8?B?c0pQYXhkakZjczNQb05EODlxYllQODlvUy9jTWZtM01FSEhXdmVQZG1SYWFE?=
 =?utf-8?B?aHZXNnRtQVJneFRmbHlLNnl3bURod0NBRkJRdGNQclB3TXFyQlIwTFVCa2Va?=
 =?utf-8?B?YlJwV3UyMG1YaGZ2b0J1cHRRUGxZY2RKTVpWazBCYTZpYURHckRCRDN1bWRY?=
 =?utf-8?B?VUlIbUM1emNuWmpiREFUNTlsVjVLMnQ5VDJOYzlKQU9XeUlnaDRNRjJObENr?=
 =?utf-8?B?bjFObENWNmp5MnFUWHRSRVY2YjNLbFNPRUFDeWsxY3gzdHZydWlZU1Bic2dj?=
 =?utf-8?B?ODFTMXQ3bG9HQ3VwVy9FRFF5bVNmV25RTWZxZUNyUFFmRUpMVlo2YVFWU1Qy?=
 =?utf-8?B?L2tSWHdZSXdERitlYjUzdE9XT3dyMThNWGRqRkxrbXhoREs3Z2lCY3MwUlVm?=
 =?utf-8?B?UFNKVWNPdkJWTFBDcFZWRENUTEhDSTZqZm1xZUUxUTFTNE9QVTB2K2REY01X?=
 =?utf-8?B?ajJ6MlVwSEZldXN0NEJVRHhYQWhDVUZ4R2kzVmN3WE9VTlNqNjE4OW9FVWpY?=
 =?utf-8?B?allLZWN1U3RwWEFRTk5IcGZCSDA0d0ZLQTZ3ak9SMTc1aU1La1QzZmtDb0RR?=
 =?utf-8?B?alF5Z29mWlBBTExWbmZNYXJCNW9ubFVsM1F3UlM1RThNU3RsSGpseHVPR3hX?=
 =?utf-8?B?N3ZKTVpaR3FlTzQxcFFJVjRDOXdiLzlBYVFrNDlHQjhKZldNWjJiekg3UkY1?=
 =?utf-8?B?Nks5TFdwVks1cFVHNUJ4aDZNU0dVN3lQc1VSTW80alhkNmZFQnNTaVJDZTlW?=
 =?utf-8?B?VWpveU91RTNZNDg0OEdxdERuc1JvTWVCaStSalFJSEpKdWpXS1VZQ1V4ODJt?=
 =?utf-8?B?VGd0eGxUUEcyendOa1VSRHFZd1ZNVHhsOHNGekNXSWlPVytJWlJkUjRwdXFy?=
 =?utf-8?B?ZjRIbEU2czhwREtiQ3FHdEZXVnZCZmhRK3I5ak5DMk05TVJPelJKbzMvWVFk?=
 =?utf-8?B?b3BHa3NlUDMvRFVMcFZ5aVA1bXNWN2x5UzFIcThWNCt0VzlDS2RTR3dCY0t2?=
 =?utf-8?B?bzdGQTNING8xcmdrNGxTTlpmUUVjbmhFZFA4aFN2Vk9URTl4RUhZVmRzVmU5?=
 =?utf-8?B?RU4rRzhKY3hMUC9pcHhpczJ6czBlalZab0luM2FJZHcxMnNTRTJjZFR0aEtN?=
 =?utf-8?B?Smo1MkhEMVJqYVVCR0NJN21pNnd3eTBrY1NWUWdqSzVURnJ2cnFsNjlkRzU4?=
 =?utf-8?B?a0wzYjNyRGloTStuLytUa1ZkM1VxQVRoTm9aVVFwbjNVVWNUSE5UaFFTSXhU?=
 =?utf-8?B?RS92bmxneWswdW40cVZ5NElhZXZTTEkzR0t6MkRidzVPdFN4Z3IvMzlvN0k2?=
 =?utf-8?B?bGt0OXB2Yi9ON2NhSGNNWW5qdHJvVkZQUlZ2V0FDdnd2YWgzLytMNHFicTBX?=
 =?utf-8?B?OTFzL2ZFWVltYlVQRlBEWHEvZ1pCRkJBbVJSMnFSbGZTRFcwTGlJMzl3S0FC?=
 =?utf-8?B?WFlKeStOZjNDUm5zYmVqZFRmS3Z2dVFFVGVRbjkxVXdKOVZVaFdsdnlXZ2FO?=
 =?utf-8?B?ZG53NWRlK01kZExJZmMzMGNoYnROdE9kNzdkOW9rZzBFbUdXUFRQZDRVaXFE?=
 =?utf-8?B?SXJraUQyczFJV0dZaTRXWThhZ0dyNFJDN1Vqa1ZCMkNsQ3YrMVN0TjBTOTQ1?=
 =?utf-8?B?RmwwNTc2ZU1MZDNGU2JMOGpRQk83SEZ6TllBWVZzM2xZS2lLVjJqejZrVEVQ?=
 =?utf-8?B?RC9jR3VPdlUvR2NKRW13OWgySDl3eEsvYThWZ0tlc1NaTlVFSW8zYWJETndC?=
 =?utf-8?B?NEJHbzRMWFd2Z2lReUtNWmxMRlBkaVFoNlp2dWFjZmFFTUd0WHBGNk5vMGRH?=
 =?utf-8?Q?vDpD+iHXvIQmbljKAk0vVXLdnW8dQKEMguuIhHqeBALc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afce9442-c4d7-4b3a-d69f-08db1f9cd4a0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 06:17:44.8382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yf1r68iPfWEHOyiZjRLe9j1cknwTHJl92mOOc1eZiZzWhUbpfUP419XgLKZLPpe7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4149
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
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.03.23 um 03:26 schrieb Steven Rostedt:
> On Tue, 7 Mar 2023 21:22:23 -0500
> Steven Rostedt <rostedt@goodmis.org> wrote:
>
>> Looks like there was a lock possibly used after free. But as commit
>> 9bff18d13473a9fdf81d5158248472a9d8ecf2bd ("drm/ttm: use per BO cleanup
>> workers") changed a lot of this code, I figured it may be the culprit.
> If I bothered to look at the second warning after this one (I usually stop
> after the first), it appears to state there was a use after free issue.

Yeah, that looks like the reference count was somehow messed up.

What test case/environment do you run to trigger this?

Thanks for the notice,
Christian.

>
> [  206.692285] ------------[ cut here ]------------
> [  206.706333] refcount_t: underflow; use-after-free.
> [  206.720577] WARNING: CPU: 0 PID: 332 at lib/refcount.c:28 refcount_warn_saturate+0xb6/0xfc
> [  206.735810] Modules linked in:
> [  206.749493] CPU: 0 PID: 332 Comm: kworker/0:13H Tainted: G        W          6.3.0-rc1-test-00001-ga98bd42762ed-dirty #965
> [  206.765833] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
> [  206.781767] Workqueue: ttm ttm_bo_delayed_delete
> [  206.796500] EIP: refcount_warn_saturate+0xb6/0xfc
> [  206.811121] Code: 68 50 1c 0d cf e8 66 b3 a9 ff 0f 0b 58 c9 c3 90 80 3d 57 c6 38 cf 00 75 8a c6 05 57 c6 38 cf 01 68 7c 1c 0d cf e8 46 b3 a9 ff <0f> 0b 59 c9 c3 80 3d 55 c6 38 cf 00 0f 85 67 ff ff ff c6 05 55 c6
> [  206.844560] EAX: 00000026 EBX: c2d5f150 ECX: c3ae5e40 EDX: 00000002
> [  206.862109] ESI: c2d5f0bc EDI: f6f91200 EBP: c3ae5f18 ESP: c3ae5f14
> [  206.878773] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010246
> [  206.895665] CR0: 80050033 CR2: ff9ff000 CR3: 0f512000 CR4: 00150ef0
> [  206.912303] Call Trace:
> [  206.927940]  ttm_bo_delayed_delete+0x8c/0x94
> [  206.944179]  process_one_work+0x21a/0x538
> [  206.960605]  worker_thread+0x146/0x398
> [  206.976839]  kthread+0xea/0x10c
> [  206.992696]  ? process_one_work+0x538/0x538
> [  207.008827]  ? kthread_complete_and_exit+0x1c/0x1c
> [  207.025150]  ret_from_fork+0x1c/0x28
> [  207.041307] irq event stamp: 4219
> [  207.056883] hardirqs last  enabled at (4219): [<ced2a039>] _raw_spin_unlock_irqrestore+0x2d/0x58
> [  207.074298] hardirqs last disabled at (4218): [<ce1d3a65>] kvfree_call_rcu+0x155/0x2ec
> [  207.091461] softirqs last  enabled at (3570): [<ced2b113>] __do_softirq+0x2f3/0x48b
> [  207.107979] softirqs last disabled at (3565): [<ce0c84e9>] call_on_stack+0x45/0x4c
> [  207.123827] ---[ end trace 0000000000000000 ]---
>
>
> -- Steve

