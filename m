Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9025D90C3A1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 08:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9CE10E1DE;
	Tue, 18 Jun 2024 06:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="q1tVTr+0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5DE10E1DE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 06:33:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzLmQO2vANzlkqIshnofyBhtA0y5AIiJxWYy9yUM+TxQoZqFpWwgVXUkJN9q3zVUsEcwDQwgbLW8uaSby2jTpxeYamB4Z1Y4Puz75zuacwUVq/HLzexlOAzAYhZwq6Sw1wJyJzRY+znlk15UXzTVocVseX1TcnioPheAVhxEiiYGQzq/v9ghRCYU2MJst1tsW5YRTCcBlf7qdbHMuvcXxwWy7IwPfxCHVZz6C7zrHr5c8gSSpj+/zQlt06Bt6iM3iT1lawMo1xusxj4uCpqiO62FUAjmWTe1aGTsTbsDNmL5qp1Tgd3tKECweWiLiLRqbXhskqqSs8R5OPDKd4vdBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+/pLV36q1F0ZCqIFBAoYGsfYfHZZGIWtg7sDNv5GgA=;
 b=NOW5bJrllBryMAodAYSTEMPC+SArfNtZ71psT3bEer3Y0Y12Kq1fmn9WV5BUoZc8WDg7eCYScHzGnk1K4Nh1S/TdDkh00T4MTKPV1DxhNy/wSF1tcguauT/hBp+yNeYpzcAnKK2+heVPN05QxkHYHry/V0bHIrzd1NDm+AgLVOOKK4jHCHNJTl+/bJDxtI/xsDm++mIyk/4twp5qBJxqtGn+I8S8sTXqI+F9VSfBug8hPMCQGnMFUHWU4oGPUt45aOdYvsf/iNwhix6X4OmX9lavpsFda81t/lEc4ph4dUteq2t5NIM+teRHCoesP3hUgTw3Jb48vPCWPMCHkZvIOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+/pLV36q1F0ZCqIFBAoYGsfYfHZZGIWtg7sDNv5GgA=;
 b=q1tVTr+0TOKrt0iSPoKHe6HcRh9jPERfehSc0cGiGtIZ4LYSO0tqxg1tun3PHwW4gF4qOZlrort3rg/vrNOtCZB7zzbsIzxueQxhHXBsksGptvlGw5NNu3W1zlp21rtlvHIn/D4uyoXK8s6+nkE9mosZEJWT81nOEPNuuMNedpI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by DM4PR12MB6566.namprd12.prod.outlook.com (2603:10b6:8:8d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 06:33:47 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%2]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 06:33:47 +0000
Message-ID: <0b00c8f9-fb79-4b11-ae22-931205653203@amd.com>
Date: Tue, 18 Jun 2024 08:33:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Design session notes: GPU acceleration in Xen
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Xenia Ragiadakou
 <burzalodowa@gmail.com>, Ray Huang <ray.huang@amd.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Direct Rendering Infrastructure development
 <dri-devel@lists.freedesktop.org>,
 Qubes OS Development Mailing List <qubes-devel@googlegroups.com>
References: <Zms9tjtg06kKtI_8@itl-email>
 <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com> <ZmvvlF0gpqFB7UC9@macbook>
 <af1f966b-b28f-4a14-b932-3f1523adeff0@suse.com> <ZmwByZnn5vKcVLKI@macbook>
 <Zm-FidjSK3mOieSC@itl-email> <Zm_p1QvoZcjQ4gBa@macbook>
 <ZnCglhYlXmRPBZXE@mail-itl> <ZnDbaply6KaBUKJb@itl-email>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZnDbaply6KaBUKJb@itl-email>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::8) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|DM4PR12MB6566:EE_
