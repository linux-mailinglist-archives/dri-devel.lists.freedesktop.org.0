Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB7ACB2535
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 08:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CAE010E0DA;
	Wed, 10 Dec 2025 07:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PzZm/fX6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6082810E0DA
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 07:53:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E993943FA6;
 Wed, 10 Dec 2025 07:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A54C116B1;
 Wed, 10 Dec 2025 07:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765353191;
 bh=0nzn63khGmeyO92wIH5lyhEhO2plqAVmt3Ik844pU2w=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=PzZm/fX66rdrOYgS2xnN7KP4WdzWwEpgdYR9q9Cc347CYFmd7XCuq7FORIq1aSMe/
 HLkSegfpAPZ+h0JN2guy/Sm8B4Sdx7C3q1arPajaTAJIQZNAQydrVSj8aCI5e/Z9M+
 cByhFHtTaC8HeCh7ZjticooTC2HoOv4lEhTpTzI/hWRrc+gqFdxJzrHb4bQsn+cId7
 z/mamv1wJEn6/SGY7gJ8dlvRCOmdjPsW4VEpeOykrgOlPFmxyhdt125EEcrvS6mZBY
 c3oUzQ7IRzi4zJk8gpexisjbumdE0EURrlQCmvrIQnHzWzJYGWouBCnOmHWHZDKdLe
 0Sbi366kasy9w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B591D3809A18; Wed, 10 Dec 2025 07:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf 1/2] bpf: Fix truncated dmabuf iterator reads
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176535300655.493455.11967888577336619443.git-patchwork-notify@kernel.org>
Date: Wed, 10 Dec 2025 07:50:06 +0000
References: <20251204000348.1413593-1-tjmercier@google.com>
In-Reply-To: <20251204000348.1413593-1-tjmercier@google.com>
To: T.J. Mercier <tjmercier@google.com>
Cc: yonghong.song@linux.dev, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 android-mm@google.com, christian.koenig@amd.com, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
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

Hello:

This series was applied to bpf/bpf.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Wed,  3 Dec 2025 16:03:47 -0800 you wrote:
> If there is a large number (hundreds) of dmabufs allocated, the text
> output generated from dmabuf_iter_seq_show can exceed common user buffer
> sizes (e.g. PAGE_SIZE) necessitating multiple start/stop cycles to
> iterate through all dmabufs. However the dmabuf iterator currently
> returns NULL in dmabuf_iter_seq_start for all non-zero pos values, which
> results in the truncation of the output before all dmabufs are handled.
> 
> [...]

Here is the summary with links:
  - [bpf,1/2] bpf: Fix truncated dmabuf iterator reads
    https://git.kernel.org/bpf/bpf/c/234483565dbb
  - [bpf,2/2] selftests/bpf: Add test for truncated dmabuf_iter reads
    https://git.kernel.org/bpf/bpf/c/9489d457d48b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