X-MS-Office365-Filtering-Correlation-Id: e4355196-0b44-4b39-cce1-08dc8f609bed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0VDUGkraUx5ekEzTExhSkl1U0I5VE9uUUlpZFY2QW9pbzlaZlJITEhWek4r?=
 =?utf-8?B?QmlGSXJra3lYMW84WFFVN05oLzNCZTN6NUVKYUdKcjZFZEZjaUJtSjg0V1Zl?=
 =?utf-8?B?aEtoTjV0MmJVMGJSa2RIWk5rSFcycjJkVWJJWVBsNitZWk95TnlCdW1jNU81?=
 =?utf-8?B?VUM1OVZmcFNVNWZCQzhjV0tPMVpQSFp0ekhRNVVBMWlnakdDMDkwWVB4RXFo?=
 =?utf-8?B?cmcyRDZ4NmcwZGtWUHJXdFI1bGVJQTlVdEJuT3lrNGpKWkVzb2kvM2wwU2lj?=
 =?utf-8?B?eVcrV0NKaUNvRlVKOXZON0F0b2cvUG1BNjFLeUh0OEpPa2Frb1p3S0lleE9H?=
 =?utf-8?B?K2g4ZWRCcWozSm1OLzlBbVkva3gzZ1BDNTcyWDUrUTl3ekNSYTAyQUllSzJJ?=
 =?utf-8?B?dlRWQkloYWFaNXF5amRDK0pCTUdjVmhERWlUZG9CZEV1QXhIMCtvOFdEWmRW?=
 =?utf-8?B?cWRoR0JqU1lQclQ2WWNYMDZsSlhKTFBmQlJrNjdEbXNPbWFvN2xhR1pKei9M?=
 =?utf-8?B?U1FDTm5zcXkzZE5sUVZFZlVFeFpWTnh3blJsaFlFTENFVE4vWDc5UTJwU0dw?=
 =?utf-8?B?SFlXNEFpM2pPN2ZKT0todnl0cnNZM1FoQ21RTzFZTGZJYi9MaFZsN2pPbVRV?=
 =?utf-8?B?d0hsZkh1YWVFaGltaFVoQ3hSS1BaQU9IcmlQTzlvcTZFUWtxWWlDQzRqR1NZ?=
 =?utf-8?B?SkpLQncxQm1qWlJRcmN5OGVMb2pGak9RSThMR0FlcHh1OEJLN3lBVk1GazFW?=
 =?utf-8?B?cGdVM0djcVJDTW94d1JjcjF4NnJZeEg1MTJhWU9wNjhQaDVicGd4aFpxZTl0?=
 =?utf-8?B?SXdOcWJTWXZ4S1R0VExrTDVxc1YxWXc1b0xreTA3Sm44b3FhNVpNb0xPK1lv?=
 =?utf-8?B?UWh5NmVqNUQ4Y1RXck15QWo0cHQxSjRzaE9xU05HQ3NPaDBDNkJWLzl4bDhR?=
 =?utf-8?B?YVVnOWZTNEVKbUF4cC81WXZGZy9KMG5XR0ZFMTdMa2Q0b0xuRkRkT1p3UlR3?=
 =?utf-8?B?Q2JyVEx3aWRmci9GR3FyWUpDamhEZ0xNcnhJYkpSZ1VhNndCYWd0eW9odlU5?=
 =?utf-8?B?cUlKTFU5UUxGdU5wRzVIcGtHZ2xNRG85OXJybDIrTTdJcDMwbGo1RTZoVGd2?=
 =?utf-8?B?enI4UzBXRE5CVlBwMm9nMEV3RjlGOGt4UG05SnFpSmFzMEZEVGovQTAweVpW?=
 =?utf-8?B?Y2lndGZ0dVF4V3hVdjB3eUJzaXVlQ0VYbjhvZUhyWHhqTWJLS2xLZ3lzeWJw?=
 =?utf-8?B?cjlxOHJPcXFiZnpTSXlmZWMzNjNTMkJGT01JV0k2Z2VuMTJEL3J6bG42UmR6?=
 =?utf-8?B?WEFjVFhmNTF2N1ZPaFFOcFQvRnJsQ3dWR2V5WWxGODVkTzJNWVBtUHdldWp0?=
 =?utf-8?B?MmU2N2pLRjg1SzdGb3J0c2dDUlRMUG01emNGTklMMXQyZ2lBa3dFRkhOcHFX?=
 =?utf-8?B?R21YZHM0OEp5QWc5YU5LaTRKb3YvbGFUWnZDZC9iQm9oVUZyYUg1T0NYU09I?=
 =?utf-8?B?ZnVDeW81V2FYV0tZS1VGY2FFUVNaN1ZFbHZ0UjlHVU5QRzFhYUlmNUZCNHlS?=
 =?utf-8?B?aFFRRkVYcU4yKzUrWTRFUHdCcUV5VXJyMkJPN3lZYkV0aEVqN3BGcFA1MkE5?=
 =?utf-8?B?UTJIWGNlZG9wMGFKT2ZSQWhuL01SOXVBWjg2bXJyMElaYjYvYkYvTmE1T21i?=
 =?utf-8?B?VEZmVjB5T2NzemZld0J4SnFKQis5YVY0RDdEV0hMeEpVbERjQjdYMk1DbDB1?=
 =?utf-8?Q?tL7pffzRUJFAp8DYoy6xW5ViWbh0UObbKETcKHz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1VZejg3dDVrZlMzRUpYOFRTQzlXcDBJVDhjNmdtVHhJR2xBbW93ZzNKUWc3?=
 =?utf-8?B?dHh0Y2xxdHdRVVB3SHhHVGkwZ1JxWjExNkZ2bjF1aE12dURQVlZ3YkdQeHBW?=
 =?utf-8?B?RnpCbldGdWt4WnNNdHlSbFdGOTExclBRSU9JRTJNWVE5eWlENmNpUjJUOWNa?=
 =?utf-8?B?ZDJNemJGMEpkMmk2QkpXMkg4dFgxREdZTjQrVXlBWUVDWVFIbWhxWklhVnY3?=
 =?utf-8?B?Z1dITEZUTCtHcmFIdHFXOTZGV0ZDcTRINUQ0UDhWbWpTWHZJY1l1U3V6UUNR?=
 =?utf-8?B?OEZWUXRvMmRIU25UZEtDWlhzaThlWlZyUVV3S1pVSW95TnI1S2QrTGNSNmpq?=
 =?utf-8?B?NzFmczgyVUd3bHd0elhUYjF4YUFFZHBweTRtMUE0Z0xjbTNEZTdkWXdveHBB?=
 =?utf-8?B?NlpKMHhGSXZYWDBYdkd6OG83Q3l5R0h4NDVsUVNiTGFJa2FVQit3Z2I1OENN?=
 =?utf-8?B?UVZqdjQwOUFTTlJIZkxjRWdCQkR5RzczWlZBeUZ4dzUrSHRINFdJc0RERmpQ?=
 =?utf-8?B?TDBJS1czSlJMTUZQMnZ3UnU0dktrYXgxYUNkbVN2SnV4eCtxV1Q0Vm9JRmJa?=
 =?utf-8?B?bWw0bzFyYk1tL3RiYU1OQjhNVXBOaWtGSnlqY3liMEhiTEtYOFltRmQ4WEpU?=
 =?utf-8?B?VVhoRWpGblZvdTMxZ2tnWEt3clBFNXIwbk9RK29aTHFuYitSdlFrREc3TWZL?=
 =?utf-8?B?bm5WUDd5R2dDeTA3NmFja2NybXlLMGZrN3ZvSStwTWNnYll4b2tva3RuVFJP?=
 =?utf-8?B?ekpiOUxBZ0lCclZzS00rUlZSUm9OZk4xVVFRUmU2MW42Uy9HbzArcjBRRG5l?=
 =?utf-8?B?ZVVkUGI2RHJVOXloVHdhQVNTakd5UHEvTFUybjlFaGhkSnVWRUIrWmd2QzF2?=
 =?utf-8?B?S2lLcnFvZFR6NnBDdkVFcm9KcHpQOHVRcUQ5ZHIrbHNsMHlRdmJzdCtlNTFR?=
 =?utf-8?B?MWJpYkdsQm1aMk9rMThpSG43MzNLdDM3YVFvaG1JSWZhQXo2aE1zVHVaOEVK?=
 =?utf-8?B?VjY3M1g5OWRVSEErTXAyZmptOTVWa01zVGJLMW9SQlFJOHBoTUVPSlpQZXpj?=
 =?utf-8?B?WkhnajFGeEtnTDhSMkxnZFVTU2hjMG1UZVZKei9pQXM5Z3BDR3dHMHU4djJl?=
 =?utf-8?B?TTJzN0NpcUMramF2bko4MnRqemx5YWJZYTNmRjc1NWdHVUt6N2VyLy9IeUpy?=
 =?utf-8?B?Smp3c1JLa3d6MFI0VXVzS1BzTklNU2YzWXRaQ2pFQStUTDhETFVRaFIwYzZk?=
 =?utf-8?B?V2Rid3hBVDdhSGhGa0UxQUFzNHQ4WkpmTVhyd1BOYmNFKzcxcGs5YjFYTzZM?=
 =?utf-8?B?cmlKdDBaR0MwZ2dqbnNtRWVLWjRwRkNuRzdwTXVRQXlLbEJNY0h4b0gySzl5?=
 =?utf-8?B?WUhuNkxTWkI2TFo4ckI4RGpNQWxDOHQ5dFgrcUdDeVk5ZFFRU29TMGYvZXdo?=
 =?utf-8?B?Qmd5Y2kzNGJSOUlDMSs2eHJkTEhnTDJsWi9laFp6RDBSS3JlcDZMZEplREJv?=
 =?utf-8?B?N3FXN0NOTDQvelY4S0s4bnJvMVpSU2Y1cTIyL3JFdnExQnNQVjBDNkoydlFy?=
 =?utf-8?B?UE0zd0x2aFZMeldWdlowdDU4UTYvRENEVEtYMWl3Yzh4VDBIU1dOYU5COHBM?=
 =?utf-8?B?VURYbkhVTDZjYjJVQVZRNHgwend5OWNUZ0s3enpBUkh5dVlneGlnQ2c4dkk5?=
 =?utf-8?B?dEhqaVR3eTdYSmdibHJXU0pvM2tySXoweTNjMzdRYzg1djJ0bmZKQXpiYWhk?=
 =?utf-8?B?SFpDekVzWWw1R0FlQnN6cXJlc296cWExandZUU56ak50NkFOREdZbHZDOEYz?=
 =?utf-8?B?WXBGOGtWVXQwamgxRTRSRlNnVEZlb3JvaThiWDB6SnBlTy9jdkF6L2Z4cldu?=
 =?utf-8?B?UmYzMFpXU3JwbzBFbE5PRUVWTlBqOUpxMTR6a21PTVNkcE5FUHVBaThQQUxm?=
 =?utf-8?B?eEdvVmVHbG5tbkdGRXhibWJXRHphWFZhNzNseGpSTitpbmFpKy9RbjFnNmZ0?=
 =?utf-8?B?SEJpN2pwS0U2cDdJVEhkQXFEOUNXUHVUYkRtTEtTRnREKzZKVS92YW1IUFlW?=
 =?utf-8?B?ZUc2bmdWWEQ2cHBJemN1VzF0cUlzcEZ3NmRGdVRIRVFxaWd0eCtBRG1IaTJu?=
 =?utf-8?Q?b87UAhV++DSFGiJf2JYtYryy7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4355196-0b44-4b39-cce1-08dc8f609bed
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 06:33:47.7877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbdHAEG6s0S0mMFAqsF3EduaDZ5XlNI/vvYBjteK21lkmJlRJPeGTd4YmXrxhKxi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6566
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

Am 18.06.24 um 02:57 schrieb Demi Marie Obenour:
> On Mon, Jun 17, 2024 at 10:46:13PM +0200, Marek Marczykowski-Górecki 
> wrote:
> > On Mon, Jun 17, 2024 at 09:46:29AM +0200, Roger Pau Monné wrote:
> >> On Sun, Jun 16, 2024 at 08:38:19PM -0400, Demi Marie Obenour wrote:
> >>> In both cases, the device physical
> >>> addresses are identical to dom0’s physical addresses.
> >>
> >> Yes, but a PV dom0 physical address space can be very scattered.
> >>
> >> IIRC there's an hypercall to request physically contiguous memory for
> >> PV, but you don't want to be using that every time you allocate a
> >> buffer (not sure it would support the sizes needed by the GPU
> >> anyway).
>
> > Indeed that isn't going to fly. In older Qubes versions we had PV
> > sys-net with PCI passthrough for a network card. After some uptime it
> > was basically impossible to restart and still have enough contagious
> > memory for a network driver, and there it was about _much_ smaller
> > buffers, like 2M or 4M. At least not without shutting down a lot more
> > things to free some more memory.
>
> Ouch!  That makes me wonder if all GPU drivers actually need physically
> contiguous buffers, or if it is (as I suspect) driver-specific. CCing
> Christian König who has mentioned issues in this area.

Well GPUs don't need physical contiguous memory to function, but if they 
only get 4k pages to work with it means a quite large (up to 30%) 
performance penalty.

So scattering memory like you described is probably a very bad idea if 
you want any halve way decent performance.

Regards,
Christian.

>
> Given the recent progress on PVH dom0, is it reasonable to assume that
> PVH dom0 will be ready in time for R4.3, and that therefore Qubes OS
> doesn't need to worry about this problem on x86?

